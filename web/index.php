<?php 

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Validator\Constraints\Length;

/*
 * Require dependencies
 */

$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->addPsr4('Site\\', __DIR__.'/../src/');


/*
 * Include main content
 */

include_once 'includes/config.php';
include_once 'includes/services.php';


/*
 * Routes
 */

$app->get('/', function() use ($app)
{
    return $app['twig']->render('pages/home.twig');
})
->bind('home');


$app->get('/albums', function() use ($app)
{
    $data = array();
    
    $albumsModel = new Site\Models\Albums($app['db']);
    $data['albums'] = $albumsModel->getAll();
    
    return $app['twig']->render('pages/albums.twig', $data);
})
->bind('albums');


$app->get('/album/{slug}', function($slug) use ($app)
{
    $data = array();

    $albumsModel = new Site\Models\Albums($app['db']);
    $data['album'] = $albumsModel->getBySlug($slug);

    return $app['twig']->render('pages/album.twig', $data);
})
->assert('slug', '\w+')
->bind('album');


$app->get('/song/{id}', function($id) use ($app)
{
    return $app['twig']->render('pages/song.twig');
})
->value('id', '1')
->assert('id', '\d+')
->bind('song');


$app->match('/contact', function(Request $request) use ($app)
{
    $data = array();

    // Create builder
    $formBuilder = $app['form.factory']->createBuilder();

    // Set method and action
    $formBuilder->setMethod('post');
    $formBuilder->setAction($app['url_generator']->generate('contact'));

    // Add input
    $formBuilder->add(
        'name',
        TextType::class,
        array(
            'label' => 'Nom',
            'required' => false,
            'trim' => true,
            'constraints' => array(
                new Length (
                    array(
                        'min' => 3,
                        'minMessage' => 'Nom trop court',
                        'max' => 20,
                        'maxMessage' => 'Nom trop long'
                    )
                )
            )
        )
    );

    $formBuilder->add(
        'email',
        EmailType::class,
        array(
            'label' => 'Mail de contact',
            'required' => true,
            'trim' => true
        )
    );

    $formBuilder->add(
        'subject',
        ChoiceType::class, 
        array(
            'label' => 'Objet',
            'required' => true,
            'choices' => array(
                'Question' => 'Question',
                'Proposition' => 'Proposition',
                'Autre' => 'Autre'
            )
        )
    );

    $formBuilder->add(
        'message',
        TextareaType::class,
        array(
            'label' => 'Message',
            'required' => true,
            'trim' => true,
            'constraints' => array(
                new Length (
                    array(
                        'min' => 10,
                        'minMessage' => 'Message trop court',
                    )
                )
            )
        )
    );


    $formBuilder->add(
        'submit',
        SubmitType::class,
        array(
            'label' => 'Envoyer'
        )
    );

    // Create form
    $form = $formBuilder->getForm();

    $form->handleRequest($request);

    if($form->isSubmitted() && $form->isValid())
    {
        $formData = $form->getData();

        $message = new \Swift_Message();
        $message->setSubject($formData['subject']);
        $message->setFrom(array($formData['email']));
        $message->setTo(array('contact@reelwens.fr'));
        $message->setBody($formData['message']);

        $app['mailer']->send($message);

        return $app->redirect($app['url_generator']->generate('contact'));
    }
        
        $data['contact_form'] = $form->createView();
        
        return $app['twig']->render('pages/contact.twig', $data);
    })
    ->bind('contact');


$app->error(function() use ($app)
{
    $data = array();
    $data['title'] = 'Error';
    return $app['twig']->render('pages/error.twig', $data);
});


/*
 * Run Silex
 */

$app->run();
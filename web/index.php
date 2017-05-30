<?php 

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Validator\Constraints\Length;

// Require dependendies
$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->addPsr4('Site\\', __DIR__.'/../src/');


// Config
$config = array();
switch($_SERVER['HTTP_HOST'])
{
    case 'localhost':
    case 'localhost:8888':
        $config['debug'] = true;
        $config['db_host'] = 'localhost';
        $config['db_name'] = 'silex-artist';
        $config['db_user'] = 'root';
        $config['db_pass'] = 'root';
        break;

    case 'simonlucas.fr':
        $config['debug'] = false;
        $config['db_host'] = 'localhost';
        $config['db_name'] = 'silex-artist';
        $config['db_user'] = 'silex-artist';
        $config['db_pass'] = '???';
        break;
}


// Init Silex
$app = new Silex\Application();
$app['config'] = $config;
$app['debug'] = true;

// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));

// BDD
$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array (
        'driver'    => 'pdo_mysql',
        'host'      => $app['config']['db_host'],
        'dbname'    => $app['config']['db_name'],
        'user'      => $app['config']['db_user'],
        'password'  => $app['config']['db_pass'],
        'charset'   => 'utf8'
    ),
));

// Form
$app->register(new Silex\Provider\FormServiceProvider());
$app->register(new Silex\Provider\TranslationServiceProvider());
$app->register(new Silex\Provider\ValidatorServiceProvider());
$app->register(new Silex\Provider\LocaleServiceProvider());

$app->register(new Silex\Provider\SwiftmailerServiceProvider(), array(
    'swiftmailer.options' => array(
        'host'       => 'smtp.gmail.com',
        'port'       => 465,
        'username'   => 'smtp.hetic.p2020@gmail.com', // Change it
        'password'   => 'heticp2020smtp',
        'encryption' => 'ssl',
        'auth_mode'  => 'login'
    )
));


$app['db']->setFetchMode(PDO::FETCH_OBJ);


// Middlewares
$app->before(function() use ($app) {
    $app['twig']->addGlobal('title', 'Muse — Catalogue d\'album');
});


/*
 * Create routes
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
            'label' => 'Your name',
            'required' => false,
            'trim' => true, // spaces
            'constraints' => array(
                new Length (
                    array(
                        'min' => 3,
                        'minMessage' => 'Too short',
                        'max' => 20,
                        'maxMessage' => 'Too long'
                    )
                )
            )
        )
    );

    $formBuilder->add(
        'email',
        EmailType::class            
    );

    $formBuilder->add(
        'subject',
        ChoiceType::class, 
        array(
            'label' => 'Subject',
            'required' => true,
            'choices' => array(
                'Informations' => 'Informations',
                'Proposition' => 'Proposition',
                'Other' => 'Other'
            )
        )
    );

    $formBuilder->add(
        'message',
        TextareaType::class,
        array(
            'label' => 'Message',
            'required' => true,
            'trim' => true
        )
    );


    $formBuilder->add(
        'submit',
        SubmitType::class
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
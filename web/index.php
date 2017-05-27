<?php 

// Require dependendies
$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->addPsr4('Site\\', __DIR__.'/../src/');

// Init Silex
$app = new Silex\Application();
$app['debug'] = true;

// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));

// BDD
$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array (
        'driver'    => 'pdo_mysql',
        'host'      => 'localhost',
        'dbname'    => 'silex-artist',
        'user'      => 'root',
        'password'  => '',
        'charset'   => 'utf8'
    ),
));

$app['db']->setFetchMode(PDO::FETCH_OBJ);


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
->value('slug', 'drones')
->assert('slug', '\w+')
->bind('album');


$app->get('/song/{id}', function($id) use ($app)
{
    return $app['twig']->render('pages/song.twig');
})
->value('id', '1')
->assert('id', '\d+')
->bind('song');



/*
 * Run Silex
 */

$app->run();
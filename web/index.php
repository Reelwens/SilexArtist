<?php 

// Require dependendies
require_once __DIR__.'/../vendor/autoload.php';

// Init Silex
$app = new Silex\Application();
$app['debug'] = true;

// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));



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
    return $app['twig']->render('pages/albums.twig');
})
->bind('albums');


$app->get('/album/{id}', function($id) use ($app)
{
    return $app['twig']->render('pages/album.twig');
})
->value('id', '1')
->assert('id', '\d+')
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
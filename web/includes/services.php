<?php

// Services
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../../views',
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
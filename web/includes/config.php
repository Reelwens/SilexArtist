<?php

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

    case 'www.simonlucas.fr':
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
<?php
return [
    'Datasources' => [
        'default' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'OE_DATABASE_HOST',
            'port' => 'OE_DATABASE_PORT',
            'username' => 'OE_DATABASE_USERNAME',
            'password' => 'OE_DATABASE_PASSWORD',
            'database' => 'OE_DATABASE_SCHEMA',
            'encoding' => 'utf8mb4',
            'timezone' => 'UTC',
            'cacheMetadata' => true,
            'quoteIdentifiers' => true,
            //'init' => ['SET GLOBAL innodb_stats_on_metadata = 0'],
        ],
    ],
];

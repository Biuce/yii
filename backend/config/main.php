<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => require(__DIR__ . '/modules.php'),
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-backend',
        ],
        'session' => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-backend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                /**
                 * 错误级别日志：当某些需要立马解决的致命问题发生的时候，调用此方法记录相关信息。
                 * 使用方法：Yii::error()
                */
                [
                    'class' => 'common\components\FileTarget',
                    // 日志等级
                    'levels' => ['error'],
                    // 被收集记录的额外数据
                    'logVars' => ['_GET', '_POST', '_FILES', '_COOKIE', '_SESSION','_SERVER'],
                    // 指定日志保存的文件名
                    'logFile' => '@app/runtime/logs/error/app.log',
                    // 是否开启日志 (@app/runtime/logs/error/20151223_app.log)
                    'enableDatePrefix' => true,
                    'maxFileSize' => 1024 * 1,
                    'maxLogFiles' => 100,
                ],
                /**
                 * 警告级别日志：当某些期望之外的事情发生的时候，使用该方法。
                 * 使用方法：Yii::warning()
                */
                [
                    'class' => 'common\components\FileTarget',
                    // 日志等级
                    'levels' => ['warning'],
                    // 被收集记录的额外数据
                    'logVars' => ['_GET', '_POST', '_FILES', '_COOKIE', '_SESSION','_SERVER'],
                    // 指定日志保存的文件名
                    'logFile' => '@app/runtime/logs/warning/app.log',
                    // 是否开启日志 (@app/runtime/logs/warning/20151223_app.log)
                    'enableDatePrefix' => true,
                    'maxFileSize' => 1024 * 1,
                    'maxLogFiles' => 100,
                ],
                /**
                 * info 级别日志：在某些位置记录一些比较有用的信息的时候使用。
                 * 使用方法：Yii::info()
                 */
                [
                    'class' => 'common\components\FileTarget',
                    // 日志等级
                    'levels' => ['info'],
                    // 被收集记录的额外数据
                    'logVars' => ['_GET', '_POST', '_FILES', '_COOKIE', '_SESSION','_SERVER'],
                    // 指定日志保存的文件名
                    'logFile' => '@app/runtime/logs/info/app.log',
                    // 是否开启日志 (@app/runtime/logs/info/20151223_app.log)
                    'enableDatePrefix' => true,
                    'maxFileSize' => 1024 * 1,
                    'maxLogFiles' => 100,
                ],
                /**
                 * trace 级别日志：记录关于某段代码运行的相关消息。主要是用于开发环境。
                 * 使用方法：Yii::trace()
                 */
                [
                    'class' => 'common\components\FileTarget',
                    // 日志等级
                    'levels' => ['trace'],
                    // 被收集记录的额外数据
                    'logVars' => ['_GET', '_POST', '_FILES', '_COOKIE', '_SESSION','_SERVER'],
                    // 指定日志保存的文件名
                    'logFile' => '@app/runtime/logs/trace/app.log',
                    // 是否开启日志 (@app/runtime/logs/trace/20151223_app.log)
                    'enableDatePrefix' => true,
                    'maxFileSize' => 1024 * 1,
                    'maxLogFiles' => 100,
                ],
            ],
            // 'email' => [
            //     'class' => 'yii\log\EmailTarget',
            //     'levels' => ['error', 'warning'],
            //     'message' => [
            //         'to' => ['admin@techbrood.com', 'support@techbrood.com'],
            //         'subject' => 'New example.com log message',
            //     ],
            // ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        /* 身份认证类 默认yii\web\user */
        'user' => [
            'class' => 'yii\web\User',
            'identityClass' => 'backend\models\Admin',
            'enableAutoLogin' => true,
            'loginUrl' => ['/login/login/index'], //默认登录url
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,//隐藏index.php 
            //'enableStrictParsing' => false,
            //'suffix' => '.html',//后缀，如果设置了此项，那么浏览器地址栏就必须带上.html后缀，否则会报404错误
            'rules' => [
                '<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
            ],
        ],
    ],
    'params' => $params,
];

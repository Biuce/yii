<?php

$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);
return [
    'id' => 'api',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'api\controllers',
    'modules' => [
        'v1' => [
            'class' => 'api\versions\v1\ApiModule'
        ],
    ],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableSession' => false,
        ],
        'response' => [
            'format' => yii\web\Response::FORMAT_JSON,
            'charset' => 'UTF-8',
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
        ],
        'request' => [
            'class' => '\yii\web\Request',
            'enableCookieValidation' => false,
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ],
        ],
        'response' => [
            'class' => 'yii\web\Response',
            'on beforeSend' => function ($event) {
                $response = $event->sender;
                $statusCode = $response->statusCode;
                //redeclare the format of error response
                //except 404 error
                if ($statusCode != 200 && $statusCode != 404 && $statusCode != 500) {
                    switch ($statusCode) {
                        case '429':
                            $msg = '访问过于频繁, 请稍后再试';
                            break;
                        case '401':
                            $statusCode = 10004;
                            $msg = '未登录';
                            $response->setStatusCode(200);
                            break;
                        default:
                            $msg = $response->statusText;
                            break;
                    }
                    $response->data = [
                        'code' => $statusCode,
                        'msg' => $msg,
                    ];
                } else if ($statusCode == '404') {
                    if ($response->format == 'html') {
                        $response->format = 'json';
                        $response->data = [
                            'code' => $statusCode,
                            'msg' => '页面未找到',
                        ];
                    } else {
                        $response->data = [
                            'code' => $statusCode,
                            'msg' => '没有数据',
                            'data' => [],
                        ];
                    }
                }
            },
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['v1/member', ],
                    'pluralize' => false,
                ],
                'GET v1/member/test' => 'v1/member/test',
                'GET share/register' => 'share/register', //分享注册页面
                'POST v1/member/login' => 'v1/member/login',                  //1登录(陈玉东)
                'POST v1/member/setzfpwd' => 'v1/member/set-zfpwd',         //设置支付密码(陈玉东)
                'POST v1/member/updatenick' => 'v1/member/update-nick',     //修改昵称(陈玉东)
                'POST v1/member/updatepwd' => 'v1/member/update-pwd',       //修改登录密码(陈玉东)
                'POST v1/member/resetpassword' => 'v1/user/reset-password',       //忘记密码（陈玉东）不登录
                'POST v1/member/updatereferrer' => 'v1/member/update-referrer',     // 修改推荐人关系（陈玉东）
                'POST v1/member/isphone'=>'v1/member/is-phone',                     //手机号码查询 (陈玉东)
                'GET  v1/member/check'=>'v1/member/check',                          //查询用户是否实名绑卡 (陈玉东)
                'POST v1/index/tips'=>'v1/message/tips',                    //首页公告 (陈玉东)
                'GET  v1/index/tips'=>'v1/message/tips',                    //首页公告 (陈玉东)
                'GET  v1/bank/support' => 'v1/bank/support',                //查看银行卡支持列表 (陈玉东)
                'POST v1/bankcardinfo/getinfo' => 'v1/bankcardinfo/get-info',//银行卡信息查询(陈玉东 不登陆)
                'GET  v1/bankcardinfo/getinfo' => 'v1/bankcardinfo/get-info',//银行卡信息查询(陈玉东 不登陆)
                'POST v1/site/verifycode' => 'v1/site/verifycode',           //校验验证码(陈玉东)
                'GET  v1/message/content'=> 'v1/message/content',            // 消息详情(陈玉东)
                'POST v1/member/active' => 'v1/member/active',               //激活中视用户(陈玉东)

                'POST v1/member/register' => 'v1/user/register',            //2注册（罗文剑）

                'POST v1/current/create'=>'v1/current/create',              //47购买活期理财（熊立）
                'POST v1/regular/create'=>'v1/regular/create',              //46.定期购买（熊立）

                'POST v1/money/contacts' => 'v1/money/contacts',            //73我的人脉v1（金先智）（POST）
                'POST v1/member/authname' => 'v1/member/authname',          //4实名认证v1(POST)(金先智)
                'POST v1/member/avatar' => 'v1/member/avatar',              //13上传头像v1(金先智)(POST)

                'POST v1/bank/othercreate' => 'v1/bank/other-create',       //第三方绑卡(马洪波)
                'POST v1/bank/getcode' => 'v1/bank/get-code',               //快钱重新获取验证码（马洪波）
                'POST v1/bank/othercommit' => 'v1/bank/other-commit',       //75快钱绑卡支付提交(马洪波)
                'POST v1/money/recharge' => 'v1/money/recharge',            //充值(马洪波)
                'POST v1/notify/kuaiqian' => 'v1/notify/kuaiqian',          //快钱回调（马洪波）
                'POST v1/bank/othercreate' => 'v1/bank/other-create',       //71第三方绑卡(马洪波)

                'POST v1/version/new' => 'v1/version/new',                  //16版本更新（王舜峰 不登陆）

                'POST v1/money/withdrawals' => 'v1/money/withdrawals',      //提现(熊兵)

                'POST v1/money/back' => 'v1/money/back',                    //赎回(罗文剑)
                'POST v1/money/yiorder' => 'v1/money/yiorder',              //51易联银行卡支付(罗文剑)
                'POST v1/money/yinotify'=> 'v1/money/yinotify',             //易联回调（罗文剑）

                'POST v1/member/verifypwd' => 'v1/member/verify-pwd',       //验证密码（熊兵）
                'GET v1/money/backrule'=>'v1/money/back-rule',              //赎回规则(熊兵)
                'GET v1/money/withdrawrule' => 'v1/money/withdraw-rule',    //提现规则(熊兵)

                'GET v1/index/icon' => 'v1/index/icon',                     //20首页 （罗文剑 不登陆）
                'GET v1/index/recommend' => 'v1/index/recommend',           //21首页为你推荐（罗文剑 不登陆）
                'GET v1/my/all' => 'v1/my/all',                             //55我的全部投资(罗文剑)
                'GET v1/money/buyback' => 'v1/money/buy-back',              //60定期活期输入金额返回优惠券v1（Get）（金先智）
                'GET v1/money/buydetail' => 'v1/money/buy-detail',          //59定期理财投资结果页面v1(Get)（金先智）
                'GET v1/money/buyrule' => 'v1/money/buy-rule',              //58定期活期投资规则获取v1（Get）（金先智）
                'GET v1/money/mymoney' => 'v1/money/mymoney',               //19我的v1(Get)（金先智）
                'GET v1/member/coupon' => 'v1/member/coupon',               //26我的代金券列表v1(Get)（金先智）
                'GET v1/member/money' => 'v1/member/money',                 //32零钱代金券积分查询（金先智 APP不需要）
                'GET v1/member/coupondetail' => 'v1/member/coupon-detail',  //28我的代金券详情(金先智 APP不需要)


                'GET v1/feedback/list' => 'v1/feedback/list',               //38我的反馈（王舜峰 )
                'POST v1/feedback/commit' => 'v1/feedback/commit',           //40提交反馈（王舜峰 )
                'GET v1/feedback/content' => 'v1/feedback/content',         //39反馈详情（王舜峰 )
                'GET v1/version/about'=>'v1/version/about',                 //37关于钱富宝（王舜峰 )
                'GET v1/index/all'=>'v1/index/all',                         //所有理财列表(王舜峰)
                'GET v1/my/record' => 'v1/my/record',                       //24我的资产记录之充值提现定期活期四种列表（王舜峰 )
                'GET v1/my/recorddetail' => 'v1/my/record-detail',          //29我的资产记录详情（王舜峰 )
                'GET v1/member/profit' => 'v1/member/profit',               //53活期理财详情（王舜峰 )
                'GET v1/regular/waitdetail' => 'v1/regular/wait-detail',    //17我的待收收益(王舜峰)
                'GET v1/money/question'=>'v1/money/question',               //常见问题（王舜峰 APP没这个接口）

                'GET v1/product/detail'=>'v1/product/detail',               //54定期详情（熊立）
                'GET v1/product/buylist'=>'v1/product/buylist',             //56定期活期单个项目投资记录（熊立）
                'GET v1/regular/record'=>'v1/regular/record',               //57定期理财用户投资记录（熊立）
                'GET v1/qfb/list'=>'v1/qfb/list',                           //31我的资产记录(熊立)

                'GET v1/site/code' => 'v1/site/code',                      //获取验证码（陈玉东 不登陆）
                'GET v1/message/list'=> 'v1/message/list',                 //消息列表(陈玉东)
                'GET v1/site/getagreement' => 'v1/site/get-agreement',     //协议（陈玉东 不登陆）
                'GET v1/share/file' => 'v1/share/file',                    //协议地址(陈玉东)
                'GET v1/qfb/share'=>'v1/qfb/share',                         //分享（陈玉东）

                'GET v1/money/payment' => 'v1/money/payment',               //70选择支付方式（马洪波）
                'GET product' => 'product',                                     //产品详情页h5（马洪波）
                'GET agreement' => 'agreement',                                 //协议详情页h5（熊兵）
                'POST v1/notify/zlcallback' => 'v1/notify/zl-callback',       //75快钱绑卡支付提交(马洪波)

                /*************测试添加*************/
                'GET v1/regular/create'=>'v1/regular/create',              //46.定期购买（熊立）
                'GET v1/bank/othercreate' => 'v1/bank/other-create',
                'GET v1/bank/othercommit' => 'v1/bank/other-commit',       //75快钱绑卡支付提交(马洪波)
                'GET v1/notify/zlcallback' => 'v1/notify/zl-callback',       //75快钱绑卡支付提交(马洪波)
                'GET v1/current/create'=>'v1/current/create',
                'GET v1/bank/getcode' => 'v1/bank/get-code',
            ],
        ],
    ],
    'params' => $params,
    //关闭网站的行为
    'as close' => [
        'class' => 'api\common\CloseBehavior',
    ],
    //返回数据前加密的行为
    'as encrypt' => [
        'class' => 'api\common\ResponseEncryptBehavior',
        'actions' => [
            'money/payment',
            'user/login',
            'member/check',
            'money/mymoney',
        ]
    ],
];

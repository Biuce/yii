<?php
return [
    'adminEmail' => 'admin@example.com',
    
    /* 超级管理员的UID */
    'admin' => 1,
    'pageSize' => 3,

    /* 后台错误页面模板 */
    'action_error'     =>  '@backend/views/public/error.php', // 默认错误跳转对应的模板文件
    'action_success'   =>  '@backend/views/public/success.php', // 默认成功跳转对应的模板文件

    /* 后台中的配置参数 */
    'web' => [
        'DATA_BACKUP_PATH' => '/storage/web/database/',
    ],

    /* 后台系统配置 分组 */
    'config_group' => [
        1 => '基本',
        2 => '安全',
        3 => '邮件',
        4 => '搜索',
        // 4 => '系统',
    ],

    /* 后台seo配置 分组 */
    'config_seo' => [
        'index' => '首页',
        'group' => '闪购',
        'brand' => '品牌',
        'point' => '积分中心',
        'article' => '文章',
        'shop' => '商户',
        'product' => '商品',
        'category' => '商品分类',
        'sns' => 'SNS',
    ],
];

<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/H-ui.min.css',
        'css/H-ui.admin.css',
        'css/iconfont.css',
        'css/style.css',
        'lib/zTree/v3/css/zTreeStyle/zTreeStyle.css'
    ];
    public $js = [
        // 'lib/jquery/1.9.1/jquery.min.js',
        'js/layer/2.4/layer.js',
        'js/H-ui.js',
        'js/H-ui.admin.page.js',
        'lib/jquery.validation/1.14.0/jquery.validate.js',
        'lib/jquery.validation/1.14.0/validate-methods.js',
        'lib/jquery.validation/1.14.0/messages_zh.js',
        'lib/My97DatePicker/4.8/WdatePicker.js',
        'lib/datatables/1.10.0/jquery.dataTables.min.js',
        'lib/laypage/1.2/laypage.js',
        'lib/zTree/v3/js/jquery.ztree.all-3.5.min.js',
        ['lib/html5shiv.js', 'condition' => 'lte IE9', 'position' => \yii\web\View::POS_HEAD],
        ['lib/respond.min.js', 'condition' => 'lte IE9', 'position' => \yii\web\View::POS_HEAD],
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}

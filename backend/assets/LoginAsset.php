<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class LoginAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/H-ui.min.css',
        'css/H-ui.login.css',
        'css/style.css',
        'css/iconfont.css'
    ];
    public $js = [
        'js/H-ui.js',
        ['js/html5shiv.js', 'condition' => 'lte IE9', 'position' => \yii\web\View::POS_HEAD],
        ['js/respond.min.js', 'condition' => 'lte IE9', 'position' => \yii\web\View::POS_HEAD],
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}

<?php

use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\Menu */
/* @var $form ActiveForm */

/* ===========================以下为本页配置信息================================= */
/* 页面基本属性 */
$this->title = '添加菜单';
$this->params['title_sub'] = '';  // 在\yii\base\View中有$params这个可以在视图模板中共享的参数

?>
<div class="admin">
    <div class="dux-tools">
        <div class="tools-function clearfix">
            <div class="float-left">
                <a class="btn btn-primary radius" href="<?php echo Url::to(['/menu/menu/index']); ?>">菜单列表</a>
            </div>
        </div>
    </div>
    <article class="page-container">
        <!-- BEGIN FORM-->
        <?= $this->render('_form', [
            'model' => $model,
        ]) ?>
        <!-- END FORM-->
    </article>
</div>


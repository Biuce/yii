<?php

use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;

?>

<?php $form = ActiveForm::begin([
    'options'=>[
        'class'=>"form form-horizontal",
        'id' => 'form-article-add'
    ]
]); ?>
    <div class="row cl">
        <div class="formControls col-xs-8 col-sm-2 col-sm-offset-1">
            <?=$form->field($model, 'title')->textInput(['class'=>'input-text'])->label('标题')->hint('栏目的标题')?>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-8 col-sm-2 col-sm-offset-1">
            <?=$form->field($model, 'sort')->textInput(['class'=>'input-text'])->label('排序值')->hint('数值越小排序越前')?>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-8 col-sm-2 col-sm-offset-1">
            <?=$form->field($model, 'url')->textInput(['class'=>'input-text'])->label('链接')->hint('格式：/index/index&id=2&type=1')?>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-8 col-sm-2 col-sm-offset-1"> 
            <?=$form->field($model, 'pid')->selectList(
                ArrayHelper::merge(['0'=>'一级栏目'],ArrayHelper::listDataLevel( \common\models\Menu::find()->asArray()->all(), 'id', 'title','id','pid')), ['class'=>'form-control select2','widthclass'=>'c-md-2'])->label('上级菜单')->hint('上级菜单描述') ?>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-1">
            <!-- <button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交</button> -->
            <?= Html::button('<i class="Hui-iconfont">&#xe632;</i> 提交', ['class' => 'btn btn-primary radius','type'=>'submit']) ?>
            <?= Html::button('&nbsp;&nbsp;取消&nbsp;&nbsp;', ['class' => 'btn btn-default radius','onClick'=>'removeIframe()']) ?>
        </div>
    </div>
<?php ActiveForm::end(); ?>
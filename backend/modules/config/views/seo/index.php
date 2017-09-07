<?php 

use yii\helpers\Url;
use yii\helpers\Html;
use common\core\ActiveForm;
use backend\assets\AppAsset;
use common\helpers\ArrayHelper;
    
    $this->title = '系统设置';
    $this->params['breadcrumbs'][] = ['label' => '系统管理', 'url' => Url::to(['/config/config/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>    
<div class="Hui-article">
    <article class="cl pd-20">
        <!-- <form action="" method="post" class="form form-horizontal" id="form-article-add"> -->
        
            <div id="tab-system" class="HuiTab">
                <ul class="nav nav-tabs">
                    <?php foreach (Yii::$app->params['config_seo'] as $key => $value) : ?>
                    <?php //if ($key == 0) { continue; } ?>
                    <li <?php echo $key == $type ? 'class="active"' : ''; ?>><a href="<?=Url::toRoute(['/config/seo/index','type'=>$key])?>"><?=$value?>设置</a></li>
                    <?php endforeach ?>
                </ul>

            <?php $form = ActiveForm::begin([
                'options'=>[
                    'class'=>"form form-horizontal",
                    'id' => 'form-article-add'
                ]
            ]); ?>

                <?php if($type == 'index'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                <?php elseif($type == 'group'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'brand'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'point'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'article'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'shop'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'product'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'category'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php elseif($type == 'sns'): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" value="<?php echo $groups->title; ?>" class="input-text" name="title">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->keywords; ?>" class="input-text" name="keywords">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键字描述：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" value="<?php echo $groups->description; ?>" class="input-text" name="description">
                        </div>
                    </div>
                </div>
                <?php endif; ?>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                        <button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
                        <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                    </div>
                </div>
            <?php ActiveForm::end(); ?>

            </div>
    </article>
</div>

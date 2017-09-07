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
                    <?php foreach (Yii::$app->params['config_group'] as $key => $value) : ?>
                    <?php if ($key == 0) { continue; } ?>
                    <li <?php echo $key == $id ? 'class="active"' : ''; ?>><a href="<?=Url::toRoute(['/config/config/index','id'=>$key])?>"><?=$value?>设置</a></li>
                    <?php endforeach ?>
                </ul>

            <?php $form = ActiveForm::begin([
                'options'=>[
                    'class'=>"form form-horizontal",
                    'id' => 'form-article-add'
                ]
            ]); ?>

                <?php if($id == 1): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>网站名称：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-title" placeholder="网站名称，将显示在前台顶部欢迎信息等位置" value="<?php echo $groups['site_name']; ?>" class="input-text" name="site_name">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>前台客服电话: </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" placeholder="显示在网站的底部" value="<?php echo $groups['site_tel400']; ?>" class="input-text" name="site_tel400">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>平台客服联系电话：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-Keywords" placeholder="商家中心右下侧显示，方便商家遇到问题时咨询，多个请用半角逗号 "," 隔开" value="<?php echo $groups['site_phone']; ?>" class="input-text" name="site_phone">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>客服QQ：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-description" placeholder="客服QQ，方便用户联系平台客服" value="<?php echo $groups['site_qq']; ?>" class="input-text" name="site_qq">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>网站Logo：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-static" placeholder="默认网站LOGO,通用头部显示，最佳显示尺寸为240*60像素" value="<?php echo $groups['site_logo']; ?>" class="input-text" name="site_logo">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员中心Logo：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-static" placeholder="网站小尺寸LOGO，会员个人主页显示，最佳显示尺寸为200*40像素" value="<?php echo $groups['member_logo']; ?>" class="input-text" name="member_logo">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商家中心Logo：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-static" placeholder="商家中心LOGO，最佳显示尺寸为150*40像素，请根据背景色选择使用图片色彩" value="<?php echo $groups['seller_center_logo']; ?>" class="input-text" name="seller_center_logo">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>微信二维码：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-static" placeholder="放在网站右上角顶部及首页底部右下角,最佳显示尺寸为66*66像素" value="<?php echo $groups['site_logowx']; ?>" class="input-text" name="seller_center_logo">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上传目录配置：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-uploadfile" placeholder="默认为uploadfile" value="<?php echo $groups['upload_config']; ?>" class="input-text" name="upload_config">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>底部版权信息：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="website-copyright" placeholder="&copy; 2014 H-ui.net" value="<?php echo $groups['icp_number']; ?>" class="input-text" name="icp_number">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">统计代码：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <textarea class="textarea" name="statistics_code"><?php echo $groups['statistics_code']; ?></textarea>
                        </div>
                    </div>
                </div>
                <?php elseif($id == 2): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">允许访问后台的IP列表：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <textarea class="textarea"></textarea>
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">后台登录失败最大次数：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="" value="5" class="input-text">
                        </div>
                    </div>
                </div>
                <?php elseif($id == 3): ?>
                <div style="display:block">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">SMTP服务器：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="" value="<?php echo $groups['email_host']; ?>" placeholder="设置 SMTP 服务器的地址，如 smtp.163.com" class="input-text" name="email_host">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">SMTP 端口：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="" value="<?php echo $groups['email_port']; ?>" placeholder="设置 SMTP 服务器的端口，默认为 25" class="input-text" name="email_port">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">发信人邮件地址：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="" value="<?php echo $groups['email_addr']; ?>" placeholder="使用SMTP协议发送的邮件地址，如 sykjshop@163.com" class="input-text" name="email_addr">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">SMTP 身份验证用户名：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" id="email-name" value="<?php echo $groups['email_id']; ?>" placeholder="如 sykjshop" class="input-text" name="email_id">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">SMTP 身份验证密码：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="password" id="email-password" value="<?php echo $groups['email_pass']; ?>" placeholder="sykjshop@163.com邮件的密码，如 123456" class="input-text" name="email_pass">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">测试接收的邮件地址：</label>
                        <div class="formControls col-xs-5 col-sm-6">
                            <input type="text" id="email-address" value="" class="input-text" > 
                        </div>
                        <div class="formControls col-xs-1 col-sm-2">
                            <input type="button" value="测试" name="send_test_email" class="Hui-iconfont btn btn-primary radius size-S" id="send_test_email">
                        </div>
                    </div>
                </div>
                <?php elseif($id == 4): ?>
                    <div style="display:block"> 
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">统计代码：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <textarea class="textarea" name="hot_search"><?php echo $groups['hot_search']; ?></textarea>
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

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script> 

<script>    
<?php $this->beginBlock('js_end') ?>    
　$(function(){

    $.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","0");
});    
<?php $this->endBlock(); ?>    
</script>    
<?php $this->registerJs($this->blocks['js_end'],\yii\web\View::POS_LOAD);//将编写的js代码注册到页面底部 ?> 
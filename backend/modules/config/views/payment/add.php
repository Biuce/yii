<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;

    // AppAsset::register($this);
    
    $this->title = '支付方式列表';
    $this->params['breadcrumbs'][] = ['label' => '支付方式添加', 'url' => Url::to(['/config/payment/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
	<!-- <form action="" method="post" class="form form-horizontal" id="form-admin-add"> -->
	<?php $form = ActiveForm::begin([
        'options'=>[
            'class'=>"form form-horizontal",
            'id' => 'form-admin-add'
        ]
    ]); ?>
    	<?php if($model['payment_code'] == 'alipay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_service']; ?>" class="input-text" name="alipay_service">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付宝账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_account']; ?>" class="input-text" name="alipay_account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交易安全校验码（key）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_key']; ?>" class="input-text" name="alipay_key">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合作者身份（partner ID）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_partner']; ?>" class="input-text" name="alipay_partner">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'tenpay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>财付通账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['tenpay_account']; ?>" class="input-text" name="tenpay_account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交易安全校验码（key）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['tenpay_key']; ?>" class="input-text" name="tenpay_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'chinabank'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>网银在线账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['chinabank_account']; ?>" class="input-text" name="chinabank_account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交易安全校验码（key）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['chinabank_key']; ?>" class="input-text" name="chinabank_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'wxpay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>APPID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['weixin_appid']; ?>" class="input-text" name="weixin_appid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>APPSECRET：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['weixin_appsecret']; ?>" class="input-text" name="weixin_appsecret">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['weixin_mchid']; ?>" class="input-text" name="weixin_mchid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['weixin_key']; ?>" class="input-text" name="weixin_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'alipayapi'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_service']; ?>" class="input-text" name="alipay_service">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付宝账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_account']; ?>" class="input-text" name="alipay_account">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>交易安全校验码（key）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_key']; ?>" class="input-text" name="alipay_key">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合作者身份（partner ID）：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['alipay_partner']; ?>" class="input-text" name="alipay_partner">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'qupay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['qupay_mchid']; ?>" class="input-text" name="qupay_mchid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['qupay_key']; ?>" class="input-text" name="qupay_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'hrwxpay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['hrwxpay_mchid']; ?>" class="input-text" name="hrwxpay_mchid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['hrwxpay_key']; ?>" class="input-text" name="hrwxpay_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'hrapay'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['hrapay_mchid']; ?>" class="input-text" name="hrapay_mchid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['hrapay_key']; ?>" class="input-text" name="hrapay_key">
			</div>
		</div>
		<?php elseif($model['payment_code'] == 'wg'): ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['wg_mchid']; ?>" class="input-text" name="wg_mchid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="" value="<?php echo $payment['wg_key']; ?>" class="input-text" name="wg_key">
			</div>
		</div>
		<?php endif; ?>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	<?php ActiveForm::end(); ?>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			"Admin[adminuser]":{
				required:true,
				minlength:4,
				maxlength:16
			},
			"Admin[adminpass]":{
				required:true,
			},
			"Admin[repass]":{
				required:true,
				equalTo: "#admin-adminpass"
			},
			"Admin[mobile]":{
				required:true,
				isPhone:true,
			},
			"Admin[adminemail]":{
				required:true,
				email:true,
			},
			adminRole:{
				required:true,
			},
		},
		// onkeyup:false,
		// focusCleanup:true,
		// success:"valid",
		// submitHandler:function(form){
		// 	$(form).ajaxSubmit();
		// 	var index = parent.layer.getFrameIndex(window.name);
		// 	parent.$('.btn-refresh').click();
		// 	parent.layer.close(index);
		// }
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
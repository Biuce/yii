<?php 
    use yii\bootstrap\ActiveForm;
    use \backend\assets\LoginAsset;
    use yii\helpers\Html;
    LoginAsset::register($this);
    $this->title = '登录';
?>
<?php $this->beginPage(); ?>
<!DOCTYPE HTML>
<html>
<head>
<?php 
    $this->registerMetaTag(['http-equiv' => 'Content-Type', 'content' => 'text/html; charset=utf-8']);
    $this->registerMetaTag(['http-equiv' => 'X-UA-Compatible', 'content' => 'IE=edge,chrome=1']);
    $this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no']);
    $this->registerMetaTag(['name' => 'renderer', 'content' => 'webkit|ie-comp|ie-stand']);
    $this->registerMetaTag(['http-equiv' => 'Cache-Control', 'content' => 'no-siteapp']);
    $this->registerMetaTag(['name' => 'keywords', 'content' => '网站后台,后台管理系统']);
    $this->registerMetaTag(['name' => 'description', 'content' => '轻量级扁平化网站后台模板，网站后台管理系统模版。']);
    $this->head();
?>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<title>后台登录 - <?php echo Html::encode($this->title); ?></title>
</head>
<body>
	<?php $this->beginBody(); ?>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
	<div id="loginform" class="loginBox">
		<!-- <form class="form form-horizontal" action="index.html" method="post"> -->
		<?php $form = ActiveForm::begin([
		    'options'=>[
		        'class'=>"form form-horizontal"
		    ]
		]); ?>
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
				<div class="formControls col-xs-8">
					<input id="" name="admin[adminuser]" type="text" placeholder="账户" class="input-text size-L">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
				<div class="formControls col-xs-8">
					<input id="" name="admin[adminpass]" type="password" placeholder="密码" class="input-text size-L">
				</div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<input class="input-text size-L" name="admin[captcha]" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
					<?php echo yii\captcha\Captcha::widget(['name'=>'verifyCode','captchaAction'=>'login/captcha','imageOptions'=>['class'=>'passcode', 'title'=>'换一个', 'alt'=>'换一个', 'style'=>'cursor:pointer;margin-left:10px;'],'template'=>'{image}']);?>
					<!-- <a id="kanbuq" href="javascript:;">看不清，换一张</a> -->
				</div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<label for="online">
						<input type="hidden" name="admin[rememberMe]" value="0">
                        <input type="checkbox" id="remember-me" name="admin[rememberMe]" value="1" checked="">
						使我保持登录状态</label>
				</div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
					<input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
				</div>
			</div>
			<?php ActiveForm::end(); ?>
		<!-- </form> -->
	</div>
</div>
<div class="footer">Copyright 中盾商城</div>

<?php 
$js = <<<JS
    var _hmt = _hmt || [];
	(function() {
	  	var hm = document.createElement("script");
	  	hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
	  	var s = document.getElementsByTagName("script")[0]; 
	  	s.parentNode.insertBefore(hm, s);
	})();
JS;

$this->registerJs($js);
?>

<?php $this->endBody(); ?>
</body>
</html>
<?php $this->endPage(); ?>
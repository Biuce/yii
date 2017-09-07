<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;

    // AppAsset::register($this);
    
    $this->title = '管理员列表';
    $this->params['breadcrumbs'][] = ['label' => '管理员添加', 'url' => Url::to(['/admin/admin/add'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
	<!-- <form action="" method="post" class="form form-horizontal" id="form-admin-add"> -->
	<?php $form = ActiveForm::begin([
        'options'=>[
            'class'=>"form form-horizontal",
            'id' => 'form-admin-add'
        ]
    ]); ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'adminuser')->textInput(['class'=>'input-text'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'adminpass')->passwordInput(['class'=>'input-text', 'autocomplete' => 'off', 'placeholder' => '密码', 'value' => ''])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'repass')->passwordInput(['class'=>'input-text', 'autocomplete' => 'off', 'placeholder' => '确认新密码'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'mobile')->textInput(['class'=>'input-text'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'adminemail')->textInput(['class'=>'input-text', 'placeholder' => '@'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<?= $form->field($model, 'group_id')->dropDownList($rule, ['select'=>'select', 'size'=>1])->label(false) ?>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	<?php ActiveForm::end(); ?>

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script> 

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
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit(function(data){
				var data = eval("("+data+")");
				if(data.code == 1){
					layer.msg(data.message, {icon: 6,time:2000});
				}else{
					layer.msg(data.message, {icon: 5,time:2000});
				}
				setInterval(close_modal,3000);//设置3000毫秒后执行g函数
				parent.location.reload();
			});
			
		}
	});
	
});

function close_modal()
{
	var index = parent.layer.getFrameIndex(window.name);
	parent.$('.btn-refresh').click();
	parent.layer.close(index);
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
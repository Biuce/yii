<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;

    // AppAsset::register($this);
    
    $this->title = '角色添加';
?>
	<!-- <form action="" method="post" class="form form-horizontal" id="form-admin-role-add"> -->
	<?php $form = ActiveForm::begin([
        'options'=>[
            'class'=>"form form-horizontal",
            'id' => 'form-admin-role-add'
        ]
    ]); ?>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'group_name')->textInput(['class'=>'input-text', 'nullmsg' => '用户账户不能为空'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?=$form->field($model, 'desc')->textInput(['class'=>'input-text'])->label(false); ?>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">网站角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?php if(!empty($node_list) && is_array($node_list)) :?>
                    <?php foreach($node_list as $key => $value):?>
						<dl class="permission-list">
							<dt>
								<label>
									<input type="checkbox" value="<?php echo $value['id']; ?>" name="power[]" id="user-Character-<?php echo $value['id']; ?>" <?php if(isset($rolePower)){echo in_array($value['id'], $rolePower) ? 'checked="checked"' : '';} ?>>
									<?php echo $value['title']; ?>
								</label>
							</dt>
							<dd>
								<?php if(!empty($value['child']) && is_array($value['child'])) :?>
                    				<?php foreach($value['child'] as $k => $child):?>
										<dl class="cl permission-list2">
											<dt>
												<label class="">
													<input type="checkbox" value="<?php echo $child['id']; ?>" name="powerid[]" id="user-Character-0-<?php echo $value['id']; ?>" <?php if(isset($rolePower)){echo in_array($child['id'], $rolePower) ? 'checked="checked"' : '';} ?>>
													<?php echo $child['title']; ?>
												</label>
											</dt>
											<dd>
												<?php if(!empty($child['operator']) && is_array($child['operator'])) :?>
                    								<?php foreach($child['operator'] as $k => $operator):?>
														<label class="">
															<input type="checkbox" value="<?php echo $operator['id']; ?>" name="childid[]" id="user-Character-0-0-<?php echo $value['id']; ?>" <?php if(isset($rolePower)){echo in_array($operator['id'], $rolePower) ? 'checked="checked"' : '';} ?>>
															<?php echo $operator['title']; ?>
														</label>
													<?php endforeach;?>
		                						<?php endif;?>
											</dd>
										</dl>
									<?php endforeach;?>
	                			<?php endif;?>
							</dd>
						</dl>
					<?php endforeach;?>
                <?php endif;?>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	<?php ActiveForm::end(); ?>

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
	$("#form-admin-role-add").validate({
		rules:{
			"AdminGroup[group_name]":{
				required:true,
			},
			"AdminGroup[desc]":{
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
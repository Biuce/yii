<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;

    // AppAsset::register($this);
    $this->title = '角色管理';
    $this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => Url::to(['/admin/admin/index'])];
	$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Hui-article">
	<article class="cl pd-20">
	<div class="cl pd-5 bg-1 bk-gray"> 
		<span class="l"> 
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<?php if(in_array('/admin/rule/add', $power)):?>
				<a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','<?php echo Url::to(['/admin/rule/add']); ?>','800')">
					<i class="Hui-iconfont">&#xe600;</i> 添加角色
				</a> 
			<?php endif; ?>	
		</span> 
		<span class="r">共有数据：<strong>54</strong> 条</span> 
	</div>
	<div class="mt-10">
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="7">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="60">ID</th>
				<th width="200">角色名</th>
				<th>用户列表</th>
				<th width="200">创建时间</th>
				<th width="300">描述</th>
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($admingroup)&&!empty($admingroup)) :?>
                <?php foreach($admingroup as $k => $v) :?>
					<tr class="text-c">
						<td><input type="checkbox" value="" name=""></td>
						<td><?= Html::encode($v->id); ?></td>
						<td><?= Html::encode($v->group_name); ?></td>
						<td><a href="#">admin</a></td>
						<td><?= Html::encode(date('Y-m-d H:i:s', $v->create_time)); ?></td>
						<td><?= Html::encode($v->desc); ?></td>
						<td class="f-14">
							<?php if(in_array('/admin/rule/edit', $power)):?>
								<a title="编辑" href="javascript:;" onclick="admin_role_edit('角色编辑','<?php echo Url::to(['/admin/rule/edit', 'id' => $v->id]); ?>', '', '800', '')" style="text-decoration:none">
									<i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;编辑</i>
								</a> 
							<?php endif; ?>	
							<?php if(in_array('/admin/rule/delete', $power)):?>
								<a title="删除" href="javascript:;" onclick="admin_role_del(this,'<?php echo $v->id; ?>')" class="ml-5" style="text-decoration:none">
									<i class="Hui-iconfont btn btn-danger radius size-S">&#xe6e2;删除</i>
								</a>
							<?php endif; ?>	
						</td>
					</tr>
				<?php endforeach;?> 
            <?php endif;?>	
		</tbody>
	</table>
	<div class="panel-foot text-center">
        <!-- 分页 start-->
        <?= $this->render('../../../../views/_page', ['count' => $count, 'page' => $page]) ?>
        <!-- 分页 end-->
    </div>
	</div>
</article>
</div>

<script type="text/javascript">
/*管理员-角色-添加*/
function admin_role_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-编辑*/
function admin_role_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-删除*/
function admin_role_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		var base_url = "<?php echo Url::to(['/admin/rule/delete']); ?>";
        $.get(base_url,{id:id},function(data){
            var data = eval("("+data+")");
            if(data.code == 1){
                $(obj).parents("tr").remove();
                layer.msg(data.message,{icon:1,time:1000});
            }else{
                layer.msg(data.message,{icon:1,time:2000});
            }
            location.reload();
        });
	});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
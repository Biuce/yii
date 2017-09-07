<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use backend\models\Menu;

    AppAsset::register($this);
    
    $this->title = '菜单管理';
    $this->params['breadcrumbs'][] = ['label' => '系统管理', 'url' => Url::to(['/menu/menu/index'])];
	$this->params['breadcrumbs'][] = $this->title;
?>

	<div class="Hui-article">
		<article class="cl pd-20">
			<?php echo html::beginForm(Url::toRoute(['/menu/menu/index']), 'GET');?>
			<div class="text-c"> 
				搜索：
				<div class="form-group" style="margin-top:16px;">
					<div class="text-c">
						<select class="input-text" name="search[type]" id="class_id">
							<option value=>请选择</option>
							<?php if(!empty($search) && is_array($search)) :?>
								<?php foreach($search as $k=>$v):?>
									<option value="<?= Html::encode($k)?>" <?php if (isset($searchvalue['type']) && $searchvalue['type'] == $k)  echo "selected"?> ><?= Html::encode($v)?></option>
								<?php endforeach;?>
							<?php endif;?>
						</select>
					</div>
				</div>
				<input type="text" class="input-text" style="width:250px" placeholder="输入菜单名称" id="" name="search[keyword]">
				
				<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</div>
			<?php echo html::endForm();?>

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"> 
					<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
					<?php if(in_array('/menu/menu/add', $power)):?>
						<a href="<?php echo Url::to(['/menu/menu/add']); ?>" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加菜单</a>
					<?php endif; ?> 
				</span>
				<span class="r">每页：<strong><?php echo \yii::$app->params['pageSize'];?></strong> 条&nbsp;&nbsp;共有数据：<strong><?php echo $count; ?></strong> 条</span>
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="9">菜单列表</th>
					</tr>
					<tr class="text-c">
						<th width="50"><input type="checkbox" name="" value=""></th>
						<th width="50">ID</th>
						<th width="150">名称</th>
						<th width="100">菜单路径</th>
						<th width="100">URL</th>
						<th width="100">排序</th>
						<th width="100">是否隐藏</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($result)&&!empty($result)) :?>
                    	<?php foreach($result as $k => $v) :?>
							<tr class="text-c">
								<td><input type="checkbox" value="1" name=""></td>
								<td><?= Html::encode($v->id)?></td>
								<td><?= Html::encode($v->title)?></td>
								<td>
									<?php 
	                                    if($v->pid == 0){
	                                        echo '无';
	                                    } else {
	                                        $nav = Menu::getParentMenus($v->id);
	                                        $nav_title = '';
	                                        foreach ($nav as $value) {
	                                            $nav_title .= Html::a($value['title'], ['index', 'pid'=>$value['id']]).' > ';
	                                        }
	                                        $nav_title = trim($nav_title, ' > ');
	                                        echo $nav_title;
	                                    }
	                                ?>
								</td>
								<td><?= Html::encode($v->url)?></td>
								<td><?= Html::encode($v->sort)?></td>
								<td class="td-status">
									<?php if($v->hide == 1): ?>
										<span class="label label-default radius">已隐藏</span>
									<?php else: ?>
										<span class="label label-success radius">正常</span>
									<?php endif; ?>
								</td>
								<td class="td-manage">
									<?php if(in_array('/menu/menu/index', $power)):?>
										<a style="text-decoration:none" href="<?php echo Url::to(['/menu/menu/index','pid' => $v->id]); ?>" title="查看">
											<i class="Hui-iconfont btn btn-secondary radius size-S">&#xe725;查看</i>
										</a>
									<?php endif; ?> 
									<?php if(in_array('/menu/menu/change', $power)):?>	
										<?php if($v->hide == 1): ?>
											<a style="text-decoration:none" onClick="admin_start(this,<?php echo $v->id; ?>)" href="javascript:;" title="取消隐藏">
												<i class="Hui-iconfont btn btn btn-warning radius size-S">&#xe615;取消隐藏</i>
											</a>
										<?php else: ?>
											<a style="text-decoration:none" onClick="admin_stop(this,<?php echo $v->id; ?>)" href="javascript:;" title="隐藏">
												<i class="Hui-iconfont btn btn-success radius size-S">&#xe631;隐藏</i>
											</a> 
										<?php endif; ?>
									<?php endif; ?>

									<?php if(in_array('/menu/menu/edit', $power)):?>
										<a title="编辑" href="<?php echo Url::to(['/menu/menu/edit','id' => $v->id]); ?>" class="ml-5" style="text-decoration:none">
											<i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;编辑</i>
										</a> 
									<?php endif; ?>
									<?php if(in_array('/menu/menu/delete', $power)):?>
										<a title="删除" href="javascript:;" onclick="admin_del(this,'<?php echo $v->id; ?>')" class="ml-5" style="text-decoration:none">
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
		</article>
	</div>

<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*菜单-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		var base_url = "<?php echo Url::to(['/menu/menu/delete']); ?>";
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

var base_url = "<?php echo Url::to(['/menu/menu/change']); ?>";
/*菜单-隐藏*/
function admin_stop(obj,id){
	layer.confirm('确认要隐藏吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.get(base_url,{id:id,type:1},function(data){
            var data = eval("("+data+")");
            // alert(data.data.id);
            if(data.code == 1){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+data.data.id+')" href="javascript:;" title="取消隐藏" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已隐藏</span>');
				$(obj).remove();
				layer.msg(data.message,{icon: 5,time:1000});
            }else{
                layer.msg(data.message,{icon:1,time:2000});
            }
            location.reload();
        });
	});
}

/*菜单-取消隐藏*/
function admin_start(obj,id){
	layer.confirm('确认要取消隐藏吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.get(base_url,{id:id,type:2},function(data){
            var data = eval("("+data+")");
            // alert(data);
            if(data.code == 1){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+data.data.id+')" href="javascript:;" title="隐藏" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
				$(obj).remove();
				layer.msg(data.message, {icon: 6,time:1000});
            }else{
                layer.msg(data.message,{icon:1,time:2000});
            }
            location.reload();
        });
	});
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
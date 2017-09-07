<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
    
    $this->title = '支付方式列表';
    $this->params['breadcrumbs'][] = ['label' => '系统管理', 'url' => Url::to(['/config/config/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="Hui-article">
    <article class="cl pd-20">
    <table class="table table-border table-bordered table-bg">
        <thead>
            <tr>
                <th scope="col" colspan="9">管理员列表</th>
            </tr>
            <tr class="text-c">
                <th width="50"><input type="checkbox" name="" value=""></th>
                <th width="50">支付ID</th>
                <th width="150">支付代码名称</th>
                <th width="100">支付名称</th>
                <th width="100">接口状态</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($result)&&!empty($result)) :?>
                <?php foreach($result as $k => $v) :?>
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td><?= Html::encode($v->payment_id)?></td>
                        <td><?= Html::encode($v->payment_code)?></td>
                        <td><?= Html::encode($v->payment_name)?></td>
                        <td class="td-status">
                            <?php if($v->payment_state == 0): ?>
                                <span class="label label-default radius">禁用</span>
                            <?php else: ?>
                                <span class="label label-success radius">启用</span>
                            <?php endif; ?>
                        </td>
                        <td class="td-manage">
                            <?php //if(in_array('/config/payment/change', $power)):?>
                                <?php if($v->payment_state == 0): ?>
                                    <a style="text-decoration:none" onClick="payment_start(this,<?php echo $v->payment_id; ?>)" href="javascript:;" title="启用">
                                        <i class="Hui-iconfont btn btn btn-warning radius size-S">&#xe615;启用</i>
                                    </a>
                                <?php else: ?>
                                    <a style="text-decoration:none" onClick="payment_stop(this,<?php echo $v->payment_id; ?>)" href="javascript:;" title="停用">
                                        <i class="Hui-iconfont btn btn-success radius size-S">&#xe631;停用</i>
                                    </a> 
                                <?php endif; ?>
                            <?php //endif; ?>
                            <?php //if(in_array('/config/payment/edit', $power)):?>
                                <?php if($v->payment_code != 'offline' && $v->payment_code != 'predeposit'):?>
                                    <a title="编辑" href="javascript:;" onclick="payment_edit('编辑支付方式','<?php echo Url::to(['/config/payment/edit', 'id' => $v->payment_id]); ?>', '','800','600')" class="ml-5" style="text-decoration:none">
                                        <i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;编辑</i>
                                    </a> 
                                <?php endif; ?>
                            <?php //endif; ?>
                            <?php //if(in_array('/config/payment/delete', $power)):?>
                                <a title="删除" href="javascript:;" onclick="payment_del(this,'<?php echo $v->payment_id; ?>')" class="ml-5" style="text-decoration:none">
                                    <i class="Hui-iconfont btn btn-danger radius size-S">&#xe6e2;删除</i>
                                </a>
                            <?php //endif; ?>
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
    title   标题
    url     请求的url
    id      需要操作的数据id
    w       弹出层宽度（缺省调默认值）
    h       弹出层高度（缺省调默认值）
*/

/*支付方式-删除*/
function payment_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        var base_url = "<?php echo Url::to(['/config/payment/delete']); ?>";
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

/*支付方式-编辑*/
function payment_edit(title,url,id,w,h){
    layer_show(title,url,w,h);
}

var base_url = "<?php echo Url::to(['/config/payment/change']); ?>";
/*支付方式-隐藏*/
function payment_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        $.get(base_url,{id:id,type:1},function(data){
            var data = eval("("+data+")");
            if(data.code == 1){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+data.data.id+')" href="javascript:;" title="取消停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已停用</span>');
                $(obj).remove();
                layer.msg(data.message,{icon: 5,time:1000});
            }else{
                layer.msg(data.message,{icon:1,time:2000});
            }
            location.reload();
        });
    });
}

/*支付方式-取消隐藏*/
function payment_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        $.get(base_url,{id:id,type:2},function(data){
            var data = eval("("+data+")");
            if(data.code == 1){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+data.data.id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">启用</span>');
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

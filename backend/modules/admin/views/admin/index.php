<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
    
    $this->title = '管理员列表';
    $this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => Url::to(['/admin/admin/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="Hui-article">
    <article class="cl pd-20">
    <?php echo html::beginForm(Url::toRoute(['/admin/admin/index']), 'GET');?>
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
        <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="search[keyword]">
        &nbsp;&nbsp;
        创建时间：
        <input type="text" name="search[stime]" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" name="search[etime]" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
        &nbsp;&nbsp;
        登录时间：
        <input type="text" name="search[cstime]" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" name="search[cetime]" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
        <button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
    </div>
    <?php echo html::endForm();?>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"> 
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
            <?php if(in_array('/admin/admin/add', $power)):?>
                <a href="javascript:;" onclick="admin_add('添加管理员','<?php echo Url::to(['/admin/admin/add']); ?>','800','600')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a>
            <?php endif; ?>
        </span>
        <span class="r">每页：<strong><?php echo \yii::$app->params['pageSize'];?></strong> 条&nbsp;&nbsp;共有数据：<strong><?php echo $count; ?></strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
            <tr>
                <th scope="col" colspan="9">管理员列表</th>
            </tr>
            <tr class="text-c">
                <th width="50"><input type="checkbox" name="" value=""></th>
                <th width="50">UID</th>
                <th width="150">用户名</th>
                <th width="100">电子邮箱</th>
                <th width="100">登录时间</th>
                <th width="100">创建时间</th>
                <th width="100">登录IP</th>
                <th width="100">状态</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($result)&&!empty($result)) :?>
                <?php foreach($result as $k => $v) :?>
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td><?= Html::encode($v->adminid)?></td>
                        <td><?= Html::encode($v->adminuser)?></td>
                        <td><?= Html::encode($v->adminemail)?></td>
                        <td><?= Html::encode(date('Y-m-d H:i:s', $v->logintime))?></td>
                        <td><?= Html::encode(date('Y-m-d H:i:s', $v->createtime))?></td>
                        <td><?= Html::encode(long2ip($v->loginip))?></td>
                        <td class="td-status">
                            <?php if($v->status == 2): ?>
                                <span class="label label-default radius">已停用</span>
                            <?php else: ?>
                                <span class="label label-success radius">已启用</span>
                            <?php endif; ?>
                        </td>
                        <td class="td-manage">
                            <?php if(in_array('/admin/admin/change', $power)):?>
                                <?php if($v->status == 2): ?>
                                    <a style="text-decoration:none" onClick="admin_start(this,<?php echo $v->adminid; ?>)" href="javascript:;" title="启用">
                                        <i class="Hui-iconfont btn btn btn-warning radius size-S">&#xe615;启用</i>
                                    </a>
                                <?php else: ?>
                                    <a style="text-decoration:none" onClick="admin_stop(this,<?php echo $v->adminid; ?>)" href="javascript:;" title="停用">
                                        <i class="Hui-iconfont btn btn-success radius size-S">&#xe631;停用</i>
                                    </a> 
                                <?php endif; ?>
                            <?php endif; ?>
                            <?php if(in_array('/admin/admin/edit', $power)):?>
                                <a title="编辑" href="javascript:;" onclick="admin_edit('编辑管理员','<?php echo Url::to(['/admin/admin/edit', 'id' => $v->adminid]); ?>', '','800','600')" class="ml-5" style="text-decoration:none">
                                    <i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;编辑</i>
                                </a> 
                            <?php endif; ?>
                            <?php if(in_array('/admin/admin/delete', $power)):?>
                                <a title="删除" href="javascript:;" onclick="admin_del(this,'<?php echo $v->adminid; ?>')" class="ml-5" style="text-decoration:none">
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
    title   标题
    url     请求的url
    id      需要操作的数据id
    w       弹出层宽度（缺省调默认值）
    h       弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
    layer_show(title,url,w,h);
}

/*菜单-删除*/
function admin_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        var base_url = "<?php echo Url::to(['/admin/admin/delete']); ?>";
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

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
    layer_show(title,url,w,h);
}

var base_url = "<?php echo Url::to(['/admin/admin/change']); ?>";
/*菜单-隐藏*/
function admin_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        $.get(base_url,{id:id,type:1},function(data){
            var data = eval("("+data+")");
            alert(data.code);
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

/*菜单-取消隐藏*/
function admin_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        $.get(base_url,{id:id,type:2},function(data){
            var data = eval("("+data+")");
            // alert(data);
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

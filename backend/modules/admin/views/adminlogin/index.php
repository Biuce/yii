<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\grid\GridView;

$this->title = '管理员登录日志';
$this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => Url::to(['/admin/admin/index'])];
$this->params['breadcrumbs'][] = $this->title;
?>
<?php echo html::beginForm(Url::toRoute(['/admin/adminlogin/index']), 'GET');?>
<div class="Hui-article">
    <article class="cl pd-20">
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
        <input type="text" name="search[keyword]" id="" placeholder="日志名称" style="width:250px" class="input-text">
        &nbsp;&nbsp;
        日期范围：
        <input type="text" name="search[stime]" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" name="search[etime]" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:120px;">
        
        <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜日志</button>
    </div>
<?php echo html::endForm();?>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
        <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
        </span>
        <span class="r">共有数据：<strong>54</strong> 条</span>
    </div>
    <div class="mt-10">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">ID</th>
                    <th width="80">管理员ID</th>
                    <th width="100">登录账号</th>
                    <th width="100">登陆IP</th>
                    <th width="17%">登陆时间</th>
                    <th width="70">操作</th>
                </tr>
            </thead>
            <tbody>
                <?php if(is_array($result)&&!empty($result)) :?>
                    <?php foreach($result as $k => $v) :?>
                        <tr class="text-c">
                            <td><input type="checkbox" value="" name=""></td>
                            <td><?= Html::encode($v->id)?></td>
                            <td><?= Html::encode($v->uid)?></td>
                            <td><?= Html::encode($v->account)?></td>
                            <td><?= Html::encode(long2ip($v->login_ip))?></td>
                            <td><?= Html::encode(date('Y-m-d H:i:s', $v->login_time))?></td>
                            <td>
                                <?php if(in_array('/admin/adminlogin/delete', $power)):?>
                                    <a title="删除" href="javascript:;" onclick="adminlogin_del(this,'<?php echo $v->id; ?>')" class="ml-5" style="text-decoration:none">
                                        <i class="Hui-iconfont btn btn-danger radius size-S">&#xe6e2;删除</i>
                                    </a>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach;?> 
                <?php endif;?>
            </tbody>
        </table>
    </div>
    <div class="panel-foot text-center">
        <!-- 分页 start-->
        <?= $this->render('../../../../views/_page', ['count' => $count, 'page' => $page]) ?>
        <!-- 分页 end-->
    </div>
</article>
</div>

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
    "lengthMenu":false,//显示数量选择 
    "bFilter": false,//过滤功能
    "bPaginate": false,//翻页信息
    "bInfo": false,//数量信息
    "aaSorting": [[ 1, "desc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
      //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
      {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
    ]
});

/*菜单-删除*/
function adminlogin_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        var base_url = "<?php echo Url::to(['/admin/adminlogin/delete']); ?>";
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
<?php 

use yii\helpers\Html;
use yii\helpers\Url;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;
    
    $this->title = '备份数据库';
    $this->params['breadcrumbs'][] = ['label' => '系统管理', 'url' => Url::to(['/config/config/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="Hui-article">
    <article class="cl pd-20">
    <?php $form = ActiveForm::begin([
        'options'=>[
            'class'=>"form form-horizontal",
            'id' => 'export-form'
        ]
    ]); ?>    
    <table class="table table-border table-bordered table-bg" id="sample_11">
        <thead>
            <tr>
                <th scope="col" colspan="9">备份数据库</th>
            </tr>
            <tr class="text-c">
                <th width="50">备份名称</th>
                <th width="150">卷数</th>
                <th width="100">压缩</th>
                <th width="100">数据大小</th>
                <th width="100">备份时间</th>
                <th width="100">备份状态</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($list)&&!empty($list)) :?>
                <?php foreach($list as $key => $value) :?>
                    <tr class="text-c">
                        <td><?= Html::encode(date('Ymd-His', $value['time']))?></td>
                        <td><?= Html::encode($value['part'])?></td>
                        <td><?= Html::encode($value['compress'])?></td>
                        <td><?= Html::encode(Yii::$app->formatter->asShortSize($value['size']))?></td>
                        <td><?= Html::encode($key)?></td>
                        <td>-</td>
                        <td class="td-manage">
                            <?php //if(in_array('/admin/admin/edit', $power)):?>
                                <a href="javascript:;" onClick="tijiao(<?php echo $value['time']; ?>)" class="ml-5" style="text-decoration:none" title="还原" >
                                    <i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;还原</i>
                                </a> 
                            <?php //endif; ?>
                            <?php //if(in_array('/admin/admin/edit', $power)):?>
                                <a href="<?php echo Url::to(['/config/database/del', 'time'=>$value['time']]); ?>" class="ml-5" style="text-decoration:none" title="删除" >
                                    <i class="Hui-iconfont btn btn-danger radius size-S">&#xe6e2;删除</i>
                                </a> 
                            <?php //endif; ?>
                        </td>
                    </tr>
                <?php endforeach;?> 
            <?php endif;?>
        </tbody>
    </table>
    <?php ActiveForm::end(); ?>
</article>
</div>

<script type="text/javascript">
/* 还原数据库 */
function tijiao(time){
    var self = $(".db-import"), status = ".",
    url = "<?php echo Url::to(['/config/database/import']); ?>";
    $.get(url, {time:time}, success, "json");
    window.onbeforeunload = function(){ return "正在还原数据库，请不要关闭！" }
    return false;

    function success(data){
        if(data.status){
            if(data.gz){
                data.info += status;
                if(status.length === 5){
                    status = ".";
                } else {
                    status += ".";
                }
            }
            layer.msg(data.info,{icon:1,time:3000});
            // $(self).parent().prev().text(data.info);
            if(data.part){
                $.get(url, 
                    {"part" : data.part, "start" : data.start}, 
                    success, 
                    "json"
                );
            }  else {
                window.onbeforeunload = function(){ return null; }
            }
        } else {
            layer.msg(data.info,{icon:1,time:3000});
            // updateAlert(data.info,'alert-error');
        }
    }
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->

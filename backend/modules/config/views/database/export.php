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
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"> 
            <?php //if(in_array('/admin/admin/add', $power)):?>
                <a href="javascript:;" class="btn btn-primary radius" id="export" onClick="beifen()"><i class="Hui-iconfont">&#xe600;</i> 立即备份</a>
            <?php //endif; ?>
            <?php //if(in_array('/admin/admin/add', $power)):?>
                <a id="optimize" class="btn btn-primary radius" href="javascript:;" onClick="optimize()"><i class="Hui-iconfont">&#xe600;</i> 优化表</a>
            <?php //endif; ?>
            <?php //if(in_array('/admin/admin/add', $power)):?>
                <a id="repair" class="btn btn-primary radius" href="javascript:;" onClick="repair()"><i class="Hui-iconfont">&#xe600;</i> 修复表</a>
            <?php //endif; ?>
        </span>
    </div>
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
                <th width="50"><input type="checkbox" name="" value="" class="group-checkable" checked="chedked" data-set="#sample_11 .checkboxes" /></th>
                <th width="50">表名</th>
                <th width="150">数据量</th>
                <th width="100">数据大小</th>
                <th width="100">创建时间</th>
                <th width="100">备份状态</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($list)&&!empty($list)) :?>
                <?php foreach($list as $key => $value) :?>
                    <tr class="text-c">
                        <td><input type="checkbox" value="<?=$value['name']?>" name="tables[]" checked="chedked"></td>
                        <td><?= Html::encode($value['name'])?></td>
                        <td><?= Html::encode($value['rows'])?></td>
                        <td><?= Html::encode(Yii::$app->formatter->asShortSize($value['data_length']))?></td>
                        <td><?= Html::encode($value['create_time'])?></td>
                        <td>未备份</td>
                        <td class="td-manage">
                            <?php //if(in_array('/admin/admin/edit', $power)):?>
                                <a href="<?php echo Url::to(['/config/database/optimize', 'tables'=>$value['name']]); ?>" class="ml-5" style="text-decoration:none" title="优化表" >
                                    <i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;优化表</i>
                                </a> 
                            <?php //endif; ?>
                            <?php //if(in_array('/admin/admin/edit', $power)):?>
                                <a href="<?php echo Url::to(['/config/database/repair', 'tables'=>$value['name']]); ?>" class="ml-5" style="text-decoration:none" title="修复表" >
                                    <i class="Hui-iconfont btn btn-primary radius size-S">&#xe6df;修复表</i>
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

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript">
jQuery(document).ready(function() {
    /* 列表一键多选 */
    jQuery('#sample_11 .group-checkable').change(function () {
        var set = jQuery(this).attr("data-set");
        var checked = jQuery(this).is(":checked");
        jQuery(set).each(function () {
            if (checked) {
                $(this).attr("checked", true);
            } else {
                $(this).attr("checked", false);
            }
        });
        jQuery.uniform.update(set);
    });
});

    function backup(tab, status){
        var $form = $("#export-form"), $export = $("#export"), tables;
        status && showmsg(tab.id, "开始备份...(0%)");
        $.get($form.attr("action"), tab, function(data){
            if(data.status == 1){
                showmsg(tab.id, data.info);

                if(!$.isPlainObject(data.tab)){
                    $export.parent().children().removeClass("disabled");
                    $export.html("备份完成，点击重新备份");
                    window.onbeforeunload = function(){ return null }
                    return;
                }
                backup(data.tab, tab.id != data.tab.id);
            } else {
                layer.msg(data.info,{icon:1,time:3000});
                // updateAlert(data.info,'alert-error');
                $export.parent().children().removeClass("disabled");
                $export.html("立即备份");
                setTimeout(function(){
                    $('#top-alert').find('button').click();
                    $(this).removeClass('disabled').prop('disabled',false);
                },1500);
            }
        }, "json");
    }
    
    function showmsg(id, msg){
        var $form = $("#export-form"), $export = $("#export"), tables;
        $form.find("input[value=" + tables[id] + "]").closest("tr").find(".info").html(msg);
    }

    /* 批量 优化表 */
    function optimize(){
        var $form = $("#export-form"), $export = $("#export"), tables;
        var youhuaurl = "<?php echo Url::to(['/config/database/optimize']); ?>";
        $.post(youhuaurl, $form.serialize(), function(data){
            if(data.status){
                layer.msg(data.info,{icon:1,time:3000});
            } else {
                layer.msg(data.info,{icon:1,time:3000});
            }
        }, "json");
        return false;
    }

    /* 批量 修复表 */
    function repair(){
        var $form = $("#export-form"), $export = $("#export"), tables;
        var xiufuurl = "<?php echo Url::to(['/config/database/repair']); ?>";
        $.post(xiufuurl, $form.serialize(), function(data){
            if(data.status){
                layer.msg(data.info,{icon:1,time:3000});
            } else {
                layer.msg(data.info,{icon:1,time:3000});
            }
        }, "json");
        return false;
    }


    /* 批量 备份表 */
    function beifen(){
        var $form = $("#export-form"), $export = $("#export"), tables;
        var beifenurl = "<?php echo Url::to(['/config/database/export']); ?>";
        $export.parent().children().addClass("disabled");
        // $export.html("正在发送备份请求...");
        layer.msg("正在发送备份请求...",{icon:1,time:3000});
        $.post(
            beifenurl,
            $form.serialize(),
            function(data){
                if(data.status == 1){
                    tables = data.tables;
                    // $export.html(data.info + "开始备份，请不要关闭本页面！");
                    layer.msg(data.info + "开始备份，请不要关闭本页面！",{icon:1,time:3000});
                    backup(data.tab);
                    window.onbeforeunload = function(){ return "正在备份数据库，请不要关闭！" }
                } else {
                    layer.msg(data.info,{icon:1,time:3000});
                    // updateAlert(data.info,'alert-error');
                    $export.parent().children().removeClass("disabled");
                    layer.msg("立即备份",{icon:1,time:3000});
                    // $export.html("立即备份");
                    // setTimeout(function(){
                    //     $('#top-alert').find('button').click();
                    //     $(this).removeClass('disabled').prop('disabled',false);
                    // },1500);
                }
            },"json");
        return false;
    }
</script> 
<!--/请在上方写此页面业务相关的脚本-->

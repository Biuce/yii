<?php 
use yii\helpers\Html;
use yii\helpers\Url;
    
    $this->title = '管理员列表';
    $this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => Url::to(['/admin/admin/index'])];
    $this->params['breadcrumbs'][] = $this->title;
?>
<link rel="stylesheet" href="/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="Hui-article">
        <div class="pos-a" style="width:150px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5">
            <ul id="treeDemo" class="ztree">
            </ul>
        </div>
        <div style="margin-left:150px;">
            <div class="pd-20">
                <div class="text-c"> 日期范围：
                    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:120px;">
                    <input type="text" name="" id="" placeholder=" 产品名称" style="width:250px" class="input-text">
                    <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜产品</button>
                </div>
                <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                            <tr class="text-c">
                                <th width="40"><input name="" type="checkbox" value=""></th>
                                <th width="40">ID</th>
                                <th width="60">缩略图</th>
                                <th width="100">产品名称</th>
                                <th>描述</th>
                                <th width="100">单价</th>
                                <th width="60">发布状态</th>
                                <th width="100">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="text-c va-m">
                                <td><input name="" type="checkbox" value=""></td>
                                <td>001</td>
                                <td>
                                    <a onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img width="60" class="product-thumb" src="pic/product/Thumb/6204.jpg"></a>
                                </td>
                                <td class="text-l">
                                    <a style="text-decoration:none" onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;">
                                        <img title="国内品牌" src="static/h-ui/images/gq/cn.gif"> 
                                        <b class="text-success">圣象</b> 哥本哈根橡木地板KS8373
                                    </a>
                                </td>
                                <td class="text-l">原木的外在,实木条形结构,色泽花纹自然,写意;款式设计吸取实木地板的天然去雕饰之美,在视觉上给人带来深邃联想.多款产品适合搭配不同的风格的室内装饰;功能流露出尊贵典雅的大气韵味。
                                </td>
                                <td>
                                    <span class="price">356.0</span> 元/平米
                                </td>
                                <td class="td-status">
                                    <span class="label label-success radius">已发布</span>
                                </td>
                                <td class="td-manage">
                                    <a style="text-decoration:none" onClick="product_stop(this,'10001')" href="javascript:;" title="下架">
                                        <i class="Hui-iconfont">&#xe6de;</i>
                                    </a> 
                                    <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-add.html','10001')" href="javascript:;" title="编辑">
                                        <i class="Hui-iconfont">&#xe6df;</i>
                                    </a> 
                                    <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除">
                                        <i class="Hui-iconfont">&#xe6e2;</i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>

<script>    
<?php $this->beginBlock('js_end') ?>   
var setting = {
    view: {
        dblClickExpand: false,
        showLine: false,
        selectedMulti: false
    },
    data: {
        simpleData: {
            enable:true,
            idKey: "id",
            pIdKey: "pId",
            rootPId: ""
        }
    },
    callback: {
        beforeClick: function(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("tree");
            if (treeNode.isParent) {
                zTree.expandNode(treeNode);
                return false;
            } else {
                demoIframe.attr("src",treeNode.file + ".html");
                return true;
            }
        }
    }
};

var zNodes =[
    { id:1, pId:0, name:"一级分类", open:true},
    { id:11, pId:1, name:"二级分类"},
    { id:111, pId:11, name:"三级分类"},
    { id:112, pId:11, name:"三级分类"},
    { id:113, pId:11, name:"三级分类"},
    { id:114, pId:11, name:"三级分类"},
    { id:115, pId:11, name:"三级分类"},
    { id:12, pId:1, name:"二级分类 1-2"},
    { id:121, pId:12, name:"三级分类 1-2-1"},
    { id:122, pId:12, name:"三级分类 1-2-2"},
];

var code;

function showCode(str) {
    if (!code) code = $("#code");
    code.empty();
    code.append("<li>"+str+"</li>");
}

$(document).ready(function(){
    var t = $("#treeDemo");
    t = $.fn.zTree.init(t, setting, zNodes);
    demoIframe = $("#testIframe");
    demoIframe.bind("load", loadReady);
    var zTree = $.fn.zTree.getZTreeObj("tree");
    zTree.selectNode(zTree.getNodeByParam("id",12));
});
    
function loadReady() {  
    var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,   
    htmlH = demoIframe.contents().find("html").get(0).scrollHeight,  
    maxH = Math.max(bodyH, htmlH),  
    minH = Math.min(bodyH, htmlH),   
    h = demoIframe.height() >= maxH ? minH : maxH;  
    if (h < 530)  
        h = 530;  
    demoIframe.height(h);  
}  
<?php $this->endBlock(); ?>    
</script>    
<?php $this->registerJs($this->blocks['js_end'],\yii\web\View::POS_LOAD);//将编写的js代码注册到页面底部 ?> 



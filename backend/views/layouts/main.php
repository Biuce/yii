<?php 

use yii\helpers\Url;
use yii\helpers\Html;
use backend\models\Menu;
use yii\widgets\Breadcrumbs;
use backend\assets\AppAsset;
use backend\service\MenuService;

    AppAsset::register($this);
    
    if (\Yii::$app->session['admin']) {
    	if (\Yii::$app->session['admin']['adminid'] == 1) {   # 超级管理员
	        $menuList = MenuService::app()->getUserMenu();
	    } else {  											  # 角色
	        $power = \yii::$app->session['power'];
	        $menuList = MenuService::app()->setPower($power);
	    }
    } else {
    	return Url::toRoute('/login/login/index');
    }
    
?>
<?php $this->beginPage(); ?>

<!--_meta 作为公共模版分离出去-->
<?php echo $this->render('@backend/views/layouts/_meta.php'); ?>
<!--/meta 作为公共模版分离出去-->

<title>后台管理-<?php echo Html::encode($this->title); ?></title>
</head>
<body>
	<?php $this->beginBody(); ?>

<!--_header 作为公共模版分离出去-->
<?php echo $this->render('@backend/views/layouts/_header.php'); ?>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<?php echo $this->render('@backend/views/layouts/_menu.php', ['allMenu' => $menuList]); ?>
<!--/_menu 作为公共模版分离出去-->

<!-- 主体内容 -->
<?php //echo $content ; ?>
<!-- 主体内容 -->

<section class="Hui-article-box">
	<?php 
        echo Breadcrumbs::widget([
            'homeLink' => ['label' => '首页', 'url' => '/index/index/index'],
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]);
    ?>
    
	<!-- 主体内容 -->
	<?php echo $content ; ?>
	<!-- 主体内容 -->
</section>

<!--_footer 作为公共模版分离出去-->
<!-- <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.page.js"></script>  -->
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<?php 
$js = <<<JS
    var _hmt = _hmt || [];
	(function() {
	  	var hm = document.createElement("script");
	  	hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
	  	var s = document.getElementsByTagName("script")[0]; 
	  	s.parentNode.insertBefore(hm, s);
	})();
JS;

$this->registerJs($js);
?>
<!--/此乃百度统计代码，请自行删除-->

<?php $this->endBody(); ?>
</body>
</html>
<?php $this->endPage(); ?>
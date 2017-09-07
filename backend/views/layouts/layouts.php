<?php 
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;

    AppAsset::register($this);
?>

<?php $this->beginPage(); ?>
<!--_meta 作为公共模版分离出去-->
<?php echo $this->render('@backend/views/layouts/_meta.php'); ?>
<!--/meta 作为公共模版分离出去-->

<title>后台管理-<?php echo Html::encode($this->title); ?></title>
</head>
<body>
<?php $this->beginBody(); ?>

<article class="cl pd-20">
	<!-- 主体内容 -->
	<?php echo $content ; ?>
	<!-- 主体内容 -->
</article>

<?php $this->endBody(); ?>
</body>
</html>
<?php $this->endPage(); ?>
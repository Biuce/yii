<?php 
use yii\helpers\Url;
use backend\assets\AppAsset;

AppAsset::register($this);

$this->title = '后台首页';
?>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<?php if(is_array($allMenu)&&!empty($allMenu)) :?>
            <?php foreach($allMenu as $key => $menu) :?>
				<dl id="menu-article">
					<dt><i class="Hui-iconfont">&#xe616;</i> <?php echo $menu['title']; ?><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
					<dd>
						<ul>
							<?php if(isset($menu['menu'])&&!empty($menu['menu'])) :?>
            					<?php foreach($menu['menu'] as $k => $v) :?>
									<li><a href="<?php echo Url::to([$v['url']]); ?>" title="<?php echo $v['title']; ?>"><?php echo $v['title']; ?></a></li>
								<?php endforeach;?> 
        					<?php endif;?>
						</ul>
					</dd>
				</dl>
			<?php endforeach;?> 
        <?php endif;?>	
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
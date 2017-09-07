<?php

return [
	'rbac'=>[
		'not_validate_controller'=>['user','site','message','version'], //无需验证的控制器，在此内容里所有方法都不用验证登陆，如 site,bank
		'not_validate_action'=>[
      'product/detail',
      'member/profit',
      // 'member/test',
      'bank/support',
      'index/all',
      'index/recommend',
      'index/icon',
      'regular/record',
      'bank/support'
    ],//无需验证方法，在此内容里面的所有方法都不用验证如site/login,site/fff
	],
    
];

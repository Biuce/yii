<?php 

<!-- lang: php -->
$I = new AcceptanceTester($scenario); //创建测试实例
$I->wantTo('perform login test'); //说明测试的目的
$I->amOnPage('/index/index/index'); //打开登录页面
$I->see('Login'); //是否看到Admin Login的文字？
$I->see('/mf/web/user/login/admin'); //是否看到登录链接
$I->fillField('AdminLoginForm[username]','root'); //填写用户名
$I->fillField('AdminLoginForm[password]','root'); //填写密码
$I->click(['name'=>"login-button"]);//点击登录按钮
$I->see('Module Admin');//查看是否登录成功，看到管理页面
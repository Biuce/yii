<?php

Yii::setAlias('@base', dirname(dirname(__DIR__))); //项目根目录path
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('@backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('@api', dirname(dirname(__DIR__)) . '/api');

/* 设置 url 别名 */
Yii::setAlias('@backendUrl', '/'); //后台url
Yii::setAlias('@frontendUrl', '/'); //前台url
Yii::setAlias('@apiUrl', '/api'); //API的url
Yii::setAlias('@storageUrl', 'http://storage.dm_shop.com/'); //存储url
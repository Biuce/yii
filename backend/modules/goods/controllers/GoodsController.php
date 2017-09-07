<?php

namespace backend\modules\goods\controllers;

use Yii;
use yii\web\Response;
use backend\controllers\BaseController;

/**
 * Default controller for the `product` module
 */
class GoodsController extends BaseController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }


    public function actionAdd()
    {
    	$this->layout = "../../../../views/layouts/layouts";
    	
    	return $this->render('add');
    }
}

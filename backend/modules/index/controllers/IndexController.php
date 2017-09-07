<?php

namespace backend\modules\index\controllers;

use Yii;
use yii\web\Response;
use backend\models\Admin;
use common\helpers\AdCommon;
use common\models\AdminGroup;
use backend\controllers\BaseController;

/**
 * Default controller for the `index` module
 */
class IndexController extends BaseController
{
	// public $layout=false;
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}

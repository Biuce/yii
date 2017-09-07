<?php

namespace backend\modules\content\controllers;

use yii\web\Controller;

/**
 * Default controller for the `content` module
 */
class ContentController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
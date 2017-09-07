<?php

namespace backend\modules\config\controllers;

use Yii;
use common\models\Seo;
use yii\data\ActiveDataProvider;
use backend\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * SeoController implements the CRUD actions for Seo model.
 */
class SeoController extends BaseController
{
    /**
     * Lists all Seo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $type = Yii::$app->request->get('type', 'index');
        /* 配置表 分组 */
        $groups = Seo::find()
                ->where(['and', ['type'=>$type]])
                ->one();

        /* 提交表单后 */
        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = Yii::$app->request->post();
            array_shift($data);
            // var_dump($data);die;
            /* 更改配置值 */
            $groups->title = $data['title'];
            $groups->keywords = $data['keywords'];
            $groups->description = $data['description'];
            if ($groups->save()) {
                $this->success('操作成功', $this->getForward());
            } else {
                $this->error('操作错误');
            }
        }

        return $this->render('index', [
            'groups' => $groups,
            'type' => $type,
        ]);
    }

}

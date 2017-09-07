<?php

namespace backend\modules\config\controllers;

use Yii;
use yii\web\Response;
use common\models\Setting;
use backend\controllers\BaseController;

/**
 * Default controller for the `system` module
 */
class ConfigController extends BaseController
{
    public $enableCsrfValidation = false;
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $id = Yii::$app->request->get('id', 1);

    	/* 提交表单后 */
        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = Yii::$app->request->post();
            array_shift($data);
            // var_dump($data);die;
            /* 更改配置值 */
            $isSuccess = true;
            foreach ($data as $name => $value) {
                $model = Setting::findOne(['name'=>$name]);
                // var_dump($value);die;
                $model->value = $value;
                $model->type = $id;
                if (!$model->save()) {
                    $isSuccess = false;
                    continue;
                }
            }
            if ($isSuccess) {
                $this->success('操作成功', $this->getForward());
            }else{
                $this->error('有配置值修改失败');
            }
        }

        /* 添加当前位置到cookie供后续跳转调用 */
        $this->setForward();

        /* 配置表 分组 */
        $groups = Setting::find()
                ->where(['and', ['type'=>$id]])
                ->asArray()
                ->all();

        $data = [];
        foreach ($groups as $key => $value) {
            $data[$value['name']] = $value['value'];
        }
        // echo "<pre>";
        // var_dump($data);die;

        return $this->render('index', [
        	'groups' => $data,
            'id' => $id,
        ]);
    }
}

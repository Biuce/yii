<?php

namespace backend\modules\picture\controllers;

use Yii;
use yii\web\Controller;
use common\models\User;

/**
 * Default controller for the `picture` module
 */
class PictureController extends Controller
{
    public function actions()
    {
        return [
            'crop'=>[
                'class' => 'hyii2\avatar\CropAction',
                'config'=>[
                    'bigImageWidth' => '200',     //大图默认宽度
                    'bigImageHeight' => '200',    //大图默认高度
                    'middleImageWidth'=> '100',   //中图默认宽度
                    'middleImageHeight'=> '100',  //中图图默认高度
                    'smallImageWidth' => '50',    //小图默认宽度
                    'smallImageHeight' => '50',   //小图默认高度
                    //头像上传目录（注：目录前不能加"/"）
                    'uploadPath' => 'uploads/avatar',
                ]
            ]
        ]; 
    }


    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $model = new User();
        return $this->render('index', [
            'model' => $model,
        ]);
    }

    // public function actionUpload(){
    //     Yii::$app->response->format=Response::FORMAT_JSON;
    //     $model = New ImageUpload();
    //     $model->fileInputName = 'file';
    //     if($model->save()){
    //         return ['code'=>0,'message'=>$model->getMessage(),'path'=>$model->getUrlPath()];
    //     }else{
    //         return ['code'=>1,'message'=>$model->getMessage()];
    //     }
    // }
}

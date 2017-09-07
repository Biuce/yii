<?php

namespace backend\modules\config\controllers;

use Yii;
use common\models\Payment;
use yii\data\ActiveDataProvider;
use backend\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * 支付方式控制器
 * 作者 ：lijunwei
 * Email ：731184841@qq.com
 */
class PaymentController extends BaseController
{
    /**
     * ---------------------------------------
     * @支付方式列表
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionIndex()
    {
        $payment = new Payment();
        $where = "1=1";
        $result = $this->query($payment, '', $where, '');
        // echo "<pre>";
        // var_dump($result['data']);die;
        return $this->render('index', [
            'power' => $this->power,
            'result' => $result['data'],
            'count' => $result['count'],
            'page' => $result['page'],
        ]);
    }


    /**
     * ---------------------------------------
     * @编辑支付方式
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionEdit()
    {
        $this->layout = "../../../../views/layouts/layouts";

        $id = Yii::$app->request->get('id', '');
        $model = Payment::find()->where('payment_id =:id', [':id' => $id])->one();

        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = Yii::$app->request->post();
            array_shift($data);
            $data = serialize($data);
            $result['payment_config'] = $data;
            if ($this->saveRow($model, $result)) {
                $this->success('操作成功', $this->getForward());
            } else {
                $this->error('操作错误');
            }
        }
        $payment = unserialize($model->payment_config);
        // var_dump($payment);die;
        return $this->render('add', [
            'model' => $model,
            'payment' => $payment,
        ]);
    }


    /**
     * ---------------------------------------
     * @删除或批量删除
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionDelete(){
        if (!Yii::$app->request->isAjax) {
            throw new \yii\web\MethodNotAllowedHttpException('Access Denied');
        }

        $id = (int)Yii::$app->request->get("id", '');
        if (empty($id)) {
            echo json_encode(['code'=> -1, 'message'=>'参数错误' ,'data'=>[]]);
            exit;
        }

        $admin = Payment::find()->where('payment_id =:id', [':id' => $id])->one();
        if($admin->delete()){
            echo json_encode(['code'=> 1, 'message'=>'删除成功' ,'data'=>[]]);
            exit;
        } else {
            echo json_encode(['code'=> -1, 'message'=>'删除失败！' ,'data'=>[]]);
            exit;
        }
    }


    /**
     * ---------------------------------------
     * @停用与启用
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionChange(){
        if (!Yii::$app->request->isAjax) {
            throw new \yii\web\MethodNotAllowedHttpException('Access Denied');
        }

        $id = (int)Yii::$app->request->get("id");
        $type = (int)Yii::$app->request->get("type");

        if (empty($id) && empty($type)) {
            echo json_encode(['code'=> -1, 'message'=>'参数错误' ,'data'=>[]]);
            exit;
        }

        if($type == 1){
            $result['payment_state'] = 0;
        }else{
            $result['payment_state'] = 1;
        }

        if (Payment::updateAll(['payment_state' => $result['payment_state']], ['payment_id' => $id])) {
            echo json_encode(['code'=> 1, 'message'=>'修改成功' ,'data'=>['id' => $id]]);
            exit;
        }else{
            echo json_encode(['code'=> -1, 'message'=>'修改失败' ,'data'=>['id' => $id]]);
            exit;
        }
    }
}

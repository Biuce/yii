<?php

namespace backend\modules\admin\controllers;

use Yii;
use yii\web\Response;
use common\models\AdminDolog;
use yii\data\ActiveDataProvider;
use backend\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * 后台操作日志控制器
 * 作者 ：lijunwei
 * Email ：731184841@qq.com
 */
class AdmindologController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['GET'],
                ],
            ],
        ];
    }

    /**
     * ---------------------------------------
     * @操作日志列表页
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionIndex()
    {
        /* 添加当前位置到cookie供后续跳转调用*/
        $this->setForward();
        $admindolog = new AdminDolog();
        $where = "1=1";
        $search = $this->get('search','');
        //搜索
        if(!empty($search['type']) && !empty($search['keyword']))
        {
            $where .= " and " . $search['type'] ." like '%" . $search['keyword'] . "%'";
        }

        //添加时间搜索
        if(!empty($search['stime']))
        {
            $stime = strtotime($search['stime']);
            $etime = empty($search['etime']) ? time() : strtotime($search['etime']);
            $where .= " and time between " . $stime ." and " . $etime;
        }
        // echo $where;die;
        $order = 'time DESC';
        $result = $this->query($admindolog, '', $where, $order);
        // echo "<pre>";
        // var_dump($result['data']);die;
        return $this->render('index', [
            'power' => $this->power,
            'result' => $result['data'],
            'count' => $result['count'],
            'page' => $result['page'],
            'searchvalue' => $search,
            'search' => [
                'uid' => \yii::t('app', '操作用户ID'),
                'username' => \yii::t('app', '操作用户名'),
                'controller' => \yii::t('app', '操作控制器'),
                'action' => \yii::t('app', '操作动作'),
                'ip' => \yii::t('app', '操作IP'),
                'title' => \yii::t('app', '名称'),
            ],
        ]);
    }

    
    /**
     * ---------------------------------------
     * @删除或批量删除
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionDelete()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        if (!Yii::$app->request->isAjax) {
            throw new \yii\web\MethodNotAllowedHttpException('Access Denied');
        }

        $id = (int)Yii::$app->request->get("id", '');
        if (empty($id)) {
            echo json_encode(['code'=> -1, 'message'=>'参数错误' ,'data'=>[]]);
            exit;
        }

        $admindolog = AdminDolog::find()->where('id =:id', [':id' => $id])->one();
        if($admindolog->delete()){
            echo json_encode(['code'=> 1, 'message'=>'删除成功' ,'data'=>[]]);
            exit;
        } else {
            echo json_encode(['code'=> -1, 'message'=>'删除失败！' ,'data'=>[]]);
            exit;
        }
    }
}

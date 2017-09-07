<?php

namespace backend\modules\admin\controllers;

use Yii;
use yii\web\Response;
use backend\models\Admin;
use common\helpers\AdCommon;
use common\models\AdminGroup;
use backend\controllers\BaseController;

/**
 * 后台菜单控制器
 * 作者 ：lijunwei
 * Email ：731184841@qq.com
 */
class AdminController extends BaseController
{
    /**
     * ---------------------------------------
     * @管理员列表页
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionIndex()
    {
        /* 添加当前位置到cookie供后续跳转调用*/
        $this->setForward();
        $admin = new Admin();
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
			$where .= " and createtime between " . $stime ." and " . $etime;
		}
		// var_dump($search);die;
		//登录时间搜索
		if(!empty($search['cstime']))
		{
			$cstime = strtotime($search['cstime']);
			$cetime = empty($search['cetime']) ? time() : strtotime($search['cetime']);
			$where .= " and logintime between " . $cstime ." and " . $cetime;
		}
		// echo $where;die;
        $order = 'createtime DESC';
        $result = $this->query($admin, '', $where, $order);
        // echo "<pre>";
        // var_dump($result['data']);die;
        return $this->render('index', [
            'power' => $this->power,
            'result' => $result['data'],
            'count' => $result['count'],
            'page' => $result['page'],
            'searchvalue' => $search,
            'search' => [
            	'adminid' => \yii::t('app', '管理员ID'),
            	'adminuser' => \yii::t('app', '管理员名称'),
            	'adminemail' => \yii::t('app', '管理员邮箱'),
            ],
        ]);
    }


    /**
     * ---------------------------------------
     * @添加管理员
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionAdd()
    {
        $this->layout = "../../../../views/layouts/layouts";

        $model = new Admin();

        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = Yii::$app->request->post('Admin');
            if ($data['adminpass'] === $data['repass']) {
                $codes = (!empty($data['adminpass'])) ? AdCommon::randomkeys() : '';
                $result['adminuser'] = $data['adminuser'];
                $result['mobile'] = $data['mobile'];
                $result['adminemail'] = $data['adminemail'];
                $result['group_id'] = $data['group_id'];
                $result['status'] = 1;
                $result['createtime'] = time();
                $result['codes'] = $codes;
                $result['adminpass'] = Admin::encryPassword($codes, $data['adminpass']);
                if ($this->saveRow($model, $result)) {
                    // $this->success('操作成功', $this->getForward());
                    echo json_encode(['code'=> 1, 'message'=>'操作成功' ,'data'=>[]]);
                    exit;
                } else {
                    // $this->error('操作错误');
                    echo json_encode(['code'=> -1, 'message'=>'操作错误' ,'data'=>[]]);
                    exit;
                }
            } else {
                echo json_encode(['code'=> -1, 'message'=>'两次密码不一致！' ,'data'=>[]]);
                exit;
                // $this->error('两次密码不一致！');
            }
        }

        $admingroup = new AdminGroup();
        $rule = $admingroup->getList();
        // var_dump($rule);die;
        return $this->render('add', [
            'model' => $model,
            'rule' => $rule,
        ]);
    }


    /**
     * ---------------------------------------
     * @编辑管理员
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionEdit()
    {
        $this->layout = "../../../../views/layouts/layouts";

        $id = Yii::$app->request->get('id', '');
        $model = Admin::find()->where('adminid =:id', [':id' => $id])->one();

        if (Yii::$app->request->isAjax) {
            /* 表单验证 */
            $data = Yii::$app->request->post('Admin');
            if ($data['adminpass'] === $data['repass']) {
                $codes = (!empty($data['adminpass'])) ? AdCommon::randomkeys() : '';
                $result['adminuser'] = $data['adminuser'];
                $result['mobile'] = $data['mobile'];
                $result['adminemail'] = $data['adminemail'];
                $result['group_id'] = $data['group_id'];
                $result['status'] = 1;
                $result['createtime'] = time();
                $result['codes'] = $codes;
                $result['adminpass'] = Admin::encryPassword($codes, $data['adminpass']);
                if ($this->saveRow($model, $result)) {
                    // $this->success('操作成功', $this->getForward());
                    echo json_encode(['code'=> 1, 'message'=>'操作成功' ,'data'=>[]]);
                    exit;
                } else {
                    echo json_encode(['code'=> -1, 'message'=>'操作错误' ,'data'=>[]]);
                    exit;
                    // $this->error('操作错误');
                }
            } else {
                // $this->error('两次密码不一致！');
                echo json_encode(['code'=> -1, 'message'=>'两次密码不一致！' ,'data'=>[]]);
                exit;
            }
        }

        $admingroup = new AdminGroup();
        $rule = $admingroup->getList();
        // var_dump($model);die;
        return $this->render('add', [
            'model' => $model,
            'rule' => $rule,
        ]);
    }


    /**
     * ---------------------------------------
     * @删除或批量删除
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionDelete(){
        Yii::$app->response->format = Response::FORMAT_JSON;

        if (!Yii::$app->request->isAjax) {
            throw new \yii\web\MethodNotAllowedHttpException('Access Denied');
        }

        $id = (int)Yii::$app->request->get("id", '');
        if (empty($id)) {
            echo json_encode(['code'=> -1, 'message'=>'参数错误' ,'data'=>[]]);
            exit;
        }

        $admin = Admin::find()->where('adminid =:id', [':id' => $id])->one();
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
        Yii::$app->response->format = Response::FORMAT_JSON;

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
            $result['status'] = 2;
        }else{
            $result['status'] = 1;
        }

        if (Admin::updateAll(['status' => $result['status']], ['adminid' => $id])) {
            echo json_encode(['code'=> 1, 'message'=>'修改成功' ,'data'=>['id' => $id]]);
            exit;
        }else{
            echo json_encode(['code'=> -1, 'message'=>'修改失败' ,'data'=>['id' => $id]]);
            exit;
        }
    }
}

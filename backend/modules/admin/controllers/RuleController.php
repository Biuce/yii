<?php

namespace backend\modules\admin\controllers;

use Yii;
use yii\web\Response;
use yii\helpers\Url;
use backend\models\Menu;
use common\models\AdminGroup;
use backend\controllers\BaseController;

class RuleController extends BaseController
{
    public function actionIndex()
    {
    	$group = new AdminGroup();
    	$order = 'create_time ASC';
    	$admingroup = $this->query($group, '', '', $order);

        return $this->render('index', [
            'power' => $this->power,
        	'admingroup' => $admingroup['data'],
        	'count' => $admingroup['count'],
        	'page' => $admingroup['page'],
        ]);
    }

	
    /**
     * ---------------------------------------
     * 角色授权添加
     * ---------------------------------------
     */
    public function actionAdd()
    {
    	$this->layout = "../../../../views/layouts/layouts";
    	$model = new AdminGroup();

    	/* 提交后 */
        if ($this->isPost()) 
	    {
	        $admingroup  = $this->post('AdminGroup');
	        $pPower = $this->post('power');
	        $sPower = $this->post('powerid');
            $cPower = $this->post('childid');
	        $rolePower = implode(',', array_merge((array)$pPower, (array)$sPower, (array)$cPower));
	        // var_dump($this->admin['adminuser']);die;
            $result['group_name'] = $admingroup['group_name'];
            $result['desc'] = $admingroup['desc'];
            $result['create_user'] = $this->admin['adminuser'];
            $result['power'] = $rolePower;
            $result['state'] = 1;
            $result['create_time'] = time();

            if ($this->saveRow($model, $result)) {
                echo json_encode(['code'=> 1, 'message'=>'操作成功' ,'data'=>[]]);
                exit;
                // $this->success('操作成功', Url::toRoute(['/admin/rule/index']));
            } else {
                echo json_encode(['code'=> -1, 'message'=>'操作错误' ,'data'=>[]]);
                exit;
                // $this->error('操作错误');
            }
	    } 

        /* 获取栏目节点 */
        $node_list  = Menu::returnNodes();

        return $this->render('add',[
            'node_list' => $node_list,
            'model' => $model,
        ]);
    }


    /**
     * ---------------------------------------
     * 角色授权编辑
     * ---------------------------------------
     */
    public function actionEdit()
    {
        $this->layout = "../../../../views/layouts/layouts";
        $id = (int)Yii::$app->request->get('id', '');
        $model = AdminGroup::find()->where('id =:id', [':id' => $id])->one();

        /* 提交后 */
        if ($this->isPost()) 
        {
            $admingroup  = $this->post('AdminGroup');
            $pPower = $this->post('power');
            $sPower = $this->post('powerid');
            $cPower = $this->post('childid');
            $rolePower = implode(',', array_merge((array)$pPower, (array)$sPower, (array)$cPower));
            // var_dump($this->admin['adminuser']);die;
            $result['group_name'] = $admingroup['group_name'];
            $result['desc'] = $admingroup['desc'];
            $result['create_user'] = $this->admin['adminuser'];
            $result['power'] = $rolePower;
            $result['state'] = 1;

            if ($this->saveRow($model, $result)) {
                echo json_encode(['code'=> 1, 'message'=>'操作成功' ,'data'=>[]]);
                exit;
                // $this->success('操作成功', Url::toRoute(['/admin/rule/index']));
            } else {
                echo json_encode(['code'=> -1, 'message'=>'操作错误' ,'data'=>[]]);
                exit;
                // $this->error('操作错误');
            }
        } 

        /* 获取栏目节点 */
        $node_list  = Menu::returnNodes();
        $rolePower = explode(',', $model['power']);
        // var_dump($rolePower);die;
        return $this->render('add',[
            'node_list' => $node_list,
            'model' => $model,
            'rolePower' => $rolePower,
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

        $admin = AdminGroup::find()->where('id =:id', [':id' => $id])->one();
        if($admin->delete()){
            echo json_encode(['code'=> 1, 'message'=>'删除成功' ,'data'=>[]]);
            exit;
        } else {
            echo json_encode(['code'=> -1, 'message'=>'删除失败！' ,'data'=>[]]);
            exit;
        }
    }

}

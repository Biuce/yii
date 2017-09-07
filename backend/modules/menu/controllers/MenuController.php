<?php

namespace backend\modules\menu\controllers;

use Yii;
use common\models\Menu;
use yii\web\Response;
use backend\controllers\BaseController;

/**
 * 后台菜单控制器
 * 作者 ：lijunwei
 * Email ：731184841@qq.com
 */
class MenuController extends BaseController
{
    /**
     * ---------------------------------------
     * @列表页
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionIndex()
    {
        /* 添加当前位置到cookie供后续跳转调用*/
        $this->setForward();
        $menu = new Menu();
        $pid = $this->get('pid',0);
        $pid = $pid ? $pid : 0;
        $where = "pid = ".$pid;
        $search = $this->get('search','');
        //搜索
        if(!empty($search['type']) && !empty($search['keyword']))
        {
            $where .= " and " . $search['type'] ." like '%" . $search['keyword'] . "%'";
        }

        $order = 'sort ASC';
        $result = $this->query($menu, '', $where, $order);
        // echo "<pre>";
        // var_dump($result);die;
        return $this->render('index', [
            'power' => $this->power,
            'result' => $result['data'],
            'count' => $result['count'],
            'page' => $result['page'],
            'searchvalue' => $search,
            'search' => ['id' => \yii::t('app', '菜单ID'),'title' => \yii::t('app', '菜单标题'),],
        ]);
    }

    /**
     * ---------------------------------------
     * @添加
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionAdd(){
        $pid = $this->get('pid',0);

        $model = $this->findModel(0);

        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = $this->post('Menu');
            $data['status'] = 1;

            if ($this->saveRow($model, $data)) {
                $this->success('操作成功', $this->getForward());
            } else {
                $this->error('操作错误');
            }
        }

        /* 设置默认值 */
        $model->loadDefaultValues();
        $model->pid = $pid;
        /* 渲染模板 */
        return $this->render('add', [
            'model' => $model,
        ]);
    }

    /**
     * ---------------------------------------
     * @编辑
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionEdit(){
        $id = Yii::$app->request->get('id',0);
        $model = $this->findModel($id);

        if (Yii::$app->request->isPost) {
            /* 表单验证 */
            $data = Yii::$app->request->post('Menu');

            if ($this->saveRow($model, $data)) {
                $this->success('操作成功', $this->getForward());
            } else {
                $this->error('操作错误');
            }
        }
        /* 渲染模板 */
        return $this->render('add', [
            'model' => $model,
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

        $id = (int)Yii::$app->request->get("id");
        if (empty($id)) {
            echo json_encode(['code'=> -1, 'message'=>'参数错误' ,'data'=>[]]);
            exit;
        }
        $data = Menu::find()->where('pid = :pid', [":pid" => $id])->one();
        // var_dump($data);die;
        if ($data) {
            echo json_encode(['code'=> -1, 'message'=>'该分类下有子类，不允许删除' ,'data'=>[]]);
            exit;
        }

        if($this->findModel($id)->delete()){
            echo json_encode(['code'=> 1, 'message'=>'删除成功' ,'data'=>[]]);
            exit;
        } else {
            echo json_encode(['code'=> -1, 'message'=>'删除失败！' ,'data'=>[]]);
            exit;
        }
    }

    /**
     * ---------------------------------------
     * @隐藏与取消隐藏
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

        $data = Menu::find()->where('pid = :pid', [":pid" => $id])->one();
        // var_dump($data);die;
        if ($data) {
            echo json_encode(['code'=> -1, 'message'=>'该分类下有子类，不允许隐藏' ,'data'=>[]]);
            exit;
        }

        if($type == 1){
            $result['hide'] = 1;
        }else{
            $result['hide'] = 0;
        }

        if (Menu::updateAll(['hide' => $result['hide']], ['id' => $id])) {
            echo json_encode(['code'=> 1, 'message'=>'修改成功' ,'data'=>['id' => $id]]);
            exit;
        }else{
            echo json_encode(['code'=> -1, 'message'=>'修改失败' ,'data'=>['id' => $id]]);
            exit;
        }
    }


    protected function findModel($id)
    {
        if ($id == 0) {
            return new Menu();
        }
        if (($model = Menu::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

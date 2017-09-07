<?php
namespace backend\controllers;

use Yii;
use yii\helpers\Url;
use yii\imagine\Image;
use common\models\Menu;
use yii\data\Pagination;
use backend\models\Config;
use common\core\Controller;
use common\models\AdminDolog;
use backend\service\MenuService;
use yii\data\ActiveDataProvider;

/*
 * ---------------------------------------
 * 后台父类控制器 
 * 后台所有控制器都继承自该类
 * @author phphome@qq.com 
 * ---------------------------------------
 */
class BaseController extends Controller
{
    /**
     * [$admin 用户个人信息]
     * @var [type]
     */
    public $admin;
    public $power;

    /**
     * ---------------------------------------
     * 后台构造函数
     * ---------------------------------------
     */
    public function init()
    {
        parent::init();  

        if (empty(\Yii::$app->session['admin'])) {
            $this->success('请先登录', Url::toRoute('/login/login/index'));
        } else {
            # 管理员信息
            $this->admin = \yii::$app->session['admin'];
            # 权限
            $this->power = $this->_setPower();
            // \yii::$app->params['setting'] = \lib\models\Setting::getSetting();
        }   
    }

    /**
     * [_setPower 传递角色权限到视图]
     */
    private function _setPower()
    {
        $power = $this->admin['adminid'] != 1 ? \yii::$app->session['power'] : '';
        $power = MenuService::app()->getPower($power);
        return $power;
    }

    /**
     * [beforeAction description]
     * @param  [type] $action [description]
     * @return [type]         [description]
     */
    public function beforeAction($action)
    {
        $this->_doLog();

       return parent::beforeAction($action);
    }
    
    /**
     * ---------------------------------------
     * 标记当前位置到cookie供后续跳转调用
     * ---------------------------------------
     */
    public function setForward(){
        \Yii::$app->getSession()->setFlash('__forward__', $_SERVER['REQUEST_URI']);
    }

    /**
     * ---------------------------------------
     * 获取之前标记的cookie位置
     * @param string $default
     * @return mixed
     * ---------------------------------------
     */
    public function getForward($default=''){
        $default = $default ? $default : Url::toRoute([Yii::$app->controller->id.'/index']);
        if( Yii::$app->getSession()->hasFlash('__forward__') ) {
            return Yii::$app->getSession()->getFlash('__forward__');
        } else {
            return $default;
        }
    }

    /**
     * [page 分页]
     * @param  [int] $count [总条数]
     * @return [type]        [description]
     */
    public function page($count)
    {
        return $pagination = new Pagination([
            'pageSize'   => Yii::$app->params['pageSize'],
            'totalCount' => $count,
        ]);
    }

    /**
     * [query 查询所有记录]
     * @param  [type] $model [Model]
     * @param  string $with  [联表]
     * @param  array $where [条件]
     * @param  string $order [排序]
     * @return [type]        [description]
     */
    public function query($model, $with = '', $where = [], $order = 'id desc')
    {
        $query = $model->find();
        if ($with != '') $query = $query->innerJoinWith($with);
        if ($where != '') $query  =  $query->where($where);

        $count = $query->count();
        $page  = $this->page($count);

        $query  = $query->orderBy($order)->offset($page->offset)->limit($page->limit)->all();
        
        return ['count' => $count, 'page' => $page, 'data' => $query];
    }

    /**
     * [view 渲染视图]
     * @param  string $view [视图名称]
     * @return [type]       [nul]
     */
    public function view($view = '')
    {
        if ($view == '') 
        {
            $view = $this->action->id;
        }

        return $this->render($view, $this->data);
    }

    /**
     * [get 获取GET参数]
     * @param  string $key [参数名称]
     * @return [string]      [参数值]
     */
    public function get($key = '')
    {
        $get  = \Yii::$app->request->get($key);

        if (is_array($get))
        {
            foreach ($get as $k => $v)
            {
                $get[$k] = trim($v);
            }
            
            return $get;
        }
        else
        {
            return trim($get);
        }
        
    }

    
    /**
     * [post post参数获取]
     * @param  string $key [表单Name]
     * @return [type]      [表单值]
     */
    public function post($key = '')
    {
        $post = \Yii::$app->request->post($key);
        if (is_array($post))
        { 
            foreach ($post as $k => $v)
            {
                $post[$k] = trim($v);
            }
            return $post;
        }
        else
        {
            return trim($post);
        }
        
    }

    /**
     * [isPost 是否Post方式提交]
     * @return boolean [返回值]
     */
    public function isPost()
    {
        return Yii::$app->request->getIsPost();
    }

    /**
     * [isGet 是否GET方式提交]
     * @return boolean [description]
     */
    public function isGet()
    {
        return Yii::$app->request->getIsAjax();
    }

    /**
     * ---------------------------------------
     * 传统分页列表数据集获取方法
     * @param \yii\db\ActiveRecord $model   模型名或模型实例
     * @param array $where   where查询条件
     * @param array|string $order   排序条件
     * @return array|false
     * ---------------------------------------
     */
    public function lists($model, $where=[], $order=''){
        $query = $model::find()->where($where);
        $countQuery = clone $query;
        $pages = new Pagination([
            'totalCount' => $countQuery->count(),
            'defaultPageSize' => 10,
        ]);
        $data  = $query->orderBy($order)->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        return [$data, $pages];
    }

    /**
     * ---------------------------------------
     * dataProvider列表数据集获取方法
     * @param \yii\db\ActiveRecord $model   模型名或模型实例
     * @param array        $where   where查询条件
     * @param array|string $order   排序条件
     * @return \yii\data\ActiveDataProvider
     * ---------------------------------------
     */
    public function lists1($model, $where=[], $order=''){
        $query = $model::find()->where($where)->orderBy($order)->asArray();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $dataProvider;
    }

    /**
     * ---------------------------------------
     * 修改数据表一条记录的一条值
     * @param \yii\db\ActiveRecord $model 模型名称
     * @param array  $data 数据
     * @return \yii\db\ActiveRecord|boolean
     * ---------------------------------------
     */
    public function saveRow($model, $data){
        if (empty($data)) {
            return false;
        }
        if ($model->load($data, '') && $model->validate()) {
            /* 添加到数据库中,save()会自动验证rule */
            if ($model->save()) {
                return $model;
            }else{
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * ---------------------------------------
     * 由表主键删除数据表中的多条记录
     * @param \yii\db\ActiveRecord $model 模型名称,供M函数使用的参数
     * @param string  $pk  修改的数据
     * @return boolean
     * ---------------------------------------
     */
    public function delRow($model, $pk='id' ){
        $ids = Yii::$app->request->param($pk, 0);
        $ids = implode(',', array_unique((array)$ids));

        if ( empty($ids) ) {
            return false;
        }

        $_where = $pk.' in('.$ids.')';
        if($model::deleteAll($_where)){
            return true;
        } else {
            return false;
        }
    }


    /**
     * [alert description]
     * @param  [type] $msg     [description]
     * @param  [type] $url     [description]
     * @param  string $charset [description]
     * @return [type]          [description]
     */
    public function alert($msg, $url = NULL, $charset='utf-8')
    {
        header("Content-type: text/html; charset={$charset}");
        $alert_msg="alert('$msg');";
        if( empty($url) ) {
            $go_url = 'history.go(-1);';
        }else{
            $go_url = "window.location.href = '{$url}'";
        }
        echo "<script>$alert_msg $go_url</script>";
        exit;
    }
    

    /**
     * ----------------------------------------------
     * 操作错误跳转的快捷方法
     * @access protected
     * @param string $message 错误信息
     * @param string $jumpUrl 页面跳转地址
     * @param mixed $ajax 是否为Ajax方式 当数字时指定跳转时间
     * @return void
     * -----------------------------------------------
     */
    protected function error($message='',$jumpUrl='',$ajax=false) {
        $this->dispatchJump($message,0,$jumpUrl,$ajax);
    }

    /**
     * ----------------------------------------------
     * 操作成功跳转的快捷方法
     * @access protected
     * @param string $message 提示信息
     * @param string $jumpUrl 页面跳转地址
     * @param mixed $ajax 是否为Ajax方式 当数字时指定跳转时间
     * @return void
     * ----------------------------------------------
     */
    protected function success($message='',$jumpUrl='',$ajax=false) {
        $this->dispatchJump($message,1,$jumpUrl,$ajax);
    }

    /**
     * ----------------------------------------------
     * 默认跳转操作 支持错误导向和正确跳转
     * 调用模板显示 默认为public目录下面的success页面
     * 提示页面为可配置 支持模板标签
     * @param string $message 提示信息
     * @param int $status 状态
     * @param string $jumpUrl 页面跳转地址
     * @param mixed $ajax 是否为Ajax方式 当数字时指定跳转时间
     * @access private
     * @return void
     * ----------------------------------------------
     */
    private function dispatchJump($message,$status=1,$jumpUrl='',$ajax=false) {
        $jumpUrl = !empty($jumpUrl)? (is_array($jumpUrl)?Url::toRoute($jumpUrl):$jumpUrl):'';
        if(true === $ajax || Yii::$app->request->isAjax) {// AJAX提交
            $data           =   is_array($ajax)?$ajax:array();
            $data['info']   =   $message;
            $data['status'] =   $status;
            $data['url']    =   $jumpUrl;
            $this->ajaxReturn($data);
        }
        // 成功操作后默认停留1秒
        $waitSecond = 3;

        if($status) { //发送成功信息
            $message = $message ? $message : '提交成功' ;// 提示信息
            // 默认操作成功自动返回操作前页面
            echo $this->renderFile(Yii::$app->params['action_success'],[
                'message' => $message,
                'waitSecond' => $waitSecond,
                'jumpUrl' => $jumpUrl,
            ]);
        }else{
            $message = $message ? $message : '发生错误了' ;// 提示信息
            // 默认发生错误的话自动返回上页
            $jumpUrl = "javascript:history.back(-1);";
            echo $this->renderFile(Yii::$app->params['action_error'], [
                'message' => $message,
                'waitSecond' => $waitSecond,
                'jumpUrl' => $jumpUrl,
            ]);
        }
        //Yii::$app->end();
        exit;
    }

    /**
     * ------------------------------------------------
     * Ajax方式返回数据到客户端
     * @access protected
     * @param mixed $data 要返回的数据
     * @return void
     * ------------------------------------------------
     */
    protected function ajaxReturn($data) {
        // 返回JSON数据格式到客户端 包含状态信息
        header('Content-Type:application/json; charset=utf-8');
        echo json_encode($data);
        //Yii::$app->end();
        exit;
    }


    /**
     * @desc 返回错误信息
     * @param type $array
     * @return type
     */
    public function modelMessage($array)
    {
        
        if (count($array) <= 0)
        {
            return;
        }
        $msg = '';
        
        foreach ($array as $val)
        {
            $msg .= isset($val[0]) ? $val[0] : $val;
        }
        return $msg;
    }


    /**
     * [_doLog 操作日志]
     * @return [type] [description]
     */
    private function _doLog()
    {
        $model = new AdminDolog();
        # 操作名称
        $url   = '/'.$this->module->id.'/' . $this->id . '/' . $this->action->id;

        $query = Menu::find()->where(['url'=>$url])->asArray()->one();

        $title = isset($query['title']) ? $query['title'] : '';

        # 操作内容
        if(isset($_POST['id']) && trim($_POST['id']) != '')
        {
            $title .= ',id=' . $_POST['id'];
        }

        if(isset($_GET['id']) && trim($_GET['id']) != '')
        {
            $title .= ',id=' . $_GET['id'];
        }

        if(isset($_POST['data']) && trim($_POST['data']) != '')
        {
            $title .= ',id=' . $_POST['data'];
        }
        
        $doing  = json_encode($_POST);
        // var_dump($this->id);die;
        # 入库
        $data = array();
        $data['ip']       = \Yii::$app->request->getUserIp();
        $data['time']     = time();
        $data['uid']      = \yii::$app->session['admin']['adminid'];
        $data['username'] = \yii::$app->session['admin']['adminuser'];
        $data['controller']   = strtolower($this->id);
        $data['action']   = strtolower($this->action->id);
        $data['title']    = $title;
        $data['doing']    = $doing;
        
        $model->attributes = $data;
        
        $arr = $model->save();
    }

    /**
     *
     * $path = "/##/###.png"
     * 图片上传
     */
    public static function upload_thumbnail_img($model, $path='', $width='', $height='', $ext='png'){
        
        // 初始化
        $data = [];
        $save_db_path_arr = [];
        $img_format_arr = array('jpg', 'jpeg', 'png', 'gif');

        $path_explode = explode('/', $path);
        
        // 图片名称
        $image_name = $path_explode[count($path_explode)-1];

        $image_exploade = explode('.', $image_name);

        if(count($image_exploade) <= 1) 
            return $data = ['status'=>'error', 'data'=>'指定图片路径有误'];
        
        $temp_ext = $image_exploade[count($image_exploade)-1];

        if(!in_array($temp_ext, $img_format_arr)) 
            return $data = ['status'=>'error', 'data'=>'上传图片格式有误'];

        // 缩略图路径
        $path_thumbnail = \Yii::$app->params['upload']['path'];

        // 原始图片路径
        $path_original = \Yii::$app->params['upload']['path'].'origina/';
        if(!is_dir($path_original)) mkdir($path_original, 0777);

        // 删除最有一个元素：图片名称
        array_pop($path_explode); 

        // 创建指定路径的目录
        foreach ($path_explode as $p_key => $p_val) {

            $path_thumbnail .= $p_val.'/';
            
            $path_original .= $p_val.'/';

            // 保存图片路径
            if(!is_dir($path_thumbnail)) mkdir($path_thumbnail, 0777);

            if(!is_dir($path_original)) mkdir($path_original, 0777);

            $save_db_path_arr[] = $p_val;
        }

        // 原始图片 -路径组合
        $origina_image_path = $path_original.$image_name;

        // 保存原始图片
        if (!empty($model->image)) {
            $model->image->saveAs($origina_image_path);
        } else {
             $model->goods_image->saveAs($origina_image_path);
        }
               
        //缩略图处理  - 文件路径 ，宽，高
        Image::thumbnail($origina_image_path, $width, $height)->save(\Yii::getAlias($path_thumbnail.'/'.'thumb_'.$image_name), ['quality' => 100]);
        
        // 存储图片路径
        if (!empty($model->image)) {
            $model->image = implode('/', $save_db_path_arr).'/'.'thumb_'.$image_name;
        } else {
             $model->goods_image = implode('/', $save_db_path_arr).'/'.'thumb_'.$image_name;
        }

        $data = ['status'=>'success', 'data'=>$model];

        return $data;
    }

}

<?php

namespace backend\modules\login\controllers;

use Yii;
use yii\web\Controller;
use common\models\Admin;
use yii\helpers\Url;
use backend\service\AdminService;

/**
 * 后台登录控制器
 * 作者 ：lijunwei
 * Email ：731184841@qq.com
 */
class LoginController extends Controller
{
    public $enableCsrfValidation=false;

    /**
     * ---------------------------------------
     * @验证码
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actions()
    {
        return [
             'error' => [
                 'class' => 'yii\web\ErrorAction',
             ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'backColor' => 0xE1E1E1,
                'foreColor' => 0x1d70d8,
                'maxLength' => '4', // 最多生成几个字符
                'minLength' => '4', // 最少生成几个字符
                'width' => '85',
                'height' => '40',
                'padding' => 0,
            ],
        ];
    }

    /**
     * ---------------------------------------
     * @用户登录
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionIndex()
    {
        $this->layout = false;
    	$model = new Admin();
        if(Yii::$app->request->isPost) {
            $post = Yii::$app->request->post('admin','');
            if($this->createAction('captcha')->validate($post['captcha'],false)) {
                $data = ['adminuser' => $post['adminuser'], 'adminpass' => $post['adminpass']];
                $result = AdminService::APP()->login($data);
                if ($result['status'] == 0) {
                    $this->redirect(['/index/index/index']);
                } else {
                    $this->error($result['msg']);
                }
            } else {
                $this->error('验证码错误！');
            }
        }

        return $this->render('index',['model' => $model]);
    }


    /**
     * ---------------------------------------
     * @退出登录
     * @author:lijunwei
     * ---------------------------------------
     */
    public function actionLogout()
    {
        unset(\Yii::$app->session['admin']);
        return $this->redirect(Url::toRoute('/login/login/index'));
    }

}

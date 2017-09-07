<?php
/**
 * Created by PhpStorm.
 * User: StoneShowLee
 * Date: 2017/3/7
 * Time: 10:49
 */
namespace common\helpers;

use Yii;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;

class Uploader{
    /**
     * 假如只上传单个文件，获取文件名时为 $picfile[0]
     * @param $UploadName 上传文件名
     * @param $moudle  上传到模块的名称
     * @param array $picfile 返参数组
     * @return array
     */
        public static function UploadFile($UploadName,$moudle='storage',$dir = '/api/uploads/',$picfile=array())
        {
            $dir = $dir.date('Y').'/'.date('m').'/';
            //$host = Yii::$app->request->hostInfo;
            $host = Yii::$app->params['api_image_domain'].'/web';
            $images = UploadedFile::getInstancesByName($UploadName);
            if (count($images) > 0) {
                foreach ($images as $key => $image) {
                    if ($image->size > 2048 * 1024) {
                        $res = ['error' => '图片最大不可超过2M'];
                        return $res;
                    }
                    if (!in_array(strtolower($image->extension), array('gif', 'jpg', 'jpeg', 'png'))) {
                        $res = ['error' => '请上传标准图片文件, 支持gif,jpg,png和jpeg.'];
                        return $res;
                    }
                    //生成唯一uuid用来保存到服务器上图片名称
                    $pickey = StringHelper::genuuid();
                    $filename = $pickey . '.' . $image->getExtension();

                    //如果文件夹不存在，则新建文件夹
                    if (!file_exists(Yii::getAlias('@'.$moudle) . '/web' . $dir)) {
                        FileHelper::createDirectory(Yii::getAlias('@'.$moudle) . '/web' . $dir, 0777);
                    }
                    $filepath = realpath(Yii::getAlias('@'.$moudle) . '/web' . $dir) . '/';
                    $file = $filepath . $filename;

                    if ($image->saveAs($file)) {
                        $imgpath = $host.$dir . $filename;
                        $picfile[] = $imgpath;
                    }else{
                        $picfile['error'] = '上传失败';
                    }
                }
            }
            return $picfile;

        }


    /**
     * 假如只上传单个文件，获取文件名时为 $picfile[0]
     * @param $UploadName 上传文件名
     * @param $moudle  上传到模块的名称
     * @param array $picfile 返参数组
     * @return array
     */
    public static function UploadFile2($model,$name,$moudle='storage',$dir = '/api/uploads/',$picfile=array())
    {
        $dir = $dir.date('Y').'/'.date('m').'/';
        //$host = Yii::$app->request->hostInfo;
        $host = Yii::$app->params['api_image_domain'].'/web';
        $image = UploadedFile::getInstance($model, $name);
        if($image){
            if ($image->size > 2048 * 1024) {
                $res = ['error' => '图片最大不可超过2M'];
                return $res;
            }
            if (!in_array(strtolower($image->extension), array('gif', 'jpg', 'jpeg', 'png'))) {
                $res = ['error' => '请上传标准图片文件, 支持gif,jpg,png和jpeg.'];
                return $res;
            }
            //生成唯一uuid用来保存到服务器上图片名称
            $pickey = StringHelper::genuuid();
            $filename = $pickey . '.' . $image->getExtension();

            //如果文件夹不存在，则新建文件夹
            if (!file_exists(Yii::getAlias('@'.$moudle) . '/web' . $dir)) {
                FileHelper::createDirectory(Yii::getAlias('@'.$moudle) . '/web' . $dir, 0777);
            }
            $filepath = realpath(Yii::getAlias('@'.$moudle) . '/web' . $dir) . '/';
            $file = $filepath . $filename;

            if ($image->saveAs($file)) {
                $imgpath = $host.$dir . $filename;
                $picfile[] = $imgpath;
            }else{
                $picfile['error'] = '上传失败';
            }
        }

        return $picfile;

    }



}
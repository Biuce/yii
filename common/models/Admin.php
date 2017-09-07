<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin}}".
 *
 * @property string $adminid
 * @property integer $group_id
 * @property string $adminuser
 * @property string $mobile
 * @property string $adminpass
 * @property string $codes
 * @property string $adminemail
 * @property string $logintime
 * @property string $loginip
 * @property string $createtime
 * @property integer $status
 */
class Admin extends \yii\db\ActiveRecord
{
    public $repass = '';
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_id'], 'required'],
            [['group_id', 'logintime', 'loginip', 'createtime', 'status'], 'integer'],
            [['adminuser', 'codes'], 'string', 'max' => 32],
            [['mobile'], 'string', 'max' => 15],
            [['adminpass'], 'string', 'max' => 64],
            [['adminemail'], 'string', 'max' => 50],
            [['adminuser', 'adminpass'], 'unique', 'targetAttribute' => ['adminuser', 'adminpass'], 'message' => 'The combination of Adminuser and Adminpass has already been taken.'],
            [['adminuser', 'adminemail'], 'unique', 'targetAttribute' => ['adminuser', 'adminemail'], 'message' => 'The combination of Adminuser and Adminemail has already been taken.'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'adminid' => '管理员ID',
            'group_id' => '角色ID',
            'adminuser' => '管理员名称',
            'mobile' => '管理员电话',
            'adminpass' => '管理员密码',
            'codes' => '登录验证码',
            'adminemail' => '管理员邮箱',
            'logintime' => '登录时间',
            'loginip' => '登录IP',
            'createtime' => '创建时间',
            'status' => '登录状态',
        ];
    }
}

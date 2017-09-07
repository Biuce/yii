<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin_login}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property string $account
 * @property string $nickname
 * @property string $login_ip
 * @property integer $login_time
 */
class AdminLogin extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_login}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid'], 'required'],
            [['uid', 'login_time'], 'integer'],
            [['account'], 'string', 'max' => 30],
            [['login_ip'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => 'Uid',
            'account' => 'Account',
            'login_ip' => 'Login Ip',
            'login_time' => 'Login Time',
        ];
    }
}

<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin_dolog}}".
 *
 * @property string $id
 * @property string $ip
 * @property integer $time
 * @property integer $uid
 * @property string $username
 * @property string $action
 * @property string $title
 * @property string $doing
 */
class AdminDolog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_dolog}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['time', 'uid'], 'integer'],
            [['uid'], 'required'],
            [['ip'], 'string', 'max' => 20],
            [['username', 'controller', 'action'], 'string', 'max' => 30],
            [['title'], 'string', 'max' => 80],
            [['doing'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ip' => 'Ip',
            'time' => 'Time',
            'uid' => 'Uid',
            'username' => 'Username',
            'controller' => 'Controller',
            'action' => 'Action',
            'title' => 'Title',
            'doing' => 'Doing',
        ];
    }
}

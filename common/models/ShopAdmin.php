<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin}}".
 *
 * @property string $adminid
 * @property string $adminuser
 * @property string $adminpass
 * @property string $adminemail
 * @property string $logintime
 * @property string $loginip
 * @property string $createtime
 */
class ShopAdmin extends \yii\db\ActiveRecord
{
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
            [['logintime', 'loginip', 'createtime'], 'integer'],
            [['adminuser'], 'string', 'max' => 32],
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
            'adminid' => 'Adminid',
            'adminuser' => 'Adminuser',
            'adminpass' => 'Adminpass',
            'adminemail' => 'Adminemail',
            'logintime' => 'Logintime',
            'loginip' => 'Loginip',
            'createtime' => 'Createtime',
        ];
    }
}

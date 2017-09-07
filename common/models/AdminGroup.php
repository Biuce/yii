<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin_group}}".
 *
 * @property integer $id
 * @property string $group_name
 * @property integer $create_time
 * @property integer $is_admin
 * @property string $create_user
 * @property string $power
 * @property integer $state
 * @property string $desc
 */
class AdminGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_group}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_time', 'is_admin', 'state'], 'integer'],
            [['power'], 'string'],
            [['group_name'], 'string', 'max' => 50],
            [['create_user'], 'string', 'max' => 30],
            [['desc'], 'string', 'max' => 255],
        ];
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '自增ID'),
            'group_name' => Yii::t('app', '权组名字'),
            'create_time' => Yii::t('app', '创建时间'),
            'is_admin' => Yii::t('app', '是否是超级管理员组，1为是，0为不是'),
            'create_user' => Yii::t('app', '创建人'),
            'power' => Yii::t('app', '权限'),
            'state' => Yii::t('app', '状态，1为可用，0为不可用'),
            'desc' => Yii::t('app', '描述'),
        ];
    }
    

    /**
     * [checkGroupName 建仓角色名称]
     * @return [type] [description]
     */
    public function checkGroupName()
    {
        if(empty($this->group_name)) 
        {
            $this->addError('group_name', '角色名称不能为空！');
            return false;
        }

        return true;
    }

    /**
     * ---------------------------------------
     * @获取所有等级名称
     * ---------------------------------------
     */
    public static function getList(){
        $nav = static::find()->select(['id','group_name'])->asArray()->all();
        $data = [];
        foreach ($nav as $key => $value) {
            $data[] = $value['id'];
            $res[] = $value['group_name'];
        }
        $arr = array_combine($data, $res);
        // $newArray =[''=>'全部'];
        foreach($arr as $k=>$v){
            $newArray[$k] = $v;
        }
        return $newArray;
    }
}

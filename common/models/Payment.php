<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%payment}}".
 *
 * @property integer $payment_id
 * @property string $payment_code
 * @property string $payment_name
 * @property string $payment_config
 * @property string $payment_state
 */
class Payment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%payment}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['payment_id', 'payment_code', 'payment_name'], 'required'],
            [['payment_id'], 'integer'],
            [['payment_config', 'payment_state'], 'string'],
            [['payment_code', 'payment_name'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'payment_id' => 'Payment ID',
            'payment_code' => 'Payment Code',
            'payment_name' => 'Payment Name',
            'payment_config' => 'Payment Config',
            'payment_state' => 'Payment State',
        ];
    }
}

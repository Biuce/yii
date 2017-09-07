<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%seo}}".
 *
 * @property string $id
 * @property string $title
 * @property string $keywords
 * @property string $description
 * @property string $type
 */
class Seo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%seo}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'keywords', 'description', 'type'], 'required'],
            [['description'], 'string'],
            [['title', 'keywords'], 'string', 'max' => 255],
            [['type'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'keywords' => 'Keywords',
            'description' => 'Description',
            'type' => 'Type',
        ];
    }
}

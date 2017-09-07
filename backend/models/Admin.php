<?php

namespace backend\models;

use Yii;
use yii\base\NotSupportedException;
use yii\web\IdentityInterface;
/**
 * 实现User组件中的身份识别类 参见 yii\web\user
 * This is the model class for table "{{%admin}}".
 *
 * @property string $uid
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $mobile
 * @property string $reg_time
 * @property string $reg_ip
 * @property string $last_login_time
 * @property string $last_login_ip
 * @property string $update_time
 * @property integer $status
 */
class Admin extends \common\models\Admin implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE  = 1;

    /**
     * [getGroup join db_admin_group]
     * @return [type] [description]
     */
    public function getGroup()
    {
        return $this->hasOne(AdminGroup::className(), ['id' => 'group_id']);
    }

    /**
     * [checkEmail 检查邮箱]
     * @return [type] [description]
     */
    public function checkEmail()
    {
        if(!empty($this->adminemail) && !\common\helpers\AdCommon::isEmail($this->adminemail))
        {
            $this->addError('adminemail', \yii::t('app', 'adminemailError'));
            return false;
        }
        else
        {
            return true;
        }
    }

    /**
    * @desc 验证用户名
    * @access  public
    * @param   void
    * @return  void
    */
    public function checkAccount()
    {
        if (!\common\helpers\AdCommon::isAlpha_numeric($this->adminuser))
        {
            $this->addError('adminuser','用户名格式有误！');
            return false;
        }

        if ($this->adminid)
        {
            $team = $this->find()->where("adminuser='".$this->adminuser."' and adminid!=".$this->adminid)->one();
        }
        else 
        {
            $team = $this->findOne(['adminuser' => $this->adminuser]);
        }
        
        if ($team['adminid'])
        {
            $this->addError('adminuser','用户名已存在！');
            return false;
        }
        
        return true;
    }
    
    
    /**
    * @desc 验证手机号格式
    * @access  public
    * @param   void
    * @return  boolen
    */
    public function checkPhone()
    {
        if(!\common\helpers\AdCommon::isMobile($this->mobile))
        {
            $this->addError('mobile', '手机号格式错误！');
            return false;
        }
         if ($this->adminid)
        {
            $team = $this->find()->where("mobile='".$this->mobile."' and adminid!=" . $this->adminid)->one();
        }
        else 
        {
            $team = $this->findOne(array('mobile' => $this->mobile));
        }
        
        if ($team['adminid'])
        {
            $this->addError('mobile','手机号已存在！');
            return false;
        }
        
        return true;
    }

    /**
     * [checkPassword 查询密码是否符合格式]
     * @param  [string] $password [密码]
     * @return [bool]            
     */
    public static function checkPassword($password)
    {
        if((empty($password)) && (strlen($password) < 6 || strlen($password) > 12))
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    /**
     * [encryPassword 密码加密]
     * @param  [string] $code [code码]
     * @param  [string] $pass [密码]
     * @return [string]       [加密结果]
     */
    public static function encryPassword($code, $pass)
    {
        return md5($code.$pass);
    }
    
    /**
     * 根据UID获取账号信息
     */
    public static function findIdentity($uid)
    {
        return static::findOne(['adminid' => $uid, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * 根据用户名获取账号信息
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['adminuser' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'adminpass' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return '';
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * 验证密码
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }

    /**
     * 设置加密后的密码
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->adminpass = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * 设置密码干扰码
     */
    // public function generateAuthKey()
    // {
    //     $this->salt = Yii::$app->security->generateRandomString();
    // }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->adminpass = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password = null;
    }
    
}

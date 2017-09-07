<?php
namespace backend\service;

use yii\base\Exception;
use common\models\Menu;

/**
 * 
 * @Copyright (C), 2014-04-03, Alisa.
 * @Name Menulibrary.php
 * @Author gqa
 * @Version  Beta 1.0
 *              
 **/
class MenuService
{
    /**
     * 魔术方法
     * @param type $name 名称
     * @param type $value 数据
     */
    public function _set($name, $value)
    {
        $this->$name = $value;
    }

    /**
     * [app 实例化本来]
     * @param  [array] $data [参数]
     * @return [type]       [对象]
     */
    public static function app($data = array())
    {
        $classNmae = __class__;
        $object    = new $classNmae();

        if(!is_array($data) || count($data) <= 0) return $object;

        foreach ($data as $key => $value) 
        {
            if (!isset($this->$key)) 
            {
                throw new Exception($this->$key."参数赋值异常", 403);
            }

            $this->$key = $value;
        }

        return $object;
    }

    /**
     * [getSelectMenu select菜单选项]
     * @param  integer $pid [父ID]
     * @return [type]       [description]
     */
    public function getSelectMenu($pid = 0)
    {
        $menu = $this->getMenu($pid);
        $select = array();
        
        if (count($menu) > 0) 
        {
            foreach ($menu as $key => $value) 
            {
                $select[$value['id']] = $value['str_repeat'] . $value['title'];
            }
        }
        
        return $select;
    }

    /**
    * @desc    查询菜单树
    * @access  public
    * @param   int $pid 栏目ID
    * @return  void
    */
    public function getMenu($pid = 0)
    {
        $where = array();
        if (!empty($pid)) $where['pid'] = $pid;
        
        $data = Menu::find()->orderBy('sort ASC')->where($where)->all();
        $menu = empty($data) ? array() : $this->getTreeArr(0, $data);
        
        return $menu;
    }


    /**
    * @desc    所有栏目分类
    * @access  public
    * @param   int $parentid default 0 父栏目ID
    * @param   array $array  所有栏目
    * @param   int $level    栏目等级
    * @param   string $repeat 替换符
    * @return  array
    */
    public function getTreeArr($parentid = 0, $array = array(), $level = 0, $repeat = '-') 
    {
    
        $str_repeat = '';
        
        if ($level) 
        {
            for($i = 0; $i < $level; $i ++) 
            {
                $str_repeat .= $repeat;
            }
        }
        
        $newarray  = array();
        $temparray = array();
        $arr = [];
        foreach ( ( array ) $array as $value ) 
        {
            $arr[] = $value->attributes;    
        }

        foreach ( ( array ) $arr as $v ) 
        {
            if ($v ['pid'] == $parentid) 
            {
                $v['level'] = $level;
                $v['str_repeat'] = $str_repeat;
                $newarray[] = $v;
                
                $temparray = self::getTreeArr( $v ['id'], $array, ($level + 2) );
                
                if ($temparray) 
                {
                    $newarray = array_merge ( $newarray, $temparray );
                }
            }
        }
        
        return $newarray;
    } 


    /**
     * [getShopMenu 禁止菜单列表]
     * @param  [type] $menu [description]
     * @return [type]       [description]
     */
    public function getBanMenu($menu = array())
    {
        if(empty($menu)) $menu = Menu::find()->orderBy('sort ASC')->all(); 
        $arr = array();
        foreach ($menu as $key => $value) 
        {
            if(!$value['isdefault']){
                $arr[$value['id']] = $value->getAttributes();
                $arr[$value['id']]['url'] = $value['url'] !== null ? $value['url'] : '';
            }
        }
        
        $userMenu = $this->generateTree($arr);

        return $userMenu;
    } 



    /**
     * [getUserMenu 用户权限]
     * @param  [type] $menu [description]
     * @return [type]       [description]
     */
    public function getUserMenu($menu = array())
    {
        if(empty($menu)) $menu = Menu::find()->where(['status' => 1])->orderBy('sort asc')->all(); 
        $arr = array();
        foreach ($menu as $key => $value) 
        {
            $arr[$value['id']] = $value->getAttributes();
            $arr[$value['id']]['url'] = $value['url'] !== null ? $value['url'] : '';
        }

        $userMenu = $this->generateTree($arr);

        return $userMenu;
    } 

    /**
     * [generateTree 分类树]
     * @param  [array] $items [description]
     * @return [type]        [description]
     */
    public function generateTree($items)
    {
        $tree = array();
        foreach($items as $item){
            if(isset($items[$item['pid']]))
            {
                $items[$item['pid']]['menu'][] = &$items[$item['id']];
            }
            else
            {
                $tree[] = &$items[$item['id']];
            }
        }
        return $tree;
    }


    /**
     * [getPower 查询用户权限]
     * @param  [type] $power [角色菜单ID]
     * @return [type]        [description]
     */
    public function getPower($power = '')
    {
        $where = !empty($power) ? 'where id in(' . $power . ') and status=1' : 'where status=1';
        $query = Menu::findBySql('select url from ' . Menu::tableName() . $where)->all();
        $url   = array();

        foreach ($query as $key => $value) 
        {
           array_unshift($url, $value['url']);
        }

        return $url;
    }

    /**
     * [setPower 角色权限]
     * @param [type] $power [description]
     */
    public function setPower($power)
    {
        $query = Menu::findBySql('select * from '.Menu::tableName().' where id in(' . $power . ') and status=1')->all();

        return $this->getUserMenu($query);
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/26 0026
 * Time: 9:42
 */

namespace app\index\controller;

use think\Db;
class Page extends Home
{
    public function _initialize()
    {
        parent::_initialize();
       //查询热门推荐
        $hot_recommand=Db::name('theme')->where(['is_index'=>1])->limit(5)->select();
        $this->assign('hot_recommand',$hot_recommand);
    }
    public function index($id)
    {
        $page_info=Db::name('cms_page')->find($id);
        $this->assign('page',$page_info);
        return $this->fetch();
    }

}
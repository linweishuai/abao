<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/22 0022
 * Time: 0:28
 */

namespace app\index\controller;

use think\Db;

class Theme extends Home
{
    public function detail($id)
    {
        $themeInfo=Db::name('theme')->find($id);
        $this->assign('themeInfo',$themeInfo);
        return $this->fetch();
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/24 0024
 * Time: 21:10
 */

namespace app\index\controller;

use think\Db;
class Photo extends Home
{

    public function index()
    {
        $photos = Db::name('photo')->order('w_time desc')->paginate(12);
        $this->assign('photos',$photos);
        return $this->fetch();
    }
}
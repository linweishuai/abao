<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/11
 * Time: 11:09
 */

namespace app\index\controller;

use think\Db;
class Vedio extends Home
{
    public function index()
    {
            $vedios= Db::table('xs_vedio_share')
                ->alias('xv')
                ->join('xs_user xu','xu.username=xv.username')
                ->field('xv.*,xu.nickname')
                ->where(['is_show'=>1,'xv.status'=>1])
                ->order('sort')
                ->paginate();
            $page = $vedios->render();
            $this->assign('page',$page);
            $this->assign('vedios',$vedios->all());
            return $this->fetch();
    }
    public function details($id=0)
    {
        // 获取现有礼物列表

        $gifts = Db::name('gift')->where('status',1)->order('id')->select();
        $this->assign('gifts',$gifts);
//        $this->assign('is_focus',0);
        $vedioInfo=Db::name('vedio_share')->find($id);
        if(!$vedioInfo){
            $this->error('未找到该视频信息');
        }
        $userInfo=Db::name('user')->where(['username'=>$vedioInfo['username']])->find();
        if(!$userInfo){
            $this->error('未找到该用户信息');
        }
        $this->assign('userInfo',$userInfo);

//        $livemodel=new LiveModel($username);
//        $zhuboInfo=Db::table('xs_zhubo zb')->join('xs_user xu','xu.username=zb.username')->where(['zb.username'=>$username])->field('xu.*,zb.id as zhuboid,zb.id,zb.title,zb.album,zb.intro')->find();
//        $is_focus=Db::name('guanzhu')->where(['userid'=>session('user_id'),'zhuboid'=>$zhuboInfo['zhuboid']])->find();
//        if($is_focus){
//            $this->assign('is_focus',1);
//        }
//        $zhubo_news=Db::name('cms_page')->where(['auth_username'=>session('user_name'),'status'=>1])->order('create_time desc')->limit(3)->select();
//        $this->assign('zhubo_news',$zhubo_news);
        //  视频推荐
        $recommedn_zhubos=Db::name('zhubo')->alias('zh')->join('xs_user xu','xu.username=zh.username')->field('zh.*,xu.nickname')->where(['zh.is_recommend'=>1,'zh.status'=>1])->select();
        $this->assign('recommedn_zhubos',$recommedn_zhubos);
        $this->assign('vedioInfo',$vedioInfo);
        return $this->fetch();
    }
}
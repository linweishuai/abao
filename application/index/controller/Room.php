<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/24
 * Time: 14:55
 */

namespace app\index\controller;

use app\common\controller\Common;
use think\Db;
use app\common\model\Live as LiveModel;
use GatewayWorker\Gateway;
class Room extends Home
{
         // 主播汇总页
        public function index($id='',$room_id='')
        {
            //查找一级分类用于左上角显示
            // 数据列表
//            $data_list = UserModel::where($map)->order('sort,id desc')->paginate();
//
//            // 分页数据
//            $page = $data_list->render();
            $keyword=$this->request->post('keyword');
            if($keyword!=''){
                $map['xu.nickname']=['like', "%".$keyword."%"];
            }
            if($room_id!=''&&is_numeric($room_id)){
                $map['pt.id']=$room_id;
            }
            $main_cats=Db::name('room_style')->where(['status'=>1,'pid'=>0])->select();
            $this->assign('main_cats',$main_cats);
            if($id!=''&&is_numeric($id)){
                $cats_arr=Db::name('room_style')->where(['status'=>1,'pid'=>$id])->column('id');
                if(empty($cats_arr)){
                    $this->error('该直播分类下无房间分类');
                }
                if(isset($map)){
                    $zhubos = Db::table('xs_zhubo')->alias('zb')
                        ->join('xs_room_style rs','rs.id=zb.cat_id')
                        ->join('xs_user xu','xu.username=zb.username')
                        ->join('xs_pingtai pt','pt.id=zb.room_id')
                        ->where(['zb.status'=>1,'zb.cat_id'=>['in',$cats_arr]])
                        ->where($map)
                        ->field('zb.*,rs.title as cat_name,xu.nickname')
                        ->order('focus_num desc,id')->paginate();
                }else{
                    $zhubos = Db::table('xs_zhubo')->alias('zb')
                        ->join('xs_room_style rs','rs.id=zb.cat_id')
                        ->join('xs_user xu','xu.username=zb.username')
                        ->join('xs_pingtai pt','pt.id=zb.room_id')
                        ->where(['zb.status'=>1,'zb.cat_id'=>['in',$cats_arr]])
//                    ->where($map)
                        ->field('zb.*,rs.title as cat_name,xu.nickname')
                        ->order('focus_num desc,id')->paginate();
                }

            }
            if($id==''){
                if(isset($map)){
                    $zhubos = Db::table('xs_zhubo')->alias('zb')
                        ->join('xs_room_style rs','rs.id=zb.cat_id')
                        ->join('xs_user xu','xu.username=zb.username')
                        ->join('xs_pingtai pt','pt.id=zb.room_id')
                        ->where(['zb.status'=>1])
                         ->where($map)
                        ->field('zb.*,rs.title as cat_name,xu.nickname')
                        ->order('focus_num desc,id')->paginate();
                }else{
                    $zhubos = Db::table('xs_zhubo')->alias('zb')
                        ->join('xs_room_style rs','rs.id=zb.cat_id')
                        ->join('xs_user xu','xu.username=zb.username')
                        ->join('xs_pingtai pt','pt.id=zb.room_id')
                        ->where(['zb.status'=>1])
//                    ->where($map)
                        ->field('zb.*,rs.title as cat_name,xu.nickname')
                        ->order('focus_num desc,id')->paginate();
                }
            }
            $page = $zhubos->render();
            $this->assign('page',$page);
            $this->assign('zhubos',$zhubos->all());
            return $this->fetch();
        }
        public function second($room_id='')
    {
        $main_cats=Db::name('room_style')->where(['status'=>1,'pid'=>0])->select();
        $this->assign('main_cats',$main_cats);
//        $fatherid=Db::name('room_style')->where(['id'=>$id])->value('pid');
        if($room_id!=''&&is_numeric($room_id)){
            $zhubos = Db::table('xs_zhubo')->alias('zb')
                ->join('xs_pingtai pt','pt.id=zb.room_id')
                ->join('xs_user xu','xu.username=zb.username')
                ->where(['zb.status'=>1,'zb.room_id'=>$room_id])
                ->field('zb.*,pt.name as cat_name,xu.nickname')
                ->order('focus_num desc,id')->paginate();
        }
        $this->assign('fatherid','');
        $page = $zhubos->render();
        $this->assign('page',$page);
        $this->assign('zhubos',$zhubos->all());
        return $this->fetch();
    }
        public function details($username)
        {
            // 获取现有礼物列表
            $gifts = Db::name('gift')->where('status',1)->order('id')->select();
            $this->assign('gifts',$gifts);
            $this->assign('is_focus',0);
            $livemodel=new LiveModel($username);
            $zhuboInfo=Db::table('xs_zhubo zb')
                ->join('xs_user xu','xu.username=zb.username')
                ->where(['zb.username'=>$username])
                ->field('xu.*,zb.id as zhuboid,zb.id,zb.title,zb.album,zb.intro,zb.focus_num,zb.coin_sum,zb.url,zb.images')
                ->find();
            $this->assign('albums',explode(',',$zhuboInfo['images']));
            $is_focus=Db::name('guanzhu')->where(['userid'=>session('user_id'),'zhuboid'=>$zhuboInfo['zhuboid']])->find();
            if($is_focus){
                $this->assign('is_focus',1);
            }
            $zhubo_news=Db::name('cms_page')->where(['auth_username'=>$username,'status'=>1])->order('create_time desc')->limit(4)->select();
            $this->assign('zhubo_news',$zhubo_news);
            // 最新的赠送
            $newgiftInfo=Db::name('gift_details')
                ->alias('gd')
                ->join('xs_user xu','xu.username=gd.sendusername')
                ->join('xs_gift xg','xg.id=gd.giftid')
                ->where(['gd.username'=>$username])
                ->field('xu.nickname,xg.giftIcon')
                ->limit(8)
                ->order('gd.add_time desc')
                ->select();
            $this->assign('newgiftInfo',$newgiftInfo);
            //赠送排行榜
            $paihangbang=Db::name('gift_details')
                ->alias('gd')
                ->join('xs_user xu','xu.username=gd.sendusername')
                ->field('sum(giftcoin) as coin,xu.nickname')
                ->where(['gd.username'=>$username])
                ->group('gd.sendusername')
                ->order('coin desc')
                ->limit(8)
                ->select();
            $this->assign('paihangbang',$paihangbang);

            //  直播推荐
            $recommedn_zhubos=Db::name('zhubo')->alias('zh')->join('xs_user xu','xu.username=zh.username')->field('zh.*,xu.nickname')->where(['zh.is_recommend'=>1,'zh.status'=>1])->select();
            $this->assign('recommedn_zhubos',$recommedn_zhubos);
            $this->assign('zhuboInfo',$zhuboInfo);
            $this->assign('playurl',$livemodel->getStreamPlayUrl());
            return $this->fetch();
        }

}
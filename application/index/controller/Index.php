<?php
// +----------------------------------------------------------------------
// | 海豚PHP框架 [ DolphinPHP ]
// +----------------------------------------------------------------------
// | 版权所有 2016~2017 河源市卓锐科技有限公司 [ http://www.zrthink.com ]
// +----------------------------------------------------------------------
// | 官方网站: http://dolphinphp.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\index\controller;

use think\Db;
/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Home
{
    public function index()
    {
        // 默认跳转模块
        // 查询后台设置的推荐主题
        $recommand_theme=Db::name('theme')->where(['is_index'=>1])->limit(7)->column('id,name');
        $this->assign('recommand_theme',$recommand_theme);
        $themes=Db::name('theme')->where(['is_index'=>1])->limit(7)->select();
        $this->assign('themes',$themes);
        $news=Db::name('cms_news')->where(['status'=>1,'is_index'=>1])->order('id desc')->limit(4)->select();
        $this->assign('news',$news);
       return $this->fetch();
    }
    public function live(){
        $live=new Live();
       echo $live->getStreamUrl();
       echo "</br>";
       echo $signkey=$live->signStreamKey();
        echo "</br>";
       echo  $tuiliu=$live->getStreamPlayUrl();
        echo "</br>";
    }
    //登录处理
    public function signin(){
       if($this->request->isPost()){
            $data=$this->request->post();
            $msg=$this->validate($data,'User.signin');
            if($msg!==true){
                $this->error($msg);
            }
           if (config('captcha_signin')) {
               $captcha = $this->request->post('captcha', '');
               $captcha == '' && $this->error('请输入验证码');
               if(!captcha_check($captcha, '', config('captcha'))){
                   //验证失败
                   $this->error('验证码错误或失效');
               };
           }
           $is_exists=Db::name('user')->where(['username'=>$data['username']])->whereOr(['mobile'=>$data['username']])->find();
            if($is_exists){
                if(!chkpass($data['password'],$is_exists['password'])){
                    $this->error('用户名或者密码不正确!');
                }else{
                    $res=model('User')->login($is_exists['id']);
                    if(!$res['status']){
                        $this->error($res['msg']);
                    }
                    $this->success('登陆成功',url('usercenter/Index/index'));
                }
            }else{
                //sso broker 类去闹市街获得用户信息
//                $SSO_SERVER = "http://naoshijie.xsyn.dsceshi.cn/index.php?s=/Home/Api/auth";
//                $SSO_BROKER_ID = "zhibo";
//                $SSO_BROKER_SECRET = "7pypoox2pc";
                //session 记录登录用户名和密码用户回调
                session('sso.username',$data['username']);
                session('sso.password',$data['password']);
//                $broker = new Broker($SSO_SERVER, $SSO_BROKER_ID, $SSO_BROKER_SECRET);
                $return_url=url('Index/dologin','','',true);
//                $return_url=$broker->attach($return_url);
                return json(['code'=>2,'url'=>$return_url]);
            }
       }else{
           session('sso.username',null);
           session('sso.password',null);
           $this->view->engine->layout(false);
           return $this->fetch();
       }

    }
    public function dologin()
    {
        $this->view->engine->layout(false);
        $usermodel = new User();
        $user =$usermodel ->sclogin(session('sso.username'), session('sso.password'));
            if ($user){
                Db::startTrans();
                //同步用户信息成功 执行直播会员注册;
               $usermodel = new User();
               $uid=$usermodel->syncShopUser($user);
               $res=$usermodel->login($uid);
               if(!$res['status']){
                   Db::rollback();
                   $this->error($res['msg']);
               }
               Db::commit();
               if($user['nickname']==''){
                   $this->success('登陆成功',url('usercenter/Index/profile'));
               }else{
                   $this->success('登陆成功',url('usercenter/Index/index'));
               }
            }else{
                $this->error('商城用户认证失败');
            }
        //若当前用户表中不存在该用户就去闹市街
    }
    public function sysnclogin()
    {
        if(request()->isPost())
        {
            $data=request()->post();
            $msg=$this->validate($data,'User.signin');
            if($msg!==true){
                $this->error($msg);
            }
            $is_exists=Db::name('user')->where(['username'=>$data['username']])->whereOr(['mobile'=>$data['username']])->find();
            if($is_exists){
                if($data['password']!=$is_exists['password']){
                    $this->error('用户名或者密码不正确!');
                }else{
                    $res=model('User')->login($is_exists['id']);
                    if(!$res['status']){
                        $this->error($res['msg']);
                    }
                    $this->success('登陆成功',url('usercenter/index/index'));
                }
            }else{
                $usermodel = new User();
                $user =$usermodel ->sclogin(request()->param('username'), request()->param('password'));
                if ($user){
                    Db::startTrans();
                    //同步用户信息成功 执行直播会员注册;
                    $usermodel = new User();
                    $uid=$usermodel->syncShopUser($user);
                    $res=$usermodel->login($uid);
                    if(!$res['status']){
                        Db::rollback();
                        $this->error($res['msg']);
                    }
                    Db::commit();
                    if($user['nickname']==''){
                        $this->success('登陆成功',url('usercenter/Index/profile'));
                    }else{
                        $this->success('登陆成功',url('usercenter/Index/index'));
                    }
                }else{
                    $this->error('商城用户认证失败');
                }
            }
        }else{
            $this->view->engine->layout(false);
            $this->assign('username',request()->param('username'));
            $this->assign('password',request()->param('password'));
            return $this->fetch();
        }

        //若当前用户表中不存在该用户就去闹市街
    }
    public function loginframework(){
        if($this->request->isPost()){
            $data=$this->request->post();
            $msg=$this->validate($data,'User.signin');
            if($msg!==true){
                $this->error($msg);
            }
            $is_exists=Db::name('user')->where(['username'=>$data['username']])->whereOr(['mobile'=>$data['username']])->find();
            if($is_exists){
                if(!chkpass($data['password'],$is_exists['password'])){
                    $this->error('用户名或者密码不正确!');
                }else{
                    $res=model('User')->login($is_exists['id']);
                    if(!$res['status']){
                        $this->error($res['msg']);
                    }
                    $this->success('登陆成功',url('usercenter/Index/index'));
                }
            }else{
//                //sso broker 类去闹市街获得用户信息
//                $SSO_SERVER = "http://naoshijie.xsyn.dsceshi.cn/index.php?s=/Home/Api/auth";
//                $SSO_BROKER_ID = "zhibo";
//                $SSO_BROKER_SECRET = "7pypoox2pc";
                //session 记录登录用户名和密码用户回调
                session('sso.username',$data['username']);
                session('sso.password',$data['password']);
//                $broker = new Broker($SSO_SERVER, $SSO_BROKER_ID, $SSO_BROKER_SECRET);
                    $return_url=url('Index/dologin','','',true);
//                $return_url=$broker->attach($return_url);
                return json(['code'=>2,'url'=>$return_url]);
            }

        }else{
            session('sso.username',null);
            session('sso.password',null);
            $this->view->engine->layout(false);
            return $this->fetch();
        }

    }
    // 关注 取消关注
    public function focus(){
        if($this->request->isPost()){
            $zhubousername=input('post.zhubousername');
            $zhuboid=Db::name('zhubo')->where(['username'=>$zhubousername])->value('id');
            if(!$zhuboid){
                $this->error('查询主播信息失败');
            }
            $is_exits=Db::name('guanzhu')->where(['userid'=>session('user_id'),'zhuboid'=>$zhuboid])->find();
            //查询到相关 说明已经关注过 那么 就是取消关注
            if($is_exits){
                if($is_exits['status']==1){
                    $re=Db::name('guanzhu')->delete($is_exits['id']);
                    if($re===false){
                        $this->error('取消关注失败');
                    }
                    $flag=Db::name('zhubo')->where(['username'=>$zhubousername])->setDec('focus_num');
                    msg_tip('cancel_follow',$zhubousername,'admin',['sendusername'=>session('user_name'),'date'=>date("Y-m-d H:i:s")]);
                    if($flag!==false){
                      return ['code'=>1,'msg'=>'取消关注！'];
                    }
                }
            }else{
                $add_data=[];
                $add_data['userid']=session('user_id');
                $add_data['zhuboid']=$zhuboid;
                $add_data['add_time']=time();
                $re=Db::name('guanzhu')->insert($add_data);
                if($re===false)
                {
                    $this->error('关注失败');
                }
                $flag=Db::name('zhubo')->where(['username'=>$zhubousername])->setInc('focus_num');
                msg_tip('follow',$zhubousername,'admin',['sendusername'=>session('user_name'),'date'=>date("Y-m-d H:i:s")]);
                if($flag!==false){
                    return ['code'=>2,'msg'=>'关注成功！'];
                }
            }
        }else{
            $this->error('参数错误');
        }
    }
    // 赠送礼物
    public function sendGift()
    {
        if($this->request->isPost()){
            $username=session('user_name');
            if($username=='') {
                return ['code'=>2,'msg'=>'登录已过期'];
            }
            $data=request()->post();
            if($data['zhubousername']==''||$data['giftid']=='')
            {
                $this->error('参数错误');
            }
            $is_exists=Db::name('zhubo')->where(['username'=>$data['zhubousername']])->find();
            if(!$is_exists){
                $this->error('主播信息不存在');
            }
            Db::startTrans();
            $giftModel=new Gift();
            $res = $giftModel->sendGiftByUser($username,$data['zhubousername'],$data['giftid']);
            if(!$res['status']){
                Db::rollback();
                return ['code'=>3,'msg'=>$res['msg']];
            }
            Db::commit();
            $this->success('赠送成功！');

        }else{
            $this->error('参数错误');
        }
    }
    public function sendGiftVedio()
    {
        if($this->request->isPost()){
            $username=session('user_name');
            if($username=='') {
                return ['code'=>2,'msg'=>'登录已过期'];
            }
            $data=request()->post();
            if($data['vedioid']==''||$data['giftid']=='')
            {
                $this->error('参数错误');
            }
            $is_exists=Db::name('vedio_share')->where(['id'=>$data['vedioid']])->find();
            if(!$is_exists){
                $this->error('视频信息不存在');
            }
            Db::startTrans();
            $giftModel=new Gift();
            $res = $giftModel->sendGiftByUserVedio($username,$is_exists['username'],$data['giftid'],$is_exists['id']);
            if(!$res['status']){
                Db::rollback();
                return ['code'=>3,'msg'=>$res['msg']];
            }
            Db::commit();
            $this->success('赠送成功！');

        }else{
            $this->error('参数错误');
        }
    }
            public function page()
            {
                return $this->fetch();
            }
            public function comment()
            {
                if(request()->isPost()){
                    $username=session('user_name');
                    if($username=='') {
                        return ['code'=>2,'msg'=>'登录已过期'];
                    }
                    $data=$this->request->post();
                   $newsInfo= Db::name('cms_page')->where(['id'=>$data['newsid']])->find();
                   if(!$newsInfo){
                       $this->error('参数错误');
                   }
                   if($newsInfo['auth_username']==session('user_name')){
                       $this->error('用户不可自评论');
                    }
                    $num=mb_strlen($data['comments']);
                    if($num>140) $this->error('评论字数超过限制');
                    $add_data=[];
                    $add_data['news_id']=$data['newsid'];
                    $add_data['username']=session('user_name');
                    $add_data['val']=$data['comments'];
                    $add_data['w_time']=time();
                    $rs=Db::name('pinglun')->insert($add_data);
                    if($rs!==false){
                        Db::name('cms_page')->where(['id'=>$data['newsid']])->setInc('talk');
                        $this->success(date("Y-m-d H:i:s"));
                    }
                }else{
                    $this->error('参数错误');
                }
            }
    public function usercomment()
    {
        if(request()->isPost()){
            $username=session('user_name');
            if($username=='') {
                return ['code'=>2,'msg'=>'登录已过期'];
            }
            $data=$this->request->post();
            $newsInfo= Db::name('news')->where(['id'=>$data['newsid']])->find();
            if(!$newsInfo){
                $this->error('参数错误');
            }
            if($newsInfo['username']==session('user_name')){
                $this->error('用户不可自评论');
            }
            $num=mb_strlen($data['comments']);
            if($num>140) $this->error('评论字数超过限制');
            $add_data=[];
            $add_data['news_id']=$data['newsid'];
            $add_data['username']=session('user_name');
            $add_data['val']=$data['comments'];
            $add_data['w_time']=time();
            $rs=Db::name('userpinglun')->insert($add_data);
            if($rs!==false){
                $this->success(date("Y-m-d H:i:s"));
            }
        }else{
            $this->error('参数错误');
        }
    }
        public function reward($newid,$num)
        {
            $username=session('user_name');
            $newinfo=Db::name('news')->find($newid);
            if(!$newinfo){
                if(!is_numeric($num)){
                    return ['code'=>0,'msg'=>'该新闻不存在'];
                }
            }
            if($username=='') {
                return ['code'=>2,'msg'=>'登录已过期'];
            }
            if(!is_numeric($num)){
                return ['code'=>0,'msg'=>'请输入正确的金额'];
            }
            Db::startTrans();
            $res=lockChangeAccountRemain(-$num,'money',12,'在记者新闻区赠送'.$num.'给'.$newinfo['username'],$username,'xs_news',$newid);
            if(!$res['status']){
                Db::rollback();
                $return=[];
                $return['code']=0;
                $return['msg']=$res['msg'];
                return $return;
            }
            $res=lockChangeAccountRemain($num,'money',13,'在记者新闻区收到'.$num.'赠送者:'.$username,$newinfo['username'],'xs_news',$newid);
            if(!$res['status']){
                Db::rollback();
                $return=[];
                $return['code']=0;
                $return['msg']=$res['msg'];
                return $return;
            }
            Db::commit();
            return ['code'=>1,'msg'=>'赠送成功！'];
        }
        public function bigshow()
        {
            $alladverts=Db::name('cms_advert')
                ->where(['typeid'=>['in','9,10,11,12']])
                ->field('typeid,link,src')
                ->order('create_time desc')
                ->select();
            $temp=[];
            foreach ($alladverts as $advert)
            {
                $temp[$advert['typeid']][]=$advert;
            }
            $this->assign('num',floor(count($temp[9])/2));
            $this->assign('adverts',$temp);
            return $this->fetch();
        }
        public function about()
        {
            $alladverts=Db::name('cms_advert')
                ->where(['typeid'=>['in','9,10,11,12']])
                ->field('typeid,link,src')
                ->order('create_time desc')
                ->select();
            $temp=[];
            foreach ($alladverts as $advert)
            {
                $temp[$advert['typeid']][]=$advert;
            }
            $this->assign('num',floor(count($temp[9])/2));
            $this->assign('adverts',$temp);
            return $this->fetch();
        }
}

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

use app\common\controller\Common;
use think\Url;
use think\Session;
use think\Db;
/**
 * 前台公共控制器
 * @package app\index\controller
 */
class Home extends Common
{
    /**
     * 初始化方法
     * @author 蔡伟明 <314013107@qq.com>
     */
    protected function _initialize()
    {
        // 系统开关
        if (!config('web_site_status')) {
            $this->error('站点已经关闭，请稍后访问~');
        }
        $this->assign('module_name',request()->controller());
        $this->assign('action_name',request()->action());
        //加入入口文件防止生成url不带index.php
        Url::root('/index.php');
        //开启session
        Session::init();
        $allmenu=cache('allmenu');
        if(!$allmenu)
        {
            $nav_arr=Db::name('cms_nav')->where(['status'=>1])->order('sort')->field('id,title,url')->select();
            $menu_arr=Db::name('cms_menu')->where(['status'=>1])->field('id,nid,title,url')->select();
            $allmenu=[];
            foreach ($nav_arr as $nav)
            {
                $temp=[];
                $temp['title']=$nav['title'];
                $temp['url']=$nav['url'];
                foreach ($menu_arr as $menu)
                {
                    $temp['child']=[];
                    if($menu['nid']==$nav['id'])
                    {
                        $secondtemp=[];
                        $secondtemp['title']=$menu['title'];
                        $secondtemp['url']=$menu['url'];
                        $temp['child'][]=$secondtemp;
                    }
                }
                $allmenu[]=$temp;
            }
            cache('allmenu',$allmenu);
        }

        $this->assign('allmenu',$allmenu);
        //底部友情链接
        $links=Db::name('cms_link')->where(['status'=>1])->order('sort')->limit(10)->select();
        $this->assign('links',$links);
        //底部侧边栏客服管理



    }
}

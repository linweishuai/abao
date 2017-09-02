<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/27
 * Time: 11:13
 */

namespace app\index\controller;


use think\Db;

class News extends Home
{
    public function index($news_cat_id='')
    {
        $new_cats=Db::name('cms_column')->where(['status'=>1,'hide'=>0])->order('sort')->select();
        $this->assign('new_cats',$new_cats);
        if($news_cat_id!=''&&is_numeric($news_cat_id))
        {
            $news=Db::name('cms_page')->where(['status'=>1,'cid'=>$news_cat_id])->order('create_time desc')->paginate();

        }else{
            $news=Db::name('cms_page')->where(['status'=>1,'cid'=>['neq',4]])->order('create_time desc')->paginate();
        }
        $page=$news->render();
        $news_items=$news->all();
        $this->assign('news_items',$news_items);
        $this->assign('page',$page);
        return $this->fetch();
    }
    public  function details($id='')
    {
        if($id==''||!is_numeric($id)) $this->error('未找到该新闻具体信息');
        $newsInfo=Db::name('cms_page')->find($id);
        $prev=Db::name('cms_page')
            ->where(['cid'=>$newsInfo['cid'],'create_time'=>['lt',$newsInfo['create_time']]])
            ->order('create_time desc')
            ->find();
        $next=Db::name('cms_page')
            ->where(['cid'=>$newsInfo['cid'],'create_time'=>['gt',$newsInfo['create_time']]])
            ->order('create_time')
            ->find();

        if($prev){
            $prelink= '<a href="'.url('details',["id"=>$prev['id']]).'">
                    <span>上一篇：</span>'.$prev['title'].'
                     </a>';
        }else{
            $prelink= '<a href="javascript:void(0)">
                    <span>上一篇：</span>没有了
                     </a>';
        }
        if($next){
            $nextlink= '<a href="'.url('details',["id"=>$next['id']]).'">
                    <span>下一篇：</span>'.$next['title'].'
                     </a>';
        }else{
            $nextlink= '<a href="javascript:void(0)">
                    <span>下一篇：</span>没有了
                     </a>';
        }
        Db::name('cms_page')->where(['id'=>$id])->setInc('view');
        $this->assign('prelink',$prelink);
        $this->assign('nextlink',$nextlink);
        $this->assign('newsInfo',$newsInfo);
        return $this->fetch();
    }
    public  function userdetails($id='')
    {
        if($id==''||!is_numeric($id)) $this->error('未找到该新闻具体信息');
        $newsInfo=Db::name('news')->find($id);
        Db::name('news')->where(['id'=>$id])->setInc('view');
        $data_list=DB::name('userpinglun')
            ->alias('p')
            ->join('xs_user xu','xu.username=p.username')
            ->where(['news_id'=>$newsInfo['id']])
            ->field('p.*,xu.nickname,xu.head_logo')
            ->order('p.w_time desc')
            ->paginate();
        $pinglun=$data_list->all();
        $page=$data_list->render();
        $this->assign('pinglun',$pinglun);
        $this->assign('page',$page);
        $this->assign('newsInfo',$newsInfo);
        return $this->fetch();
    }
}
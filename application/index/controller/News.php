<?php
namespace app\index\controller;
use think\Db;
class News extends Home
{
    public function index()
    {
        $news=Db::name('cms_news')->where(['status'=>1])->order('create_time desc')->paginate();
        $page=$news->render();
        $this->assign('news',$news);
        $this->assign('page',$page);
        return $this->fetch();
    }
    public  function details($id='')
    {
        if($id==''||!is_numeric($id)) $this->error('未找到该新闻具体信息');
        $newsInfo=Db::name('cms_news')->find($id);
        Db::name('cms_news')->where(['id'=>$id])->setInc('view');
        $this->assign('newsInfo',$newsInfo);
        return $this->fetch();
    }
}
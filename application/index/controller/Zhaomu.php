<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/12
 * Time: 11:35
 */

namespace app\index\controller;

use think\Db;
class Zhaomu extends Home
{
    public function index()
    {
        // 查询一级分类
        $allcate=Db::name('zhaomu_category')->where(['status'=>1])->select();
        $parent=[];
        $cate=[];
        foreach ($allcate as $item){
            if($item['parent_id']!=0)
            {
                $cate[$item['parent_id']][]=$item;
            }else{
                $parent[]=$item;
                $cate[$item['id']]=[];
            }
        }
        $this->assign('parent',$parent);
        $this->assign('cate',$cate);
        return $this->fetch();
    }
    public function publish()
    {
        // 查询一级分类
        $allcate=Db::name('zhaomu_category')->where(['status'=>1])->select();
        $parent=[];
        $cate=[];
        foreach ($allcate as $item){
            if($item['parent_id']!=0)
            {
                $cate[$item['parent_id']][]=$item;
            }else{
                $parent[]=$item;
                $cate[$item['id']]=[];
            }
        }
        $this->assign('parent',$parent);
        $this->assign('cate',$cate);
        return $this->fetch();
    }
    public function quest($cate_id=0)
    {
        if(request()->isPost()){
            $data=request()->post();
            $data['pushusername']=session('user_name');
            $data['add_time']=time();
            $zhaomuid=Db::name('zhaomu')->insertGetId($data);
            if(!$zhaomuid){
                $this->error('添加失败');
            }
            $this->success('添加成功',url('addmoney',['zhaomu'=>$zhaomuid]));
        }else{
            $cateInfo=Db::name('zhaomu_category')->find($cate_id);
            $this->assign('cate',$cateInfo);
            return $this->fetch();
        }
    }
    public function addmoney($zhaomu='')
    {
        $is_exist=Db::name('zhaomu')
            ->where(['pushusername'=>session('user_name'),'id'=>$zhaomu])
            ->find();
        if(!$is_exist){
            $this->error('参数错误');
        }
        if(request()->isPost()){
            $data=request()->post();
            if($data['money']>0.01)
            {
                $rs=Db::name('zhaomu')->where(['id'=>$zhaomu])->setField('yongjin',$data['money']);
                if(!$rs)
                {
                    $this->error('保存佣金信息失败');
                }
                $this->success('保存成功，请耐心等待审核',url('usercenter/zhaomu/push'));

            }else{
                $this->error('输入金额有误');
            }
        }else{
            $this->assign('zhaomu',$is_exist);
            return $this->fetch();
        }

    }
    public function apply($id)
    {
        $zhaomuinfo=Db::name('zhaomu')->find($id);
        if($zhaomuinfo['status']!=0){
            $this->error('该招募已被人认领');
        }
        $is_exists=Db::name('zhaomu_apply')->where(['zhaomu_id'=>$id,'apply_username'=>session('user_username')])->find();
        if($is_exists){
            if($is_exists['status']==0){
                $this->error('您已申请该招募，请耐心等待审核');
            }
            if($is_exists['status']==2){
                Db::name('zhaomu_apply')->where(['id'=>$is_exists['id']])->delete();
            }
        }
        if(request()->isPost())
        {
            $data=request()->post();
            $add_data=[];
            $add_data['zhaomu_id']=$id;
            $add_data['apply_username']=session('user_name');
            $add_data['apply_contact']=$data['apply_contact'];
            $add_data['apply_mobile']=$data['apply_mobile'];
            $add_data['apply_time']=time();
            $rs=Db::name('zhaomu_apply')->insertGetId($add_data);
            if(!$rs){
                $this->error('保存信息失败');
            }
            $this->success('申请成功，请耐心等待发布人审核',url('usercenter/zhaomu/apply'));

        }else{
            $cateinfo=Db::name('zhaomu_category')->where(['id'=>$zhaomuinfo['cate']])->find();
            $this->assign('cate',$cateinfo);
            $parentinfo=Db::name('zhaomu_category')->where(['id'=>$cateinfo['parent_id']])->find();
            $pre=Db::name('zhaomu')
                ->where(['cate'=>$zhaomuinfo['cate'],'admin_audit'=>1,'status'=>0,'add_time'=>['lt',$zhaomuinfo['add_time']]])
                ->order('add_time desc')
                ->find();
            if($pre){
                $this->assign('pre',$pre);
            }
            $next=Db::name('zhaomu')
                ->where(['cate'=>$zhaomuinfo['cate'],'admin_audit'=>1,'status'=>0,'add_time'=>['gt',$zhaomuinfo['add_time']]])
                ->order('add_time asc')
                ->find();
            if($next){
                $this->assign('next',$next);
            }
            $this->assign('parent',$parentinfo);
            $this->assign('zhaomu',$zhaomuinfo);
            return $this->fetch();
        }

    }
    public function cate($cate_id)
    {
        $first=Db::name('zhaomu')
            ->where(['cate'=>$cate_id,'admin_audit'=>1,'status'=>0])
            ->order('add_time desc')
            ->find();
        if(!$first)
        {
            $this->error('该分类下无可认领的招募令');
        }
        $this->redirect(url('apply',['id'=>$first['id']]));

    }
    public function lists($cate_id=0)
    {
        if(request()->isPost()){
            $data=request()->post();
            $zhaomu=Db::name('zhaomu')->where(['status'=>0,'admin_audit'=>1,'key'=>['like','%'.$data['keyword'].'%']])->order('add_time desc')->paginate();
        }else{
            $zhaomu=Db::name('zhaomu')->where(['status'=>0,'admin_audit'=>1,'cate'=>$cate_id])->order('add_time desc')->paginate();
        }

        $page=$zhaomu->render();
        $zhaomu=$zhaomu->all();
        $this->assign('zhaomu',$zhaomu);
        $this->assign('page',$page);
        return $this->fetch();
    }
}
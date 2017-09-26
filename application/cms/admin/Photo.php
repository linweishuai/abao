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

namespace app\cms\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use think\Db;
/**
 * 单页控制器
 * @package app\cms\admin
 */
class Photo extends Admin
{
    /**
     * 单页列表
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function index()
    {
        // 查询
        $map = $this->getMap();
        // 排序
        $order = $this->getOrder();
        // 数据列表
        $data_list = Db::name('photo')->where($map)->order($order)->paginate();

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setSearch(['title' => '标题']) // 设置搜索框
            ->setTableName('photo')
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['name', '标题', 'text.edit'],
                ['is_index', '是否首页显示', 'switch'],
                ['description', '客片描述', 'text.edit'],
                ['src', '照片', 'picture'],
                ['w_time', '创建时间', 'datetime'],
                ['status', '状态', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('add') // 批量添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => '删除后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,title,create_time,update_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Page', 'title')
            ->fetch(); // 渲染模板
    }

    /**
     * 新增
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function add()
    {
        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();
            $data['w_time']=time();
            // 验
            $page = Db::name('photo')->insertGetId($data);
            if ($page) {
                // 记录行为
                $this->success('新增成功', 'index');
            } else {
                $this->error('新增失败');
            }
        }
        // 显示添加页面
//        $theme=['purple'=>'基佬紫'
//            ,'light-blue'=>'亮蓝色'
//            ,'green'=>'原谅色'
//            ,'yellow'=>'黄'
//            ,'deep-blue'=>'深蓝色'
//            ,'brown'=>'棕色',
//            'red'=>'红色'];
        return ZBuilder::make('form')
            ->addFormItems([
                ['text', 'name', '客片标题'],
//                ['select','theme','主题颜色','',$theme,'purple'],
                ['textarea', 'description', '客片描述', '100字左右'],
                ['jcrop', 'src', '单页封面'],
//                ['images', 'album', '主题 内容图片'],
                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
            ])
            ->fetch();
    }

    /**
     * 新增
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function edit($id=null)
    {
        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();
            $data['w_time']=time();
            // 验
            $page = Db::name('theme')->update($data);
            if ($page) {
                // 记录行为
                $this->success('新增成功', 'index');
            } else {
                $this->error('新增失败');
            }
        }
        // 显示添加页面
//        $theme=['purple'=>'基佬紫'
//            ,'light-blue'=>'亮蓝色'
//            ,'green'=>'原谅色'
//            ,'yellow'=>'黄'
//            ,'deep-blue'=>'深蓝色'
//            ,'brown'=>'棕色',
//            'red'=>'红色'];
        $formData=Db::name('theme')->find($id);
        return ZBuilder::make('form')
            ->addFormItems([
                ['text', 'name', '客片标题'],
//                ['select','theme','主题颜色','',$theme,'purple'],
                ['textarea', 'description', '客片描述', '100字左右'],
                ['jcrop', 'src', '单页封面'],
//                ['images', 'album', '主题 内容图片'],
                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
            ])
            ->setFormData($formData)
            ->fetch();
    }

    /**
     * 删除单页
     * @param array $record 行为日志
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function delete($record = [])
    {
        return $this->setStatus('delete');
    }

    /**
     * 启用单页
     * @param array $record 行为日志
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用单页
     * @param array $record 行为日志
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }


}
<?php
namespace app\common\taglib;

use think\template\TagLib;

class Shtml extends Taglib
{
    /**
     * 定义标签列表
     */
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'editor' => ['attr'=>'id,name,style,width,height,type,typeJs,linkUrl,image_array,UploadUrl','close'=>0],
        'open'   => ['attr' => 'name,type', 'close' => 1], 
    ];
    
    /**
     * editor标签解析 插入可视化编辑器
     * 格式：<shtml:editor id="shophome_images" name="shophome_images[]" type="KINDEDITOR_FILE" type_js = '1'; link_url = '' image_array=''>
     * 注意：如果配置文件未添加扩展标签库  'taglib_pre_load' => 'app\common\taglib\Shtml' 
     *     需在使用页面添加  <taglib name="app\common\taglib\Shtml"/>
     */
    public function tagEditor($tag,$content)
    {
        $id      = !empty($tag['id']) ? $tag['id'] : '_editor';
        $name    = $tag['name'];
        $style   = !empty($tag['style'])  ? $tag['style']  : '';
        $width   = !empty($tag['width'])  ? $tag['width']  : '100%';
        $height  = !empty($tag['height']) ? $tag['height'] :'320px';
        $type    = !empty($tag['type']) ? $tag['type'] : '';
        $typeJs = !empty($tag['typeJs']) ? $tag['typeJs'] : '';     // 是否加载js文件
        $linkUrl = !empty($tag['linkUrl']) ? $tag['linkUrl'] : '';  // 是否开启插入图片链接
        $UploadUrl = !empty($tag['UploadUrl']) ? $tag['UploadUrl'] : '/api/v1/user/file/upload/type/common';  // 上传地址
        switch(strtoupper($type)) {
            case 'KINDEDITOR_FILE':
                //判断是否有列表数组传过来
                $table_list='';
                if($tag['image_array']!=''){
                    $table_list .= '<?php
                        if(!empty( '. $tag["image_array"] . ')){
                            $table_array="";
                            foreach(' .$tag["image_array"] .' as $km=>$mn){
                                $table_array.=\'<li\';
                                if($km==0){
                                    $table_array.=\' class="curr"\';
                                }
                                $table_array.=\' id="'.$id.'" ><input type="hidden"  name="'.$name.'" value="\'.$mn.\'"><img src="\'.$mn.\'" height="100px" />\';
                                if($km==0){
                                    $table_array.=\'<div class="File_home"></div>\';
                                }else{
                                    $table_array.=\'<div class="File_home hide"></div>\';
                                }
                                $table_array.=\'<div class="File_operate"><i class="topleft" title="图片左移" onclick="moveUp(this)">左移</i><i class="home" title="设为主图" onclick="moveHome(this);">主图</i><i class="del" title="删除图片" onclick="moveDel(this);">删除</i><i class="topright" title="图片右移" onclick="moveDown(this)">右移</i></div></li>\';
                            }
                            echo $table_array;
                        }
                    ?>';
                }
                $parseStr = '';
                // 多次使用这个标签，只需要加载一次 js
                if($typeJs == '1'){
                    $parseStr = '<link rel="stylesheet" href="__STATIC__/common/plug/kindeditor/themes/default/default.css"/>
                                 <link rel="stylesheet" href="__STATIC__/common/plug/kindeditor/ajaxfileupload.css"/>
                                 <script type="text/javascript" src="__STATIC__/common/plug/kindeditor/kindeditor.js"></script>
                                 <script type="text/javascript" src="__STATIC__/common/plug/kindeditor/lang/zh_CN.js"></script>
                                 <script type="text/javascript" src="__STATIC__/common/plug/kindeditor/kindeditor_button.js"></script>';
                }
                $parseStr .= '<script> 
                                 KindEditor.ready(function(K) { 
                                 var editor = K.editor({allowFileManager : true});
                                 editor.UrlData = "formname=imgFile";
                                 editor.uploadJson = "'. $UploadUrl .'";
                                 K("#J_'.$id.'Image").click(function() { 
                                     editor.loadPlugin("multiimage", function() {
                                         editor.plugin.multiImageDialog({
                                             clickFn : function(urlList) {  
                                                 var div = K("#J_'.$id.'Image"); 
                                                 K.each(urlList, function(i, data) {
                                                     var File_html=""; 
                                                     File_html +="<li";
                                                     if ( i == 0 ) {
                                                         File_html+=\' class="curr"\';
                                                     } 
                                                     File_html +=\' id="'.$id.'"><input type="hidden"  name="'.$name.'" value="\' + data.url + \'"><img src="\' + data.url + \'">\';
                                                     if ( i == 0 ) { 
                                                         File_html+=\'<div class="File_home" style="display:block"></div>\';
                                                     } else { 
                                                         File_html+=\'<div class="File_home" style="display:none"></div>\';
                                                     }
                                                     File_html+=\'<div class="File_operate">\
                                                                     <i class="topleft" title="图片左移" onclick="moveUp(this)">左移</i>\
                                                                     <i class="home" title="设为主图" onclick="moveHome(this);">主图</i>\
                                                                     <i class="del" title="删除图片" onclick="moveDel(this);">删除</i>\
                                                                     <i class="topright" title="图片右移" onclick="moveDown(this)">右移</i>\
                                                                 </div>\';';
                                                // 是否需要添加链接
                                                if($linkUrl != ''){
                                                    $parseStr .= '
                                                    File_html+=\'<div class="an-buttom">\
                                                                      <input type="button" name="qd" value="设置链接">\
                                                                  </div>\
                                                                  <div class="text-bottom">\
                                                                      <input type="text" name="' . $linkUrl .'" class="bottom-left" placeholder="链接到 http://" >\
                                                                      <input type="button" name="wenben" value="确定" class="mt5 btn-jn btn-jn-blue wh-100 fl wenben">\
                                                                  </div>\';';
                                                }
                                                    $parseStr .= '
                                                    File_html+=\'</li>\';
                                                    div.before(File_html);
                                                  });
                                                  editor.hideDialog();  
                                             } 
                                         }); 
                                     });
                                   });
                                });
                            </script>
                            <div class="File_list" id="J_'.$id.'View">'.$table_list.'<input class="" type="button" id="J_'.$id.'Image" value=" " style="height:100px;"></div>
                            <script>
                             $(function() {
                                 //上传按钮样式修改
                                 $("#J_'. $id . 'Image").addClass("mt5 btn-jn btn-jn-blue wh-100 fl")
                                 .css({
                                     "height":"25px",
                                     "line-height": "24px",
                                     "margin":"8px 0",
                                     "cursor":"pointer"
                                 }).val("选择图片");
                                 //选项卡
                                 $(".an-buttom").live("click", function(){
                                     $(this).next(".text-bottom").show();
                                     $(this).parents("li").siblings().find(".text-bottom").hide();
                                 });
                                 $(".wenben").live("click", function(){
                                    $(this).parents(".text-bottom").hide();
                                 });
                             })
                            </script>';
                break;
            default :
                $parseStr  =  '<textarea id="'.$id.'" style="'.$style.'" name="'.$name.'" >'.$content.'</textarea>';
        }
        return $parseStr;
    }
    
     /**
      * 测试标签样列：
      * <shtml:open name='demo_name' type='1'>
      *    {$key}=>{$demo_name}<br>
      * </shtml:open>
      * 这是一个非闭合标签的简单演示
      */
    public function tagOpen($tag, $content)
    {
        $type = empty($tag['type']) ? 0 : 1; // 这个type目的是为了区分类型，一般来源是数据库
        $name = $tag['name']; // name是必填项，这里不做判断了
        $parse = '<?php ';
        $parse .= '$test_arr=[[1,3,5,7,9],[2,4,6,8,10]];'; // 这里是模拟数据
        $parse .= '$__LIST__ = $test_arr[' . $type . '];';
        $parse .= ' ?>';
        $parse .= '<volist name="__LIST__" id="' . $name . '">';
        $parse .= $content;
        $parse .= '</volist>';
        return $parse;
    }
}
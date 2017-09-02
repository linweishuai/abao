<?php
namespace app\common\taglib;

use think\template\TagLib;

/**
 * 广告查询标签定义
 * 自定义标签名定义TagLib+自定义标签名
 * Ad => 广告
 * @param   （id 广告位id limit 广告数量 where 查询条件 cateid 广告位置 result） 变量名
 * @example <Advert:getAdvertList id="116" limit="5">
 *                  <a title="{$ad.title}" href="{$ad.url}">
 *                  <img alt="{$ad.title}" src="{$ad.image}">
 *                  </a>
 *                  </Advert:getAdvertList>
 */
class Advert extends Taglib
{
    // 标签定义
    protected $tags = array(
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'list' => array('attr' => 'name,field,limit,order,where,cateid,sql,key,mod,result', 'level' => 3),
    );

    //定义查询数据库标签
    public function taglist($tag, $content)
    {
        //$tag = $this->parseXmlAttr($attr, 'advert');
        $key = !empty($tag['key']) ? $tag['key'] : 'i';
        $mod = isset($tag['mod']) ? $tag['mod'] : '2';
        $result = !empty($tag['result']) ? $tag['result'] : 'advert'; //定义数据查询的结果存放变量
        //更接近where条件进行筛选
        $sql_cate = '';
        if($tag['cateid']) {
            $sql_cate = '$map_cate["id"]  = '."{$tag['cateid']};";
        }
        $sql_cate .= '$map_cate["status"]  = 1;';
        //$sql_cate .= '$map_cate["type"]= "shop";';
        $sql_cate .= '$advert_cate = db("cms_advert_type")->';
        if($tag['cateid']) {
            $sql_cate .= 'where($map_cate)->';
        }

        //限制广告位的数量
        $sql_cate .= "find(); ";
        //根据用户输入的值拼接查询广告条件
        $sql_ads_map = '$map_ads=array();';
        $sql_ads_map .= '$map_ads["typeid"]=$advert_cate["id"];';
        if(!empty($tag['where'])) {
            $sql_ads_map .= '$map_ads["_string"]='.$tag['where'].'; ';
        }
        $sql_ads = "db('cms_advert')->";
        $sql_ads .= 'order("id ASC")->';
        $sql_ads .= 'where($map_ads)->';
        //限制广告位的数量
        $sql_ads .= !empty($tag['limit']) ? "limit({$tag['limit']})->" : '';
        $sql_ads .= "select()";

        //进行列出数据
        $parsestr = '<?php ';
        $parsestr .= $sql_cate;
        $parsestr .= $sql_ads_map;
        $parsestr .= 'if($advert_cate):';
        $parsestr .= '$_result='.$sql_ads.';  $'.$key.'=0;';
        $parsestr .= 'foreach($_result as $key=>$'.$result.'):';
        $parsestr .= '++$'.$key.'; $mod = ($'.$key.' % '.$mod.' ); ?>';
        $parsestr .= $content;    //解析在advert标签中的内容
        $parsestr .= '<?php endforeach;';
        $parsestr .= 'endif;';
        $parsestr .= '?>';

        return $parsestr;
    }
}

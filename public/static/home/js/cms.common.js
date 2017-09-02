$(function(){
		layer.config({extend: 'extend/layer.ext.js'});			
		/*异步加载列表数据*/
		$("[data-ajax]").on("click",function(){
			var cid = $(this).attr("data-ajax"),pid=1,total = 1,tips=$(this).attr("data-tips");
			if(typeof $(this).attr("data-pid")!=='undefined'){pid = parseInt($(this).attr("data-pid"));}
			if(typeof $("[data-list]").attr("data-list")!=='undefined'){total = parseInt($("[data-list]").attr("data-list"));}
			if(typeof tips==='undefined'){tips = "没有更多了…";}
			if(pid<total){
				$(this).attr("data-pid",++pid);
				$.get("index.php?ajax-list-"+cid+"-"+pid+".html",function(data){$("[data-list]").append(data);});
			}else{
				layer.msg(tips, {icon: 6});
				$(this).hide();
			}
		});
});
String.prototype.len=function(){return this.replace(/[^\x00-\xff]/g,"aa").length;} 
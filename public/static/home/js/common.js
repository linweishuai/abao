// JavaScript Document
$(document).ready(function(){

$("a").focus(function(){$(this).blur();});

$(".nav li:not(.hover)").hover(function(){
 $(this).find("dl").stop().animate({"height":$(this).find("dd").height()+48},500);
 $(this).find("ins").stop().animate({"width":"88px","left":"41px"},300);
 $(this).find("a.menu").addClass("hover");
},function(){
 $(this).find("dl").stop().animate({"height":"0"},500);
 $(this).find("ins").stop().animate({"width":"0","left":"50%"},300);
 $(this).find("a.menu").removeClass("hover");
})


$(".hotWorks li a").hover(function () {
	$(this).find("span.w_01").stop().animate({bottom:-200},500);
	$(this).find("span.w_02").fadeIn();
	$(this).find("span.w_03").stop().animate({top:10},500);
}, function () {
	$(this).find("span.w_01").stop().animate({bottom:0}, 500);
	$(this).find("span.w_02").fadeOut();
	$(this).find("span.w_03").stop().animate({top:-540},500);
});


$(".reviews li").hover(function () {
	$(this).find("dl").fadeIn();
}, function () {
	$(this).find("dl").fadeOut();
});

$(".works_tj li a").hover(function(){
  $(this).find("span").stop().animate({left:0},500);
  $(this).find("ins").stop().animate({top:0},500,"easeInOutBack");
},function(){
  $(this).find("span").stop().animate({left:-230},500);
 $(this).find("ins").stop().animate({top:-400},800,"easeOutBack");
})

$(".worksPhotos li a").hover(function(){
  $(this).find("span").stop().animate({top:0},400,"easeInSine");
  $(this).find("em").stop().animate({bottom:28},500,"easeInOutBack");
},function(){
  $(this).find("span").stop().animate({top:-470},400,"easeInSine");
 $(this).find("em").stop().animate({bottom:-80},500,"easeOutBack");
})

$(".copyright dd span").hover(function () {
	$(this).find("i").fadeIn();
}, function () {
	$(this).find("i").fadeOut();
});


//$(".guest li").eq(0).addClass("g_1");
//$(".guest li").eq(3).addClass("g_4");


// 最新客照 造型大赏 弹窗
  $(".float .imgbox,.float a.close").click(function () {
			$(".float").fadeOut(300, function () {$("html").removeClass("hover"); });
        });

   function set_ppt()
        {
            $(".worksPhotos li a,.kepian li a").click(function () {
                $(".float").fadeIn(300);
                $("html").addClass("hover");
                var i = $(".worksPhotos li a,.kepian li a").index(this);
                factory(i, $(".worksPhotos li a,.kepian li a"));
            });
        }
   set_ppt();
       

	$(".float a.next").click(function () {
		var i = $(".float .imgbox img,.float .imgbox01 img").attr("id");
		var n = $(".worksPhotos li a,.kepian li a").size();
		if (i == n - 1) { i = 0; factory(i, $(".worksPhotos li a,.kepian li a")); } else { i++; factory(i, $(".worksPhotos li a,.kepian li a")); }
	});

	$(".float a.prev").click(function () {
		var i = $(".float .imgbox img,.float .imgbox01 img").attr("id");
		var n = $(".worksPhotos li a,.kepian li a").size();
		if (i == 0) { i = n - 1; factory(i, $(".worksPhotos li a,.kepian li a")); } else { i--; factory(i, $(".worksPhotos li a,.kepian li a")); }
	});
	
	function factory(i, obj) {
		var imgsrc = obj.eq(i).attr("rel");
		var newid = "id='" + i + "'";
		var imgTitle = obj.eq(i).attr("tip");
		var newtip = obj.eq(i).attr("tip");
		var imgData = obj.eq(i).attr("dataDetail");
		var text = obj.eq(i).attr("dataText");
		
		$(".float .imgbox").html("<img src='" + imgsrc + "'" + newid + " /><h1>"+imgTitle+"</h1><p>"+imgData+"</p><span>"+text+"</span>");
		$(".float .imgbox01").html("<img src='" + imgsrc + "'" + newid + " />");
	}
	
    $(function() {
        $(window).resize(function() { goTop(); });
        $(window).scroll(function() { goTop(); });
    });
    function goTop() {

        $(".piaofu").stop().animate({ "top": ($(window).height() + $(window).scrollTop() - ($(window).height() + $(".piaofu").height()) / 2) < 850 ? 850 :
 $(window).height() + $(window).scrollTop() - ($(window).height() + $(".piaofu").height()) / 2
        }, 600);

    }

$(".contact .bd li dd").hover(function () {
	$(this).find("cite").stop().animate({height:83},300);
}, function () {
	$(this).find("cite").stop().animate({height:0},300);
});			   
	   
$(".happiness li a").click(function(){
   $(".float01").css({"visibility":"visible"});
    $("html").addClass("hover");
   
})

$(".float01 a.close").click(function(){
   $(".float01").css({"visibility":"hidden"});
    $("html").removeClass("hover");
})


	   
	   
	   
	   
})









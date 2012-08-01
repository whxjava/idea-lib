<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>知识库</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function() {
            var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
            var len = $("#focus ul li").length; //获取焦点图个数
            var index = 0;
            var picTimer;
            //以下代码添加数字按钮和按钮后的半透明长条
            var btn = "<div class='btnBg'></div><div class='btn'>";
            for(var i=0; i < len; i++) {
                btn += "<span>" + (i+1) + "</span>";
            }
            btn += "</div>"
            $("#focus").append(btn);
            $("#focus .btnBg").css("opacity",0.5);

            //为数字按钮添加鼠标滑入事件，以显示相应的内容
            $("#focus .btn span").mouseenter(function() {
                index = $("#focus .btn span").index(this);
                showPics(index);
            }).eq(0).trigger("mouseenter");

            //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
            $("#focus ul").css("width",sWidth * (len + 1));

            //鼠标滑入某li中的某div里，调整其同辈div元素的透明度，由于li的背景为黑色，所以会有变暗的效果
            $("#focus ul li div").hover(function() {
                $(this).siblings().css("opacity",0.7);
            },function() {
                $("#focus ul li div").css("opacity",1);
            });

            //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
            $("#focus").hover(function() {
                clearInterval(picTimer);
            },function() {
                picTimer = setInterval(function() {
                    if(index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic()，然后将索引值清零
                        showFirPic();
                        index = 0;
                    } else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics()
                        showPics(index);
                    }
                    index++;
                },3000); //此3000代表自动播放的间隔，单位：毫秒
            }).trigger("mouseleave");

            //显示图片函数，根据接收的index值显示相应的内容
            function showPics(index) { //普通切换
                var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
                $("#focus ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
                $("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
            }

            function showFirPic() { //最后一张图自动切换到第一张图时专用
                $("#focus ul").append($("#focus ul li:first").clone());
                var nowLeft = -len*sWidth; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
                $("#focus ul").stop(true,false).animate({"left":nowLeft},500,function() {
                    //通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
                    $("#focus ul").css("left","0");
                    $("#focus ul li:last").remove();
                });
                $("#focus .btn span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
            }
        });
    </script>
    <script type="text/javascript">
        $(function(){
            <!--JavaSE 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":2},function(data){
                var str = " <ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot2.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"' >"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot2.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#JavaSE").html(str);
            });
            <!--JavaSE 结束-->
            <!--JavaEE 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":3},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot2.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"'>"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot2.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#JavaEE").html(str);
            });
            <!--JavaEE 结束-->
            <!--Struts2 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":4},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot2.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"' >"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot2.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#Struts2").html(str);
            });
            <!--Struts2 结束-->
            <!--Hibernate 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":5},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot2.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"' >"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot2.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#Hibernate").html(str);
            });
            <!--Hibernate 结束-->
            <!--Spring 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":6},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot2.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"' >"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot2.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#Spring").html(str);
            });
            <!--Spring 结束-->
            <!--JavaScript 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":7},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot1.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"' >"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot1.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#JavaScript").html(str);
            });
            <!--JavaScript 结束-->
            <!--JQuery 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":8},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot1.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"'>"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot1.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#JQuery").html(str);
            });
            <!--JQuery 结束-->
            <!--Android 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":9},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot1.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"'>"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot1.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#Android").html(str);
            });
            <!--Android 结束-->
            <!--Html+CSS 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":10},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot1.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"'>"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot1.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#HtmlCSS").html(str);
            });
            <!--Html+CSS 结束-->
            <!--编程人生 开始 -->
            $.getJSON("msgMenuFindByMenuId.action",{"menuId":11},function(data){
                var str = "<ul>";
                if(data != null && data.length > 0){
                    for(var i = 0 ; i < data.length ;i++){
                        str +="<li><span><img src='images/dot1.gif' ></span><a target='_blank'  href='message?Id="+data[i][0]+"'>"+data[i][1]+"</a></li>";
                    }
                }else{
                    str +="<li><span><img src='images/dot1.gif' ></span>暂无内容</li>";
                }
                str +="</ul>";
                $("#ExperiencesOfProgrammers").html(str);
            });
            <!--编程人生 结束-->
        });
    </script>
</head>
<body>
<!--头部开始-->
<%@include file="head.jsp"%>
<!-- 中间部分开始-->
<div class="main">
    <div class="main_left">
        <div class="main_left_content1">
            <div id="focus">
                <ul>
                    <li><div><a href="" target="_blank"><img src="images/a01.jpg"  /></a></div></li>
                    <li><div><a href="" target="_blank"><img src="images/b01.jpg"  /></a></div></li>
                    <li><div><a href="" target="_blank"><img src="images/c01.jpg"  /></a></div></li>
                    <li><div><a href="" target="_blank"><img src="images/d01.jpg"  /></a></div></li>
                </ul>
            </div>
        </div>
        <span class="title1"><a href="list?Id=2" target="_bank">JavaSE</a></span>
        <div class="main_left_content" id="JavaSE"></div>
        <span class="title1"><a href="list?Id=3" target="_bank">JavaEE</a></span>
        <div class="main_left_content" id="JavaEE"></div>
        <span class="title1"><a href="list?Id=4" target="_bank">Struts2</a></span>
        <div class="main_left_content" id="Struts2"></div>
        <span class="title1"><a href="list?Id=5" target="_bank">Hibernate</a></span>
        <div class="main_left_content" id="Hibernate"></div>
        <span class="title1"><a href="list?Id=6" target="_bank">Spring</a></span>
        <div class="main_left_content" id="Spring"> </div>
    </div>
    <div class="main_midd">
        <div class="main_midd_content">
            <ul>
                <h3><a href="#">淘宝技术发展（Java时代：坚若磐石）</a></h3>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>
                <li><span><a href="#">Java基础Java基础Java基础</a></span><span><a href="#">Java基础Java基础Java基础</a></span></li>

            </ul>
        </div>
        <span class="title"><a href="list?Id=7" target="_bank">JavaScript</a></span>
        <div class="main_midd_content1" id="JavaScript"></div>
        <span class="title"><a href="list?Id=8" target="_bank">JQuery</a></span>
        <div class="main_midd_content1" id="JQuery"></div>
        <span class="title"><a href="list?Id=9" target="_bank">Android</a></span>
        <div class="main_midd_content1" id="Android"></div>
        <span class="title"><a href="list?Id=10" target="_bank">Html+CSS</a></span>
        <div class="main_midd_content1" id="HtmlCSS"></div>
        <span class="title"><a href="list?Id=11" target="_bank">编程人生</a></span>
        <div class="main_midd_content1" id="ExperiencesOfProgrammers"></div>
    </div>
    <div class="main_right">
        <span>热点专题汇总</span>
        <ul>
            <li><img src="images/html5.gif" /></li>
            <li><img src="images/jquery-logo.gif" /></li>
            <li><img src="images/html5.gif" /></li>
            <li><img src="images/jquery-logo.gif" /></li>
            <li><img src="images/html5.gif" /></li>
            <li><img src="images/jquery-logo.gif" /></li>
        </ul>
    </div>
</div>
<!-- 中间部分结束-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
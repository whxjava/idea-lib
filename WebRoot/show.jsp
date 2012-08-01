<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><s:property value="msgMenu.message.msgTitle" /></title>
    <link href="css/show.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            $.getJSON("msgMenuFindTop.action",{"menuId":$("#menuId").val()},function(data){
                var str = "";
                if(data != null || data.length > 0){
                    for(var i = 0 ; i < data.length ; i++){
                        str += " <li><span><img src='images/dot1.gif'></span><a href= 'message?Id="+data[i].id+"' target='_blank'>"+data[i].message.msgTitle+"</a></li>";
                    }
                }else{
                    str += " <li><span><img src='images/dot1.gif'></span>暂时无信息</li>";
                }
                $("#hotArticle").html(str);
            });
            $.getJSON("msgMenuFindLast.action",{"menuId":$("#menuId").val()},function(data){
                var str = "";
                if(data != null || data.length > 0){
                    for(var i = 0 ; i < data.length ; i++){
                        str += " <li><span><img src='images/dot2.gif'></span><a href= 'message?Id="+data[i].id+"' target='_blank'>"+data[i].message.msgTitle+"</a></li>";
                    }
                }else{
                    str += " <li><span><img src='images/dot2.gif'></span>暂时无信息</li>";
                }
                $("#lastArticle").html(str);
            });

        });
    </script>
</head>

<body>
<!--头部开始-->
<%@include file="head.jsp"%>

<div class="content_top">
    <span>当前位置-<span><s:property value="msgMenu.systemMenu.name" /></span></span>
</div>
<div class="content_center">
    <div class="content_center_left" style="overflow:auto;">
        <span class="content_center_left_title"><s:property value="msgMenu.message.msgTitle" /></span>
        <span class="content_center_left_subtitle">来源: <s:property value="msgMenu.message.msgTitle" />  发布时间: <s:property value="msgMenu.publishTime.substring(0,19)" />  阅读: <s:property value="msgMenu.readCount" /> 次  　 [收藏]  </span>

        <div class="content_center_left_content"><s:property value="msgMenu.message.msgContent" escape="false" /></div>
        <span style="display:block; float:right; height:30px; line-height:30px;font-family:Arial, Helvetica, sans-serif;font-size:12px;">标签：<s:property value="msgMenu.message.msgTag"  /> </span>

    </div>
    <div class="content_center_right">
        <span class="content_center_right_span"><s:property value="msgMenu.systemMenu.name" />热门文章</span>
        <ul id="hotArticle"></ul>
        <span class="content_center_right_span"><s:property value="msgMenu.systemMenu.name" />最新文章</span>
        <ul id="lastArticle"></ul>
    </div>
    <input id="menuId" type="hidden" value="<s:property value="msgMenu.systemMenu.Id" />" />
    <!--底部开始-->

    

</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

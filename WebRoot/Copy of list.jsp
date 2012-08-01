<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><s:property value="systemMenu.name" />文章列表</title>
	<link href="css/list.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--头部开始-->
<%@include file="head.jsp"%>
<div class="main">
    <div class="main_top"><span>当前位置--<span><s:property value="systemMenu.name" /></span></span></div>
    <div class="main_content">
        <div class="main_content_left">
            <span class="liebiao"><s:property value="systemMenu.name"/> 文章列表</span>
            <ul>
            	<s:iterator id="list" var="list" value="list" status="rowStatus">
                	<li>
                		<span class="biaoti"><a target="_blank" href="message.action?Id=<s:property value="#list.message.Id" />" target="_bank"><s:property value="#list.message.msgTitle" /></a></span>
                		<span class="wenzhang"><s:property value="#list.message.msgContent.replaceAll('<.*?>', '').substring(0,100)" /></span>
                		<span class="biaoqian"><s:property value="#list.message.msgTag" /></span>
                	</li>                
                </s:iterator>
            </ul>
        </div>
        <div class="main_content_right"><span></span><div></div></div>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

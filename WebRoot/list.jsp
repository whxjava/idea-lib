<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><s:property value="systemMenu.name" />文章列表</title>
	<link href="css/list.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" >
	$(function(){
		var menuId = $("#menuId").val();
		$.getJSON("msgMenuFindLast.action",{"menuId":menuId},function(data){
			var str = "";
			if(data != null && data.length > 1){
				for(var i = 0 ; i < data.length ; i++){
					str += "<li><a href='message?Id="+data[i].message.id+"' target='_blank'>"+data[i].message.msgTitle+"</a></li>";
				}
			}else{
				str += "<li>暂无信息</li>";
			}
			$(".main_content_right ul").html(str);
		});	
		
		$("#pageControlNum").val($("#pageNow").val());
		$("#jump").click(function(){
				var pageCount = $("#pageCount").val();
				var pageControlNum = $("#pageControlNum").val();
				if($.trim(pageControlNum)=="" || pageControlNum == null ){
					alert("您忘记输入页数了！");
					$("#pageControlNum").focus();
				}else if(isNaN(pageControlNum)){
					alert("请输入整数！");
					$("#pageControlNum").val("");
					$("#pageControlNum").focus();
				}else if(parseInt(pageControlNum) > pageCount){
					alert("请输入"+pageCount+"以内的数");
					$("#pageControlNum").val("");
					$("#pageControlNum").focus();
				}else if(parseInt(pageControlNum) < 1 ){
					alert("请输入大于1的数!");
					$("#pageControlNum").val("");
					$("#pageControlNum").focus();
				}else {
					window.location.href="list?Id="+menuId+"&pageNow="+parseInt(pageControlNum);
				}
			});	
		
	});
	</script>
</head>

<body>
<!--头部开始-->
<%@include file="head.jsp"%>
<div class="main">
    <div class="main_top"><span>当前位置--<span><s:property value="systemMenu.name" /></span></span></div>
    <div class="main_content">
        <div class="main_content_left">
            <span class="liebiao"><s:property value="systemMenu.name" /> 文章列表</span>
            <ul>
            	<s:iterator id="list" var="list" value="list" status="rowStatus">
                	<li>
                		<span class="biaoti"><img src="images/arrow.png" /><a target="_blank" href="message?Id=<s:property value="#list.message.Id" />" target="_bank"><s:property value="#list.message.msgTitle" /></a></span>
                		<span class="wenzhang"><s:property value="#list.message.msgContent.replaceAll('<.*?>', '').substring(0,100)" /></span>
                		<span class="biaoqian"><s:property value="#list.publishTime"/> 阅读：<s:property value="#list.readCount"/> 标签：<span><s:property value="#list.message.msgTag" /></span></span>
                	</li> 
                </s:iterator>	                               
            </ul>
            <span style="display:block;margin: 20px;color: #2E6AB1;text-align: center;line-height: 200%;">
            	<input type="hidden" id="pageNow" value="<s:property value="pageNow"/>" />
				<input type="hidden" id="pageCount" value="<s:property value="pageCount"/>"/>
				
            	第&nbsp;<s:property value="pageNow"/>&nbsp;页&nbsp;/&nbsp;
				共&nbsp;<s:property value="pageCount"/>&nbsp;页

            	<s:url action="list" id="first_page">
					<s:param name="Id" value="systemMenu.Id"/>
					<s:param name="pageNow" value="1"/>
				</s:url>
				<a href="${first_page}">首页</a>&nbsp;&nbsp;
				
				<s:url action="list" id="prior_page">
					<s:param name="Id" value="systemMenu.Id"/>
					<s:param name="pageNow" value="pageNow-1"/>
				</s:url>
				<s:if test="pageNow > 1">
					<a href="${prior_page}">上一页</a>&nbsp;&nbsp;
				</s:if>
				
				
				<s:url action="list" id="next_page">
					<s:param name="Id" value="systemMenu.Id"/>
					<s:param name="pageNow" value="pageNow+1"/>
				</s:url>
				<s:if test="pageNow < pageCount">
					<a href="${next_page}">下一页</a>
				</s:if>
				
				<s:url action="list" id="last_page">
					<s:param name="Id" value="systemMenu.Id"/>
					<s:param name="pageNow" value="pageCount"/>
				</s:url>
				<a href="${last_page}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
            	  跳转<input type="text" style="width: 25px;" id="pageControlNum" />页<input type="button" id="jump" value="GO" />
            	  
            </span>
        </div>
        <div class="main_content_right"><span><h3>最近文章</h3></span><ul></ul></div>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<input type="hidden" id="menuId" value="<%= request.getParameter("Id") %>" />
</body>
</html>

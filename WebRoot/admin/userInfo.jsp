<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户管理</title>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <style type="text/css">
        .table_container{
            width:800px;
            float:left;
            font-size:12px;
        }
        .table_container a:link{
            text-decoration:none;
            color:#004276;
        }
        .table_container a:hover{
            text-decoration:underline;
            color:#004276;
        }
        .table_container a:visited{
            text-decoration:none;
            color:#004276;
        }
        .table_container_top{
            width:800px;
            height:35px;
            float:left;
        }
        .table_container_bottom{
            width:800px;
            height:35px;
            background-color:#CFD7E1;
            border:solid 1px #90A2AE;
            float:left;
        }
        .table_container_main{
            width:800px;
            float:left;
            border:solid 1px #90A2AE;
            border-bottom:none;
        }
        .table_title{
            background-color:#34526C;
            height:22px;
            color:#FFFFFF;
            font-weight:bold;

        }
        td{
            padding-left:5px;
            font-family:Arial, Helvetica, sans-serif;
        }
        .table_content{
            height:25px;
            color:#444444;
        }
        .table_content_gray{
            height:25px;
            color:#444444;
            background-color:#EFEFEF;
        }
        .page_info{
            height:35px;
            width:300px;
            font-family:Arial, Helvetica, sans-serif;
            font-size:12px;
            line-height:35px;
            float:left;
            margin-left:5px;
        }
        .page_control{
            height:35px;
            width:270px;
            font-family:Arial, Helvetica, sans-serif;
            font-size:12px;
            line-height:35px;
            float:right;
        }
    </style>
    <script type="text/javascript" src="../js/util.js"></script>
	<script type="text/javascript">
	$(function(){
		var basePath = $("#basePath").val();
		$("a[id^=showMsg]").click(function(){
			var Id = $(this).attr("id").substring(8);			
			popup2(basePath+"message?Id="+Id,1000,1000);			
		});
		$("a[id^=DelUser]").click(function(){
			if(confirm("确认要删除吗？")){
				var Id = $(this).attr("id").substring(8);
				$.getJSON("userDel.action",{"userInfo.userId":Id},function(data){
					if(data == "success"){
						window.location.reload();
					}else{
						alert("操作失败！请重新操作！");
					}
				});
			}

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
				window.location.href="listLogs.action?pageNow="+parseInt(pageControlNum);
			}
		});	
	});
	</script>
</head>
<body>
<div class="table_container">

    <div class="table_container_main">
        <table width="800" border="0" cellspacing="1">
            <tr class="table_title">
            	<td>用户ID</td>
                <td>用户名</td>
                <td>密码</td>
                <td>更新用户</td>
                <td>删除用户</td>
            </tr>
			<s:iterator id="list" value="list" status="rowStatus">
			 <tr class="<s:if test="#rowStatus.odd == true">table_content</s:if><s:else>table_content_gray</s:else>">
               	<td><s:property value="userId"/></td>
                <td width="300"><s:property value="userName" /></td>         
                <td><s:property value="userPwd" /></td>
                <td><a href="userFindById.action?userInfo.userId=<s:property value="userId"/>" >更新用户信息</a></td>
                <td><a href="javascript:void(0)" id="DelUser_<s:property value="userId"/>">删除用户信息</a></td>
            </tr>
			</s:iterator>
        </table>
    </div>
    <div class="table_container_bottom">
        <div class="page_info">
			<input type="hidden" id="pageNow" value="<s:property value="pageNow"/>" />
			<input type="hidden" id="pageCount" value="<s:property value="pageCount"/>" />
                               第&nbsp;<s:property value="pageNow"/>&nbsp;页&nbsp;/&nbsp;
		         共&nbsp;<s:property value="pageCount"/>&nbsp;页
        </div>
		<div class="page_control">
			<s:url action="messageFindPage" id="first_page">
				<s:param name="pageNow" value="1"/>
			</s:url>
			<a href="${first_page}">首页</a>&nbsp;&nbsp;
			<s:url action="messageFindPage" id="prior_page">
				<s:param name="pageNow" value="pageNow-1"/>
			</s:url>
			<s:if test="pageNow > 1">
			<a href="${prior_page}">上一页</a>&nbsp;&nbsp;
			</s:if>&nbsp;&nbsp;
			<s:url action="messageFindPage" id="next_page">
				<s:param name="pageNow" value="pageNow+1"/>
			</s:url>
			<s:if test="pageNow < pageCount">
				<a href="${next_page}">下一页</a>
			</s:if>&nbsp;&nbsp;
			<s:url action="messageFindPage" id="last_page">
				<s:param name="pageNow" value="pageCount"/>
			</s:url>
			<a href="${last_page}">尾页</a>&nbsp;&nbsp;
			<span style="color: #004276;">转至</span>
			<input type="text" id="pageControlNum" style="width: 20px;"/>
			<span><input type="button" id="jump" value="GO"/></span>
		</div>
    </div>
</div>
<input type="hidden" id="basePath" value="<%= basePath %>" />
</body>
</html>


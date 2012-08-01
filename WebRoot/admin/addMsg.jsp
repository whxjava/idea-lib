<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.whx.bean.UserInfo"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新增信息</title>
	<link href="../css/util.css" rel="stylesheet" />
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/util.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        ul{list-style:none;line-height: 50px;}
        input{height: 33px;}
        .main{width:800px;border: 1px solid #90A2AE;}
        .msgInput{margin-left: 5px; text-align: center;}
        .msgTitle{margin-left: 5px;display:-moz-inline-box;display:inline-block;width:80px;}
    </style>
    <script type="text/javascript">
    $(function(){
    	$("#submitBtn").click(function(){
    		var msgCount = CKEDITOR.instances.messageContent.getData();
    		var params = {
    			"menuId":$("#menuId").val(),
    			"message.msgTitle":$("#msgTitle").val(),
    			"message.msgSubTitle":$("#msgSubTitle").val(),
    			"message.msgSource":$("#msgSource").val(),
    			"message.msgContent":msgCount,
    			"message.msgTag":$("#msgTag").val(),
    			"userId":$("#publisherId").val()
    		};
    		var url ="messageAdd.action";
    		$.post(url,params,function(data){
    			if(data =="success"){
    				alert("保存成功");
    				$("#menuId").val("");
    				$("#msgTitle").val("");
    				$("#msgSubTitle").val("");
    				$("#msgKind").val("");
    				$("#msgSource").val("");
    				$("#msgTag").val("");
    				CKEDITOR.instances.messageContent.setData("");
    				$("#msgTitle").focus();
    			}else {
    				alert("保存信息出现异常,请重新操作！！");
    			}
    		},"json");
    	});
    	$("#resetBtn").click(function(){
    		$("#menuId").val("");
    		$("#msgTitle").val("");
    		$("#msgSubTitle").val("");
    		$("#msgKind").val("");
    		$("#msgSource").val("");
    		$("#msgTag").val("");
    		CKEDITOR.instances.messageContent.setData("");
    		$("#msgTitle").focus();
    	});
    });
    
    </script>
  </head>
  <body>
    <div class="main">
      <ul>
          <li><span class="msgTitle">信息标题:</span><span class="msgInput"><input type="text" id="msgTitle" style="width: 680px;" /></span></li>
          <li><span class="msgTitle">副&nbsp;标&nbsp;题:</span><span class="msgInput"><input type="text" id="msgSubTitle" style="width: 680px;" /></span></li>
          <li><span class="msgTitle">信息类型:</span><span class="msgInput"><input type="text"  style="width: 664px;" id="msgKind"  /></span><span><a href="javascript:void(0)" onclick="popup('systemMenuAssign.jsp')" ><img src="images/popup.png"></a></span></li>
          <li><span class="msgTitle">信息来源:</span><span class="msgInput"><input type="text"  id="msgSource" style="width: 680px;" /></span></li>
          <li><span class="msgTitle">关&nbsp;键&nbsp;字:</span><span class="msgInput"><input type="text"  id="msgTag" style="width: 680px;" /></span></li>
          <li><span class="msgTitle">发布人员:</span><span class="msgInput"><input type="text"  style="width: 680px;"  value="<%= ((UserInfo)session.getAttribute("userInfo")).getUserName() %>" /></span></li>
          <li><span class="msgTitle">信息内容:</span><textarea class="ckeditor"  cols="15" rows="5"  name="messageContent" id="messageContent"></textarea></li>
          <li style="text-align:right; line-height: 30px;margin-top: 0px;" ><input type="button" value="提交信息" id ="submitBtn"/><input type="button" value="重置信息" id="resetBtn"/></li>
      </ul>
</div>
<input type="hidden" id="menuId" /> 
<input type="hidden" id="publisherId" value="<%= ((UserInfo)session.getAttribute("userInfo")).getUserId() %>" />
</body>
</html>
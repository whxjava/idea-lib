<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.whx.bean.UserInfo"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>更新信息</title>
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
    	
    	var msgContent = $("#msgContent").val();
    	var editor = CKEDITOR.replace("messageContent");
		editor.setData(msgContent);
    	$("#submitBtn").click(function(){
    		var msgCount = CKEDITOR.instances.messageContent.getData();
    		var params = {   			
    			"message.msgTitle":$("#msgTitle").val(),
    			"message.msgSubTitle":$("#msgSubTitle").val(),
    			"message.msgSource":$("#msgSource").val(),
    			"message.msgContent":msgCount,
    			"message.msgTag":$("#msgTag").val(),    			
    		};
    		var url ="messageUpdate.action";
    		$.post(url,params,function(data){
    			if(data =="success"){
    				alert("保存成功");   			
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
          <li><span class="msgTitle">信息标题:</span><span class="msgInput"><input type="text" id="msgTitle" style="width: 680px;" value="<s:property value="message.msgTitle"/>" /></span></li>
          <li><span class="msgTitle">副&nbsp;标&nbsp;题:</span><span class="msgInput"><input type="text" id="msgSubTitle" style="width: 680px;" value="<s:property value="message.msgSubTitle"/>"  /></span></li>        
          <li><span class="msgTitle">信息来源:</span><span class="msgInput"><input type="text"  id="msgSource" style="width: 680px;" value="<s:property value="message.msgSource"/>"  /></span></li>
          <li><span class="msgTitle">关&nbsp;键&nbsp;字:</span><span class="msgInput"><input type="text"  id="msgTag" style="width: 680px;" value="<s:property value="message.msgTag"/>"   /></span></li>
          <li><span class="msgTitle">发布人员:</span><span class="msgInput"><input type="text"  style="width: 680px;"  value="<%= ((UserInfo)session.getAttribute("userInfo")).getUserName() %>" /></span></li>
          <li><span class="msgTitle">信息内容:</span><textarea class="ckeditor"  cols="15" rows="5"  name="messageContent" id="messageContent"></textarea></li>
          <li style="text-align:right; line-height: 30px;margin-top: 0px;" ><input type="button" value="更新信息" id ="submitBtn"/><input type="button" value="重置信息" id="resetBtn"/></li>
      </ul>
</div>
<input type="hidden" id="msgContent" value="<s:property value="message.msgContent"/>"  />
</body>
</html>
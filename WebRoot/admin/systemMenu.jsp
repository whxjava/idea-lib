<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>系统菜单树型目录</title>
		
		<style type="text/css">
			.container{
				width:770px;
				float:left;
				margin-top:2px;
			}
			.tree_container{
				width:280px;
				height:500px;
				float:left;
				border:#C2D2EB solid 1px;
			}
			.tree_container .top_title{
				width:275px;
				height:25px;
				line-height:25px;
				float:left;
				border-bottom:#C2D2EB solid 1px;
				font-size:12px;
				color:#005EAF;
				font-weight:bold;
				background-color:#F2F6F9;
				padding-left:5px;
				margin-bottom:5px;
			}
			.container_right{
				width:470px;
				height:500px;
				float:left;
				border:#C2D2EB solid 1px;
				margin-left:5px;
			}
			.container_right .top_title{
				width:465px;
				height:25px;
				line-height:25px;
				float:left;
				border-bottom:#C2D2EB solid 1px;
				font-size:12px;
				color:#005EAF;
				font-weight:bold;
				background-color:#F2F6F9;
				padding-left:5px;
				margin-bottom:5px;
			}
			.container_right_main{
				width:470px;
				float:left;
				font-size:12px;
				font-family:Arial, Helvetica, sans-serif;
			}
			.dtree{
				float:left;
			}
		</style>
		<link rel="stylesheet" href="../css/util.css"  />
		<link rel="stylesheet" href="../dtree/dtree.css"/>
		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="../dtree/dtree.js"></script>
		<script type="text/javascript">
		
			function createDeptNode(){
				$("#pid").val($('#currentNodeId').val());//在该节点下创建子节点
		       	//$("#sort").val(d.getMaxSort() + 1);//为新的子节点分配的序号
				$('#pname').val(d.getCurrentNodeName($('#currentNodeId').val()));		     
		       	$("#currentPId").val($('#currentNodeId').val());
				$('#nodeName').val("");
				$('#nodeURL').val("");
				$('#nodeOrder').val("");
				$('#nodeName').focus();
			}
			
			function commitCreateDeptNode(){
				var pid = $("#currentPId").val();
				var nodeName = $('#nodeName').val();
				var nodeURL = $('#nodeURL').val();
				var nodeOrder = $('#nodeOrder').val();
				if(pid == "") {
					pid = 0 ;
				} 
				if(nodeName == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入菜单名称!');
					return ;
				} 
				if(nodeURL == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入URL地址!');
					return ;
				} 
				if(nodeOrder == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入菜单顺序!');
					return ;
				}else{
					if(isNaN(nodeOrder)){
						$('#errorMsg').css({"visibility":"visible"});
						$('#errorMsg').html('&nbsp;菜单顺序必须为数字!');
						return ;
					}
				} 
				var param ={"systemMenu.PId":pid,
							"systemMenu.name":nodeName,
							"systemMenu.url":nodeURL,
							"systemMenu.myorder":nodeOrder,
							"systemMenu.remark":null
							};
				$.post("systemMenuAdd.action",param,function(data){
					if(data = "success"){
						window.location.reload();
						$('#pname').val("");
						$('#nodeName').val("");
						$('#nodeURL').val("");
						$('#nodeOrder').val("");
					}else{
						alert("添加失败");
						window.location.reload();
					}
				});
			}
			
			function modifyDeptNode(){
				var id = $("#currentNodeId").val();
				var nodeName = $('#nodeName').val();
				var nodeURL = $("#nodeURL").val();
				var nodeOrder = $("#nodeOrder").val();
				if(nodeName == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入菜单名称!');
					return ;
				} 
				if(nodeURL == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入URL地址!');
					return ;
				} 
				if(nodeOrder == "") {
					$('#errorMsg').css({"visibility":"visible"});
					$('#errorMsg').html('&nbsp;请输入菜单顺序!');
					return ;
				}else{
					if(isNaN(nodeOrder)){
						$('#errorMsg').css({"visibility":"visible"});
						$('#errorMsg').html('&nbsp;菜单顺序必须为数字!');
						return ;
					}
				} 
				var param ={"systemMenu.Id":id,
							"systemMenu.name":nodeName,
							"systemMenu.url":nodeURL,
							"systemMenu.myorder":nodeOrder
							};
				$.post("systemMenuUpdate.action",param, function(data){
					if(data = "success"){
						window.location.reload();
						$('#pname').val("");
						$('#nodeName').val("");
						$('#nodeURL').val("");
						$('#nodeOrder').val("");
					}else{
						alert("添加失败");
						window.location.reload();
					}
				});
			}
			function removeDeptNode(){
				var id = $("#currentNodeId").val();
		             var deleteFlag = confirm('确认删除?');
		             var countChildren = d.countChildren(id);
		             if (deleteFlag){
		                 if (countChildren == 0 && id != undefined){
		                 	$.ajax({
				                    type:"post",
				                    url:"systemMenuDelete.action?date="+Date.parse(new Date()),
				                    data:{"systemMenu.Id":id},
				                    success:function(data){
				                     	if(data == "success"){
				                         		window.location.reload();
				                         		$('#pname').val("");
												$('#nodeName').val("");
												$('#nodeURL').val("");
												$('#nodeOrder').val("");
				                         }else{
				                            	alert("删除失败");
				                            }	
				                         }
				              });
		                 }
		                 else{
		 					alert("此目录中包含有子目录，请先删除子目录。");
		                 }
		             }
			}
			function getNodeInfo(id,pid,name){
				$("#currentPId").val(pid);
				var url ="systemMenuFindById.action";
				var param = {"systemMenu.Id":id};
				$.getJSON(url,param,function(data){
					$('#currentNodeId').val(id);
					$('#pname').val(d.getCurrentNodeParentName(id));
					$('#nodeName').val(name); 
					$("#nodeURL").val(data.url);
					$('#nodeOrder').val(data.myorder);
				});
			}
			
			
		</script>
	</head>
	<body>
		<div class="container">
			<div class="tree_container">
				<div class="top_title">系统菜单树型目录</div>
				<div class="dtree">
				    <script type="text/javascript">
						d = new dTree('d');
						d.add(0,-1,'系统菜单树型目录');
						$.ajax({  
	    					url:'createSystemMenuTree.action', 
	    					type:'get',
	    					datatype:'json',  
	    					async: false,
	    					success:function(data){
								var list = data.treeList;
								$.each(list,function(index){
					        		var id = list[index].id;
					        		var pid = list[index].pid;
					        		var name = list[index].name;
					        		d.add(id,pid,name,"javascript:getNodeInfo("+id+","+pid+",'"+name+"')");
					        	});  
							}
						}); 
						document.write(d);
					</script>
				</div>
			</div>
			<div class="container_right">
				<div class="top_title">维护系统菜单树型目录数据</div>
				<div class="container_right_main">
					<s:hidden name="treeNode.pid" id="pid"/>
					<s:hidden name="treeNode.sort" id="sort"/>
					<table width="100%">
						<tr>
							<td width="130">&nbsp;</td>
							<td width="340"><s:hidden id="currentNodeId" disabled="true"/></td>
							<td ><s:hidden id="currentPId"   disabled="true"/></td>
						</tr>
						<tr>
							<td width="130" align="right">上级菜单:&nbsp;</td>
							<td width="340"><s:textfield id="pname" disabled="true"/></td>
						</tr>
						<tr>
							<td width="130" align="right">下级菜单:&nbsp;</td>
							<td><s:textfield id="nodeName"  onfocus="$('#errorMsg').css({'visibility':'hidden'});"/></td>
						</tr>
						<tr>
							<td width="130" align="right">URL地址:&nbsp;</td>
							<td><s:textfield id="nodeURL"  onfocus="$('#errorMsg').css({'visibility':'hidden'});"/></td>
						</tr>
						<tr>
							<td width="130" align="right">排列顺序:&nbsp;</td>
							<td><s:textfield id="nodeOrder"  onfocus="$('#errorMsg').css({'visibility':'hidden'});"/></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><div class="errorMsg" id="errorMsg">&nbsp;</div></td>
						</tr>
						<tr>
							<td>
								&nbsp;&nbsp;<input id="btnCreateNode" type="button" value="新建菜单" onclick="createDeptNode()"/>
							</td>
							<td>
								
								<input type="button" value="保存菜单" onclick="commitCreateDeptNode()" />&nbsp;
								<input type="button" value="修改菜单" onclick="modifyDeptNode()"/>&nbsp;
								<input type="button" value="删除菜单" onclick="removeDeptNode()"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
	
</html>

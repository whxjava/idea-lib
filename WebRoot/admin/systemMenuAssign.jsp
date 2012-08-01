<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息类型选择</title>
    <link type="text/css" href="../dtreecheckbox/dtreecheckbox.css" rel="StyleSheet" />
 	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
 	<script type="text/javascript" src="../dtreecheckbox/dtreecheckbox.js" ></script>
 	<script type="text/javascript">
 		$(function(){
 			$("#confrimBtn").click(function(){
				var ids = new Array();
				var form = document.getElementById("testForm");
				for (var i=0; i<form.elements.length; i++) {
					var element = form.elements[i];
					if (element.name == "id" && element.type=='checkbox'){
						if( element.checked == true ){
							$("#menuId").val(element.value);
							$("#menuName").val($(element).next().html());
							ids.push(element.value);
							ids.push($(element).next().html());
						}
					}
				}
				if(ids.length < 1){
					alert("未选中任何权限信息，请重新选择");
					return ;
				}else if(ids.length < 2){
					alert("操作出错，请重新选择");
					return ;
				}
				window.opener.document.getElementById("menuId").value =$("#menuId").val();
				window.opener.document.getElementById("msgKind").value =$("#menuName").val();
				window.close();
			});
 		});
 	</script>  
 	<style type="text/css">
 		*{
 			margin: 0px;
 			padding: 0px;
 		}
 		.content{
            width: 200px;
            font-size:14;
            border: 1px solid #C2D2EB;
        }
 	</style> 
  </head>
  <body>
    <div class="content">
     <div class="dtree">
        <script type="text/javascript">
            d = new dTree('d','.','testForm');
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
        <input type="button" value="确认" id="confrimBtn" /><br/>
        <input type="button" value="取消" id="cancelBtn" /><br/>
        <input type="hidden" id="menuId" />
        <input type="hidden" id="menuName" />
    </div>
</div>
  </body>
</html>

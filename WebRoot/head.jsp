<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="css/intellectual.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(function(){
        var str = "";
        $.getJSON("systemMenuTop.action",function(data){
        	str +="<div class='menu_bar'><a href='"+data[0].url+"' target='_bank' >"+data[0].name+"</a></div><div class='menu_split'></div>";
            for(var i = 1 ; i < data.length;i++){
                str +="<div class='menu_bar'><a href=list?Id="+data[i].id+" target='_bank' >"+data[i].name+"</a></div>";
                if(i == data.length - 1 ){
                    str +="";
                }else{
                    str +="<div class='menu_split'></div>";
                }

            }
            $(".menu").html(str);
        });
    });
</script>
<div class="top" >
    <div class="logo"><img src="images/logo.jpg" ></div>
    <div class="menu"></div>
</div>
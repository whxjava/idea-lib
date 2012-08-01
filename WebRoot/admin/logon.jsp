<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>退出系统</title>
  </head>
  <body>	 
	<%  
   	session.invalidate() ;     
    response.setHeader("refresh","0;URL=login.jsp") ; 
	%>
  </body>
</html>


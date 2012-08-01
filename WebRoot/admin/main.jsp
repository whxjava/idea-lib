<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理中心</title>
</head>
<frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
    <frame src="admin_top.jsp" noresize="noresize" frameborder="0" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main"  />
    <frameset cols="200,*"  rows="560,*" id="frame">
        <frame src="left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
        <frame src="right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
    </frameset>
    <noframes>
        <body></body>
    </noframes>
    </frameset>
</html>
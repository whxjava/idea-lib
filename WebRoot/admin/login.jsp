<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>知识库后台管理系统</title>
    <link href="images/skin.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var username = $("#username");
            var password = $("#password");
           $("#cs").click(function(){
               username.val("");
               password.val("");
               $("input[name='verifycode']").val("");
           });
            $("#submit").click(function(){
                if(username.val() == null || username.val() ==""){
                    alert("请输入用户名！！");
                    username.focus();
                    return ;
                }
                if(password.val() == null || password.val() == ""){
                    alert("请输入密码!!")
                    password.focus();
                    return ;
                }
                $.getJSON("login.action",{"userInfo.userName":username.val(),"userInfo.userPwd":password.val()},function(data){
                        if(data == "success"){
                            window.location.href ="/admin/main.jsp";
                        }else{
                            alert("您输入的用户名和密码有误，请您重新输入！！");
                            username.val("");
                            password.val("");
                            $("input[name='verifycode']").val("");
                            username.focus();
                        }
                });
            });
        });
    </script>
</head>
<body>
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
            <tr>
                <td width="1%" height="21">&nbsp;</td>
                <td height="42">&nbsp;</td>
                <td width="17%">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
            <tr>
                <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
                    <tr>
                        <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="149">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="80" align="right" valign="top"><img src="images/logo.png" width="279" height="68"></td>
                            </tr>
                            <tr>
                                <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35%">&nbsp;</td>
                                        <td height="25" colspan="2" class="left_txt"><p>1- 主要记录个人学习心得...</p></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td height="25" colspan="2" class="left_txt"><p>2- 主要记录网站上比较好的学习资源...</p></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td height="25" colspan="2" class="left_txt"><p>3- 强大的后台系统，管理内容易如反掌...</p></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td width="30%" height="40"><img src="images/icon-demo.gif" width="16" height="16"><a href="http://www.865171.cn" target="_blank" class="left_txt3"> 使用说明</a> </td>
                                        <td width="35%"><img src="images/icon-login-seaver.gif" width="16" height="16"><a href="http://www.865171.cn" class="left_txt3"> 在线帮助</a></td>
                                    </tr>
                                </table></td>
                            </tr>
                        </table></td>
                    </tr>

                </table></td>
                <td width="1%" >&nbsp;</td>
                <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="4%">&nbsp;</td>
                        <td width="96%" height="38"><span class="login_txt_bt">登陆知识库后台管理</span></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                            <tr>
                                <td height="164" colspan="2" align="center">
                                    <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                                        <tr>
                                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                                            <td height="38" colspan="2" class="top_hui_text"><input class="editbox4" id="username" type="text" name="userInfo.userName"   size="20">                            </td>
                                        </tr>
                                        <tr>
                                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" id="password" type="password" name="userInfo.userPwd" size="20" >
                                                <img src="images/luck.gif" width="19" height="18"> </td>
                                        </tr>
                                        <tr>
                                            <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                                            <td height="35" colspan="2" class="top_hui_text"><input class=wenbenkuang name=verifycode type=text value="" maxLength=4 size=10 >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35" >&nbsp;</td>
                                            <td width="20%" height="35" ><input name="Submit" type="button" class="button" id="submit" value="登 陆"> </td>
                                            <td width="67%" class="top_hui_text"><input name="cs" type="button" class="button" id="cs" value="取 消" ></td>
                                        </tr>
                                    </table>
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td width="433" height="164" align="right" valign="bottom"><img src="images/login-wel.gif" width="242" height="138"></td>
                                <td width="57" align="right" valign="bottom">&nbsp;</td>
                            </tr>
                        </table></td>
                    </tr>
                </table>
                </td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
            <tr>
                <td align="center"><span class="login-buttom-txt">Copyright &copy; 2011-2013 </span></td>
            </tr>
        </table></td>
    </tr>
</table>
</body>
</html>
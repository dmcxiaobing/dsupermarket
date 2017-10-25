<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>超市管理系统-后台登录</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<style type="text/css">
<!--

#Layer1{

   position:absolute;
	margin-left:380px;
	margin-top:230px;
	z-index:1;

}
input[type="text"]{
	width:250px;
	height:35px;
}
input[type="password"]{
	width:250px;
	height:35px;
}
.STYLE6 {font-size: 14px}
/*设定层的阴影效果*/
.shadow{
		filter: progid:DXImageTransform.Microsoft.Shadow(color='#7d7d7d', Direction=150, Strength=10); 
		background-color:#dae6f4;
		-moz-box-shadow:2px 2px 5px #7d7d7d;
		 -webkit-box-shadow:2px 2px 5px #7d7d7d;
		  box-shadow:2px 2px 5px #7d7d7d;
}
-->
</style>
</head>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<body>
<SCRIPT type="text/javascript">

function checkForm(){
	var userName=$("#username").val();
	var password=$("#password").val();
	if(userName==null||userName==""){
		$("#error").html("用户名不能为空！");
		return false;
	}
	if(password==null||password==""){
		$("#error").html("密码不能为空！");
		return false;
	}
	return true;
}
</SCRIPT>
 <div id="behind" class="shadow" style="text-align:center;
	margin:0 auto;
	z-index:1;
	width:1000px;
	height:500px;
	background:url(${path }/images/blogin.jpg);
	background-repeat:no-repeat;">
	 <div style ="color:red; position:absolute;
	margin-left:380px;
	margin-top:230px;
	z-index:1;" > 
    </div> 
<div id="Layer1">
  <form action="${pageContext.request.contextPath}/user/login.action" method="post" onsubmit="return checkForm()" style="height:250px;width:480px;">
    <table width="441" height="110" border="0" cellpadding="0" cellspacing="0">
     
      <tr height="55px">
        
        <td align="left" valign="middle" > <input type="text" name="username"  id="username" style="border-color:#00CCFF;width:180px;height:30px;padding-top:3px;"  placeholder="请输入用户名" value="${user.username }"/></td>
      </tr>
      <tr>
        <td align="left" valign="middle">  <input type="password" name="password"   id="password" style="border-color:#00CCFF;width:180px;height:30px;padding-top:3px;" placeholder="请输入密码" value="${user.password }" /></td>
      </tr>
      	<span><font color="red" id="error">${errorInfo }</font></span>
      <tr>
        <td height="50" colspan="2" align="left" valign="middle"><input name="submit" type="submit" value="提  交" style="height:30;width:80;background-image: ${path}/images/dl.jpg" />&nbsp;&nbsp;
          <input name="reset" type="reset" value="重  置" style="height:30;width:80" />&nbsp;&nbsp;
          </td>
        </tr>
    </table>
  </form>
</div>
</div>
</body>
</html>

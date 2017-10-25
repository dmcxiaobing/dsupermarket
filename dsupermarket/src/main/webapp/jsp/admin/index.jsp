<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>超市管理系统-后台管理</title>
</head>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

 %>
<frameset rows="*" cols="180,*" frameborder="no" border="0" framespacing="0">
  <frame src="${path }/jsp/admin/left.jsp" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
  <frameset rows="50,*" frameborder="no" border="0" framespacing="0">
    <frame src="${path }/jsp/admin/head.jsp" name="topFrame" scrolling="0" noresize="noresize" id="topFrame" title="topFrame" />
    <frame src="${path }/jsp/admin/right.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>	
</frameset>
<noframes>
<body>
<p><font size="+3" color="red">你的浏览器不支持框架，请升级你的浏览器</font></p>
</body>
</noframes>
</html>

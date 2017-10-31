<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head><title></title>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<link rel="stylesheet" href="${path }/css/general.css"/>
	<link rel="stylesheet" href="${path }/css/jquery-ui-1.8.20.custom.css"/>
	<script type="text/javascript" src="${path }/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${path }/js/jquery-ui-1.8.20.custom.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
		$(".ta tr").each(function(i) {
			this.style.backgroundColor = [ '#799AE1', '#D6DFF7' ][i % 2]
		});

		  $(".ta tr").mouseover(function(){//如果鼠标移到class为stripe的表格的tr上时，执行函数
                $(this).addClass("mousehover");}).mouseout(function(){//给这行添加class值为over，并且当鼠标一出该行时执行函数
                $(this).removeClass("mousehover");}); //移除该行的class
	});
	</script>
	</head>
	<center>
	<body>
		<center><font class="tabletop">添加员工</font></center><br/><br/>
		<!--<c:set var="stu" value="${sessionScope.stu_info }"/>-->
		<form action="${path }/employer/addEmployer.action" target="mainFrame"  method="post">
		<table class="ta" width="200px">	
		
		<tr >
			<td>员工姓名</td>
			<td><input type="text" name="ename" />
			</td>
		</tr>
		<tr >
			<td>员工地址</td>
			<td><input type="text" name="address" /></td>
		</tr>
		<tr >
			<td>员工电话</td>
			<td><input type="text" name="telephone" /></td>
		</tr>
		<tr >
			<td>员工月薪</td>
			<td><input type="text" name="monthpay" /></td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit"  value="提交" class="buStyle" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"  value="重置" class="buStyle"/></td>
		</tr>
		</table>
		</form>
	</body>
	</center>
</html>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title></title>
		<c:set var="path" value="${pageContext.request.contextPath }" />
		<link rel="stylesheet" href="${path }/css/general.css" />
		<link rel="stylesheet" href="${path }/css/jquery-ui-1.8.20.custom.css" />
		<script type="text/javascript" src="${path }/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript"
			src="${path }/js/jquery-ui-1.8.20.custom.min.js"></script>

		<script type="text/javascript">
	$(function() {
		$(".ta tr").each(function(i) {
			this.style.backgroundColor = [ '#799AE1', '#D6DFF7' ][i % 2]
		});

		  $(".ta tr").mouseover(function(){//如果鼠标移到class为stripe的表格的tr上时，执行函数
                $(this).addClass("mousehover");}).mouseout(function(){//给这行添加class值为over，并且当鼠标一出该行时执行函数
                $(this).removeClass("mousehover");}); //移除该行的class

		
	});

	var xmlHttpRequest = null; //声明一个空对象以接收XMLHttpRequest对象

	function checkusername(field, url) {

		var uername = field.value;
		if (uername == "" || uername.length < 3) {
			document.getElementById("namemessage").innerHTML = "用户名应该不小于3位";
			return;
		} else {

			if (window.ActiveXObject) // IE浏览器
			{
				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) //除IE外的其他浏览器实现
			{
				xmlHttpRequest = new XMLHttpRequest();
			}

			if (null != xmlHttpRequest) {

				//当利用get方法访问服务器端时带参数的话，直接在"AjaxServlet"后面加参数，                   下面send方法为参数null就可以，用post方法这必须在把参数加在send参数内，如下
				xmlHttpRequest.open("get", url + "?username=" + uername,
						true);
				//关联好ajax的回调函数
				xmlHttpRequest.onreadystatechange = ajaxCallback;
				//真正向服务器端发送数据
				// 使用post方式提交，必须要加上如下一行,get方法就不必加此句
				xmlHttpRequest.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xmlHttpRequest.send(null);
			}

		}
	}

	function ajaxCallback() { //ajax一次请求会改变四次状态，所以我们在第四次(即一次请求结束)进行处理就OK,
		if (xmlHttpRequest.readyState == 4) { //请求成功
			if (xmlHttpRequest.status == 200) {
				var responseText = xmlHttpRequest.responseText;
				document.getElementById("namemessage").innerHTML = responseText;
			}
		}
	}
</script>
	</head>
	<center>
		<body>
			<center>
				<font class="tabletop">添加管理员</font>
			</center>
			<br />
			<br />
			<!--<c:set var="stu" value="${sessionScope.stu_info }"/>-->
			<form action="${path }/user/addUser.action" target="mainFrame">
				<table class="ta" width="200px">
					<tr>
						<td>
							用户名
						</td>
						<td>
							<input type="text" name="username"  id="username"  placeholder="请输入用户名" value="${user.username }"
								onblur="checkusername(this,'/user/checkUsernameIsExists.action')" />

						</td>
						<td>
							<span id="namemessage" style="color: red;"></span>
						</td>

					</tr>
					<tr>
						<td>
							密码
						</td>
						<td>
							<input type="password" name="password"   id="password"  placeholder="请输入密码" value="${user.password }" />
						</td>
						<td>
							<span></span>
						</td>
					</tr>

					<tr>
						<td colspan="3">
							<input type="submit" value="提交" class="buStyle" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="重置" class="buStyle" />
						</td>
					</tr>
				</table>
			</form>
		</body>
	</center>
</html>
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

		$(".ta tr").mouseover(function() {//如果鼠标移到class为stripe的表格的tr上时，执行函数
					$(this).addClass("mousehover");
				}).mouseout(function() {//给这行添加class值为over，并且当鼠标一出该行时执行函数
					$(this).removeClass("mousehover");
				}); //移除该行的class

		$("#all").click(function() {
			if (this.checked) {
				$("input[type='checkbox']").each(function() {
					$(this).attr("checked", true);
				});
			} else {

				$("input[type='checkbox']").each(function() {
					$(this).attr("checked", false);
				});

			}

		})
	});

	function showDialogForEdit(id) {
		window.showModalDialog(
				'EmployerAction!updateEmployerDialog?employer.id=' + id, '',
				'dialogWidth=450px;dialogHeight=350px;');
	}
</script>
	</head>
	<center>
		<body>
			<table class="ta">
				<tr>
					<td>
						编号
					</td>
					<td>
						姓名
					</td>
				</tr>
				<c:forEach items="${sessionScope.todayworklist }" var="workday"
					varStatus="status">

					<tr>
						<td>
							${workday.employer.id}
						</td>
						<td>
							${workday.employer.username }
						</td>
					</tr>


				</c:forEach>


			</table>
		</body>
	</center>
</html>
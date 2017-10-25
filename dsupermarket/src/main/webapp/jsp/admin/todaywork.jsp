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
                
           $("#all").click(function(){
           if(this.checked){
          $("input[type='checkbox']").each(function() {
            $(this).attr("checked", true);
        });
        }else
        {
        
         $("input[type='checkbox']").each(function() {
            $(this).attr("checked", false);
        });
        
        }
           		
           
           })
	});
	
	
		function showDialogForEdit(id){
			window.showModalDialog('EmployerAction!updateEmployerDialog?employer.id='+id,'','dialogWidth=450px;dialogHeight=350px;');
	}
	
	</script>
	</head>
	<center>
	<body>
		<form action="EmployerAction!employerworks">
		<table class="ta">	
			<tr bgcolor="#D6DFF7">
				<th colspan="1">是否出勤<input type="checkbox" name="ids" id="all" value="${emp.id }"/></th>
				<th>编号</th>
				<th>姓名</th>
				<th>住址</th>
				<th>电话</th>
				<th>月薪</th>
			</tr>
			
			<c:forEach items="${sessionScope.list }" var="emp" varStatus="status">
				<tr>
					<td><input type="checkbox" name="ids" group="yanfa_id" value="${emp.id }"/></td>
					<td>${emp.id }</td>
					<td>${emp.username }</td>
					<td>${emp.adress }</td>
					<td>${emp.telephone}</td>
					<td>${emp.monthpay }</td>
				</tr>
			</c:forEach>		
		</table>
		<input type="submit" value="提交">
		</form>
		<br/>
		<center>
		<div id="pageDir">
			 	<c:set var="pageCount" value="${(sessionScope.count-1)/10+1 }"/>
				<fmt:formatNumber var="lastIndex" value="${pageCount}" pattern="#"/>
			<ul>
				<li style="margin-left:25%;">
					第${sessionScope.thisindex }/${lastIndex }页
				</li>
				<li style="margin-left:40px;">
						<a href="EmployerAction!workList?index=1" target="mainFrame">首页</a>
						
						<!-- 
							<c:set var="pageCount" value="${fn:length(userList)%10==0?fn:length(userList)/10:fn:length(userList)/10+1 }"/>
						-->
						
						 	<c:forEach var="i"  begin="1" step="1" end="${lastIndex }">
								<a href="EmployerAction!workList?index=${i } " target="mainFrame"><c:out value="${i }"/></a>
							</c:forEach>
						<a href="EmployerAction!workList?index=${lastIndex}" target="mainFrame">尾页</a>
				</li>
				 <li style="margin-left:40px;">
						<s:form action="EmployerAction!workList" theme="simple" target="mainFrame">
							第<s:textfield  name="index" cssStyle="width:25px;height:20px;"/>页
							<s:submit value="Go" id="go"/>
						</s:form>
				</li>
			</ul>
		</div>
		</center>
	</body>
	</center>
</html>
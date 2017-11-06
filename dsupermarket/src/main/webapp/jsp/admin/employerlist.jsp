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
	
	// 发送post，进入编辑的action${path }/employer/toEditEmployer.action?eid=${emp.eid }
	function toEditEmployer(empid){
			var url = "${path }/employer/toEditEmployer.action";
			var param = {"eid":empid};
			$.post(url,param,function(data){
				// 操作data，进行判断
				if(data && data == "error"){
					//操作失败
					
				}else if(data && data == "success"){
					//操作成功 转发到更新的jsp
				
				}
			});
	}
	
	</script>
	<SCRIPT language=javascript>
	// 提交分页的查询的表单
	function to_page(pageCode){
		if(pageCode){
			$("#pageCode").val(pageCode);
		}
		document.formFindByPage.submit();
	}
</SCRIPT>
</head>
<center>
	<body>
		<!-- 综合查询操作层 -->
		<div id="selectDiv">
			<form id="formFindByPageForm" name="formFindByPageForm" action="${path }/employer/findByPage.action">
				<fieldset><fieldset style="width:80%">
					<legend>查询条件</legend></fieldset>
				姓名: <input type="text" name="ename"  id="ename" value="${employer.ename }"/> 住址:
				<input type="text" name="address"  id="address" value="${employer.address }"/> 电话:
				<input type="text" name="telephone"  id="telephone" value="${employer.telephone }"/> 月薪:
				<input type="text" name="monthpay"  id="monthpay" value="${employer.monthpay }"/>
				<input name="submit" type="submit" value="查	  询" /></form>
		</div>
		<table class="ta">
			<tr bgcolor="#D6DFF7">
				<th colspan="2">操作</th>
				<th>编号</th>
				<th>姓名</th>
				<th>住址</th>
				<th>电话</th>
				<th>月薪</th>
			</tr>
			<c:forEach items="${pageBean.beanList }" var="emp">
				<tr bgColor="${status.index%2==0?'#e5fee2':'#d6fdd0' }">
					<%-- 	<td><img src="${path }/images/edit2.png" alt="编辑" onclick="toEditEmployer(${emp.eid })"/></td> --%>
					<td><a style="border-width: 0px"
						href="${path }/employer/toEditEmployer.action?eid=${emp.eid }"><img
							src="${path }/images/edit2.png" alt="编辑" /></a></td>
					<td><a style="border-width: 0px"
						onclick="return confirm('确定要删除吗?')"
						href="${path }/employer/deleteEmployer.action?eid=${emp.eid }"><img
							src="${path }/images/delete.png" alt="删除" /></a></td>
					<td>${emp.eid }</td>
					<td>${emp.ename }</td>
					<td>${emp.address }</td>
					<td>${emp.telephone}</td>
					<td>${emp.monthpay }</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<center>
		<FORM id="formFindByPage" name="formFindByPage" action="${path }/employer/findByPage.action" method=post>
				<input type="hidden" name="ename"  id="ename" value="${employer.ename }"/> 
				<input type="hidden" name="address"  id="address"  value="${employer.address }" /> 
				<input type="hidden" name="telephone"  id="telephone" value="${employer.telephone }" /> 
				<input type="hidden" name="monthpay"  id="monthpay"  value="${employer.monthpay }"  />
			
			<div id="pageDir">
					<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
						<TBODY>
							<TR>
								<TD><SPAN id=pagelink>
										<DIV
											style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
											共[<B>${pageBean.totalCount}</B>]条记录，共[<B>${pageBean.totalPage}</B>]页
											,每页显示 <select name="pageSize">
												<option value="2"
													<c:if test="${pageBean.pageSize==2 }">selected</c:if>>2</option>
												<option value="3"
													<c:if test="${pageBean.pageSize==3 }">selected</c:if>>3</option>
											</select> 条

											<c:if test="${ pageBean.pageCode > 1 }">
													[<A href="javascript:to_page(${pageBean.pageCode-1})">前一页</A>]
												</c:if>

											<B>当前是第[${pageBean.pageCode}]页</B>

											<c:if test="${ pageBean.pageCode < pageBean.totalPage }">
													[<A href="javascript:to_page(${pageBean.pageCode+1})">后一页</A>] 
												</c:if>

											到 <input type="text" size="3" id="pageCode" name="pageCode" /> 页

											<input type="button" value="Go" onclick="to_page()" />
										</DIV>
								</SPAN></TD>
							</TR>
						</TBODY>
					</TABLE>
					</TD>
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg"
						border=0></TD>
					</TR>
					</TBODY>
					</TABLE>
			</div>
		</FORM>
		
		</center>
	</body>
</center>
</html>
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
	
	 $("#endDate").datepicker({ dateFormat: 'yy-m-d' });
	 $("#beginDate").datepicker({ dateFormat: 'yy-m-d' });
		$(".ta tr").each(function(i) {
			this.style.backgroundColor = [ '#799AE1', '#D6DFF7' ][i % 2]
		});

		  $(".ta tr").mouseover(function(){//如果鼠标移到class为stripe的表格的tr上时，执行函数
                $(this).addClass("mousehover");}).mouseout(function(){//给这行添加class值为over，并且当鼠标一出该行时执行函数
                $(this).removeClass("mousehover");}); //移除该行的class
	});
	
	
		function showDialogForEdit(id){
			window.showModalDialog('IntoGoodsAction!updateIntoGoodsDialog?intoGoods.id='+id,'','dialogWidth=450px;dialogHeight=350px;');
	}
	
	</script>
	</head>
	<center>
	<body>
		<!-- 综合查询操作层 -->
		<div id="selectDiv">
			<s:form action="IntoGoodsAction!intoGoodsList" theme="simple" target="mainFrame" >
				<fieldset style="width:80%">
					<legend>查询条件</legend>
				商品名:<s:select list="%{#request.map}" name="intoGoods.goods.id" headerKey="-1" headerValue="请选择"  label="商品名"></s:select>
				
				进货日期:&nbsp;从<s:textfield name="beginDate" id="beginDate"  cssClass="textStyle"/>至<s:textfield name="endDate" id="endDate" cssClass="textStyle" />
				<s:submit value="查  询" cssClass="buStyle"/>
				</fieldset>
			</s:form>
		</div>
		<table class="ta">	
			<tr bgcolor="#D6DFF7">
				<th colspan="2">操作</th>
				<th>编号</th>
				<th>商品名</th>
				<th>进货日期</th>
				<th>数量</th>
			</tr>
			<c:forEach items="${sessionScope.list }" var="intoGoods" varStatus="status">
				<tr bgColor="${status.index%2==0?'#e5fee2':'#d6fdd0' }">
					<td><img src="${path }/images/edit2.png" alt="编辑" onclick="showDialogForEdit(${intoGoods.id})"/></td>
					<td><a style="border-width:0px" href="IntoGoodsAction!deleteIntoGood?intoGoods.id=${intoGoods.id }"><img src="${path }/images/delete.png" alt="删除"/></a></td>
					<td>进货_${intoGoods.id }</td>
					<td>${intoGoods.goods.name }</td>
					<td>${intoGoods.intoDate }</td>
					<td>${intoGoods.num}</td>
				</tr>
			</c:forEach>		
		</table>
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
						<a href="IntoGoodsAction!intoGoodsList?index=1" target="mainFrame">首页</a>
						
						<!-- 
							<c:set var="pageCount" value="${fn:length(userList)%10==0?fn:length(userList)/10:fn:length(userList)/10+1 }"/>
						-->
						
						 	<c:forEach var="i"  begin="1" step="1" end="${lastIndex }">
								<a href="IntoGoodsAction!intoGoodsList?index=${i } " target="mainFrame"><c:out value="${i }"/></a>
							</c:forEach>
						<a href="IntoGoodsAction!intoGoodsList?index=${lastIndex}" target="mainFrame">尾页</a>
				</li>
				 <li style="margin-left:40px;">
						<s:form action="IntoGoodsAction!intoGoodsList" theme="simple" target="mainFrame">
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
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML><HEAD><TITLE>管理页面</TITLE>
<STYLE type=text/css>BODY {
	BACKGROUND: #799ae1; MARGIN: 0px; FONT: 9pt 宋体
}
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD {
	FONT: 12px 宋体
}
IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px 宋体; COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #428eff; TEXT-DECORATION: underline
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.menu_title {
	
}
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 7px; COLOR: #215dc6; POSITION: relative; TOP: 2px
}
.menu_title2 {
	
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px
}
</STYLE>

<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}

 
</SCRIPT>

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

 %>
 
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0>
  <TBODY>
  <TR>
    <TD vAlign=top bgColor=#799ae1>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD vAlign=bottom height=42><IMG height=38 
            src="../../left.files/title.jpg" width=158> </TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title onMouseOver="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" background="red" 
            height=25><SPAN><A 
            href="${pageContext.request.contextPath}/user/logout.action" 
            target="_parent" ><B>退出</B></A></SPAN></TD>
        </TR>
        <TR>
          <TD class=menu_title onMouseOver="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" background="" 
            height=25>&nbsp;管理员：${currentUser.username }</TD>
</TR>
        </TBODY></TABLE>
	  <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(0) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_1.gif 
            height=25><span><B>管理员信息管理</B></span></TD>
        </TR>
        <TR>
          <TD id=submenu0>
            <DIV class=sec_menu style="WIDTH: 158px ">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20><A 
                  href="UserInfoAlter.asp"
                  target=mainFrame></A><a href="add_admin.jsp" target="mainFrame">添加管理员</a></TD>
              </TR>
               <TR>
                 <TD height=20><a href="update_admin_info.jsp" target="mainFrame">修改管理员信息</a></TD>
               </TR>
			
              
              </TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
   
	  

      <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(1) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_2.gif height=25><SPAN>&nbsp;员工管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu1><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                   
                    <TR>
                      <TD height=20><a href="EmployerAction!emplyerList" target="mainFrame">员工列表</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="add_employer.jsp" target="mainFrame">添加员工</a></TD>
                    </TR>
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
	  
	
	  <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(2) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_2.gif height=25><SPAN>出勤信息管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu2>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20><a href="EmployerAction!workList" target="mainFrame">添加今日出勤</a></TD>
              </TR>
              <TR>
                <TD height=20><a href="EmployerAction!todayWorkView" target="mainFrame">查看今日出勤</a></TD>
              </TR>
              <TR>
                <TD height=20><a href="EmployerAction!monthWorkMap" target="mainFrame">本月出勤统计</a></TD>
              </TR>
              
              </TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
	
	  <TABLE cellSpacing=0 cellPadding=0 width=158>
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(3) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_2.gif height=25><SPAN>货物进出管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu3>
			 <DIV class=sec_menu style="WIDTH: 158px">
			   <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                 <TBODY>
                  <TR>
                     <TD height=20><a href="GoodsAction!goodsList" target=mainFrame>货物列表</a></TD>
                   </TR>
                   <TR>
                     <TD height=20><a href="GoodsAction!updateGoodsDialog" target=mainFrame>添加货物</a></TD>
                   </TR>
				   
                   <TR>
                     <TD height=20><A  href="IntoGoodsAction!addIntoGoodsView"  target=mainFrame>添加进货</A></TD>
                   </TR>
                   <TR>
                     <TD height=20><A  href="IntoGoodsAction!intoGoodsList"  target=mainFrame>本月进货列表</A></TD>
                   </TR>
                  
                 </TBODY>
			     </TABLE>
			 </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV>
			
			</TD>
          </TR>
    
        </TBODY>
      </TABLE>
	  
	  
	   <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(4) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_2.gif height=25><SPAN>&nbsp;超市账目管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu4><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                   <TR>
                      <TD height=20><a href="EmployerWageAction!createWage" target="mainFrame">生成员工本月工资</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="EmployerWageAction!employerWageList" target="mainFrame">本月员工工资列表</a></TD>
                    </TR>
                     <TR>
                      <TD height=20><a href="EmployerWageAction!createGoodsSpend" target="mainFrame">生成本月货物支出</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="EmployerWageAction!goodsSpendList" target="mainFrame">本月货物支出列表</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="add_employer.jsp" target="mainFrame">本月超市盈利</a></TD>
                    </TR>
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
	  
	  
	  
	    <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
          <TR>
            <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(5) 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_2.gif height=25><SPAN>&nbsp;销售商信息管理</SPAN> </TD>
          </TR>
          <TR>
            <TD id=submenu5><DIV class=sec_menu style="WIDTH: 158px">
                <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                  <TBODY>
                   <TR>
                      <TD height=20><a href="InputerAction!inputerList" target="mainFrame">销售商列表</a></TD>
                    </TR>
                    <TR>
                      <TD height=20><a href="add_inputer.jsp" target="mainFrame">添加销售商</a></TD>
                    </TR>
                  </TBODY>
                </TABLE>
            </DIV>
                <DIV style="WIDTH: 158px">
                  <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
                    <TBODY>
                      <TR>
                        <TD 
      height=20></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </DIV></TD>
          </TR>
        </TBODY>
      </TABLE>
      
      
      
	  
	
      <TABLE cellSpacing=0 cellPadding=0 width=158 >
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=../../left.files/admin_left_9.gif 
          height=25><SPAN>后台管理版权信息</SPAN></TD>
        </TR>
        <TR>
          <TD>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20 bgcolor="#D6DFF7" style="LINE-HEIGHT: 150%">版权:滨州学院计算机	系
                 </TD>
              </TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TR></TBODY></TABLE>

	  
				  </BODY></HTML>

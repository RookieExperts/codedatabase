<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<TITLE>Untitled Page</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/windows.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
.gridView {
	BORDER-RIGHT: #bad6ec 1px; BORDER-TOP: #bad6ec 1px; BORDER-LEFT: #bad6ec 1px; COLOR: #566984; BORDER-BOTTOM: #bad6ec 1px; FONT-FAMILY: Courier New
}
.gridViewHeader {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/bg_th.gif); BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 27px; BORDER-BOTTOM: #bad6ec 1px solid
}
.gridViewItem {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 32px; BORDER-BOTTOM: #bad6ec 1px solid; TEXT-ALIGN: center
}
.cmdField {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/bg_rectbtn.png); OVERFLOW: hidden; BORDER-LEFT: 0px; WIDTH: 67px; COLOR: #364c6d; LINE-HEIGHT: 27px; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 27px; BACKGROUND-COLOR: transparent; TEXT-DECORATION: none
}
.buttonBlue {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/bg_button_blue.gif); BORDER-LEFT: 0px; WIDTH: 78px; COLOR: white; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px
}
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<SCRIPT type=text/javascript>
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
 
}
//]]>
</SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/MyOffice/EmployeeMgr.files/WebResource.axd" type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/MyOffice/EmployeeMgr.files/ScriptResource.axd" 
type=text/javascript></SCRIPT>
<SCRIPT 
src="${pageContext.request.contextPath}/MyOffice/EmployeeMgr.files\ScriptResource(1).axd" 
type=text/javascript></SCRIPT>
<DIV>
  <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
      <TR 
  style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/bg_header.gif); BACKGROUND-REPEAT: repeat-x" 
  height=47>
        <TD width=10><SPAN 
      style="FLOAT: left; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
        <TD><SPAN 
      style="FLOAT: left; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN 
      style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">员工管理 </SPAN><SPAN 
      style="FLOAT: left; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
        <TD 
    style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_rc.gif)" 
    width=10></TD>
      </TR>
      <TR>
        <TD style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_ls.gif)">&nbsp;</TD>
        <TD 
    style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white" 
    vAlign=top align=middle>
          <DIV>
            <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 
      style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all 
      border=1>
              <TBODY>
              <tr ><th colspan="9"><A class=cmdField
            href="javascript:void(0);" onclick="addUser()"><span style="float:left;">新增用户</span></A></th></tr>
                <TR>
                  <TH class=gridViewHeader style="WIDTH: 50px" scope=col>&nbsp;</TH>
                  <TH class=gridViewHeader scope=col>用户Id</TH>
                  <TH class=gridViewHeader scope=col>用户编号</TH>
                  <TH class=gridViewHeader scope=col>姓名</TH>
                  <TH class=gridViewHeader scope=col>密码</TH>
                  <TH class=gridViewHeader scope=col>角色</TH>
                  <TH class=gridviewHeader scope=col>用户详情</TH>
                  <TH class=gridviewHeader scope=col>更新</TH>
                  <TH class=gridviewHeader scope=col>删除</TH>
                </TR>
   				<c:forEach items="${listUser}" var="item">
   				<TR>
                  <TD class=gridViewItem style="WIDTH: 50px"><IMG 
            src="${pageContext.request.contextPath}/MyOffice/EmployeeMgr.files/bg_users.gif"> </TD>
                  <TD class=gridViewItem>${item.id}</TD>
                  <TD class=gridViewItem>${item.userno}</TD>
                  <TD class=gridViewItem>${item.username}</TD>
                  <TD class=gridViewItem>${item.password}</TD>
                  <TD class=gridViewItem>1</TD>
                  <TD class=gridViewItem><A class=cmdField 
            href="javascript:void(0);" onclick="openUserInfo(${item.id})">查看详情</A></TD>
                  <TD class=gridViewItem><A class=cmdField 
            href="javascript:void(0);" onclick="updateUser(${item.id})">编辑</A></TD>
                  <TD class=gridViewItem><A class=cmdField 
            id=ctl00_ContentPlaceHolder2_GridView1_ctl02_LinkButton1 
            onclick="deleteUser(${item.id})" 
            href="javascript:void(0);">删除</A> </TD>
                </TR>
   				</c:forEach>
              </TBODY>
            </TABLE>
          </DIV>
        </TD>
        <TD style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_rs.gif)"></TD>
      </TR>
      <TR 
  style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_fs.gif); BACKGROUND-REPEAT: repeat-x" 
  height=10>
        <TD style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_lf.gif)"></TD>
        <TD style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_fs.gif)"></TD>
        <TD 
style="BACKGROUND-IMAGE: url(${pageContext.request.contextPath}/images/main_rf.gif)"></TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<!-- 用户新增 -->
<div id="light" class="white_content"> 
<form action="${pageContext.request.contextPath}/addUser" method="post">
	
    <div class="form">
    <table>
    	
    	<tr>
    	<td><span class="label">用户号：</span></td>
    	<td><span class="tx"><input type="text" name="userno"></span></td>
    	<td><span class="label">用户名：</span></td>
    	<td><span class="tx"><input type="text" name="username"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">性别：</span></td>
    	<td><span class="tx">
    	<select name="sex">
    	<option value="1">男</option>
    	<option value="2">女</option>
    	</select></td>
    	<td><span class="label">身份证号：</span></td>
    	<td><span class="tx"><input type="text" id="IidCardNo" name="idCardNo" onblur="idCardNoO(this.value)"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">手机号：</span></td>
    	<td><span class="tx"><input type="text" name="phone"></span></td>
    	<td><span class="label">地址：</span></td>
    	<td><span class="tx"><input type="text" name="address"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">备注：</span></td>
    	<td><span class="tx"><input type="text" name="remark"></span></td>
    	</tr>
    	<tr>        
    </table>
    </div> 
    <div class="form">
    	<div style="text-align:center">
        <span class="label"></span>
        <span class="txt">
		<button type="submit">提交</button>
		<button type="button" onclick="document.getElementById('light').style.display='none'">关闭</button>
		</span>
    	</div>
   	</div>
</form>
</div> 
<SCRIPT type=text/javascript>
//<![CDATA[
Sys.Application.initialize();
//]]>
//打开新增用户窗口
function addUser(){
	document.getElementById('light').style.display='block';
	//document.getElementById('fade').style.display='block'
}
function idCardNoO(idCard){
	var   re =/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	var varlue = idCard;
	var result = re.test(idCard);
	if(result == false){
		document.getElementById("IidCardNo").value="";
	}
}
/**
 * 查看详情
 */
function openUserInfo(key){
	window.open  

	('${pageContext.request.contextPath}/userInfo?id='+key,'newwindow','height=250,width=748,top=300,left=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') 
}
/**
 * 删除用户
 */
function deleteUser(key){
	       
	var y = confirm('确定要删除吗？');
	if (y== true){
    	//alert('提交ajax')
    	$.ajax({
    		url:"${pageContext.request.contextPath}/deleteUser",
    		dataType:"json",
    		type:"post",
    		contentType : "application/json",
    		data:JSON.stringify({id : key}),
    		success: function(data){
				alert("删除成功！")
				//刷新页面
				//location.reload();
				window.location.href='${pageContext.request.contextPath}/employeeMgr';
    		}
    	});
	}
}
/**
 * 用户信息修改
 */
 function updateUser(key){
	 window.open  

		('${pageContext.request.contextPath}/updateUserInfo?id='+key,'newwindow','height=300,width=800,top=300,left=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') 
}
 
</SCRIPT>

</BODY>
</HTML>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML><HEAD><TITLE>MyOffice 首页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.2900.5848" name=GENERATOR></HEAD>
<script type="text/javascript">
/**
 * 退出登录
 */
 function OutLogin(){
	//alert("1111");
	location.href = '${pageContext.request.contextPath}/logout';
}
function returnHome(){
	document.getElementById("mainFrame").src = '${pageContext.request.contextPath}/employeeMgr';
}
</script>

<FRAMESET id=index 
border=0 frameSpacing=0 rows=120,* frameBorder=no><FRAME id=topFrame 
name=topFrame src="MyOffice/Top.jsp" noResize scrolling=no><FRAMESET 
border=0 frameSpacing=0 frameBorder=no cols=20%,*><FRAME id=leftFrame 
name=leftFrame src="MyOffice/Left.htm" noResize scrolling=no><FRAME 
id=mainFrame name=mainFrame src="${pageContext.request.contextPath}/employeeMgr" noResize 
scrolling=no></FRAMESET>
</FRAMESET>
<noframes></noframes>
</HTML>
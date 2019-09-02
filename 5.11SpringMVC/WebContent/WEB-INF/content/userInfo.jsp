<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户详情</title>

<script type="text/javascript">
function closeWindow(){
	window.close();
}
</script>
</head>
<body>
<!-- 查看详情 -->
<div id="light" class="white_content"> 
<form action="${pageContext.request.contextPath}/addUser" method="post">
	
    <div class="form">
    <table>
    	
    	<tr>
    	<td><span class="label">用户号：</span></td>
    	<td><span class="tx"><input type="text" name="userno" value="${user.userno}" readonly="readonly"></span></td>
    	<td><span class="label">用户名：</span></td>
    	<td><span class="tx"><input type="text" name="username" value="${user.username}" readonly="readonly"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">性别：</span></td>
    	<td><span class="tx"><input type="text" name="sex" value="${user.sex}" readonly="readonly"></td>
    	<td><span class="label">身份证号：</span></td>
    	<td><span class="tx"><input type="text" id="IidCardNo" name="idCardNo" value="${user.idCardNo}" readonly="readonly"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">手机号：</span></td>
    	<td><span class="tx"><input type="text" name="phone" value="${user.phone}" readonly="readonly"></span></td>
    	<td><span class="label">地址：</span></td>
    	<td><span class="tx"><input type="text" name="address" readonly="readonly"></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">年龄：</span></td>
    	<td><span class="tx"><input type="text" name="age" value="${user.age}" readonly="readonly"></span></td>
    	<td><span class="label">备注：</span></td>
    	<td><span class="tx"><input type="text" name="remark" value="${user.remark}" readonly="readonly"></span></td>
    	</tr>
    	<tr>        
    </table>
    </div> 
    <div class="form">
    	<div style="text-align:center">
        <span class="label"></span>
        <span class="txt">
		
		<button type="button" onclick="closeWindow()">关闭</button>
		</span>
    	</div>
   	</div>
</form>
</div> 
</body>
</html>
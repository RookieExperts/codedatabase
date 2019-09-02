<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript">
function closeWindow(){
	window.close();
}
function saveUser(){
	$.ajax({
		url:"${pageContext.request.contextPath}/updateUserSave",
		dataType:"json",
		type:"post",
		contentType : "application/json",
		data:JSON.stringify({id : $('#Idno').val(), userno : $('#usernoId').val(),username : $('#usernameId').val(), 
			idCardNo : $('#IidCardNo').val(),phone : $('#phoneId').val(), address : $('#addressId').val(),remark : $('#remarkId').val()}),
		success: function(data){
			//alert("0000");
			if(data == 1){
				//刷新员工页面
				window.opener.location.href='${pageContext.request.contextPath}/employeeMgr';
				window.close();
			}else{
				alert("更新失败！");
			}
			
			
		}
	});
}
</script>
</head>
<body>
<div id="light" class="white_content"> 

	
    <div class="form">
    <table>
    	
    	<tr>
    	<input type="hidden" id ="Idno" name="id" value="${user.id}"/>
    	<td><span class="label">用户号：</span></td>
    	<td><span class="tx"><input type="text" id ="usernoId"name="userno" value="${user.userno}" ></span></td>
    	<td><span class="label">用户名：</span></td>
    	<td><span class="tx"><input type="text" id="usernameId" name="username" value="${user.username}" ></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">性别：</span></td>
    	<td><span class="tx"><select name="sex" id="sexId">
    	<option value="1">男</option>
    	<option value="2">女</option>
    	</select></td>
    	<td><span class="label">身份证号：</span></td>
    	<td><span class="tx"><input type="text" id="IidCardNo" name="idCardNo" value="${user.idCardNo}" ></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">手机号：</span></td>
    	<td><span class="tx"><input type="text" id="phoneId" name="phone" value="${user.phone}" ></span></td>
    	<td><span class="label">地址：</span></td>
    	<td><span class="tx"><input type="text" id="addressId" name="address" ></span></td>
    	</tr>
    	<tr>
    	<td><span class="label">备注：</span></td>
    	<td><span class="tx"><input type="text" id="remarkId" name="remark" value="${user.remark}" ></span></td>
    	</tr>
    	<tr>        
    </table>
    </div> 
    <div class="form">
    	<div style="text-align:center">
        <span class="label"></span>
        <span class="txt">
		<button type="button" onclick="saveUser()">提交</button>
		<button type="button" onclick="closeWindow()">关闭</button>
		</span>
    	</div>
   	</div>

</div> 
</body>
</html>
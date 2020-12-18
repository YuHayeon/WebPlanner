<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<title>Web Planner - 회원가입 화면</title>
<link href="../resources/css/register.css" rel="stylesheet">

<script language="javascript">
    
    
		
    function goLogin() {
        location.href="login";
    }
    
    
</script>
</head>
<body>
	<div class="formtag">
		<br>
		<br> <b><font size="6">회원가입</font></b> <br>
		<br>
		<br>
		<form action="/register" method="post">
			<br>
			<br>
			<div>
				<label for="userId">학번</label>
				<input type="text" id="userId" name="userId" />
			</div>
			<div>
				<label for="userPass">비밀번호</label>
				<input type="password" id="userPass" name="userPass" />
			</div>
			<div>
				<label for="userName">닉네임</label>
				<input type="text" id="userName" name="userName" />
			</div>
			<br>
			<button type="submit">회원가입</button>
			<button type="button" onclick="goLogin()">취소</button>
		</form>
	</div>
</body>
</html>

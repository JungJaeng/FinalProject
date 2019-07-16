<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	
	<div>
		<form action="/member/login" method="post">
			<label>ID : <input type="text" name="user_id"/></label>
			<label>PW : <input type="password" name="user_pw"/></label>
		
			<button>로그인</button>
		</form>
	</div>
	
 
</body>
</html>
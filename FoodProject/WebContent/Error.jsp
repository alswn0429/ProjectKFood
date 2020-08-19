<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("패스워드가 일치하지않습니다. 다시확인해주세요"); //에러창을 뜨게해준다
		location.href = 'member/memberLoginForm.jsp'; //에러창이 나온뒤에 다시 회원가입창으로 넘어간다
	</script>
	
</body>
</html>
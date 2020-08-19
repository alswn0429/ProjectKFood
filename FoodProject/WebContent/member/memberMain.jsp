<%@page import="model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원 정보 페이지</title>
<style>
body {
   padding-top: 70px;
   padding-bottom: 30px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"/>
	<div align="center">
		<button onclick="location.href='memberUpdate.jsp'">회원 수정</button>
		<button onclick="location.href='memberDelete.jsp'">회원 삭제</button>
	</div>

</body>
</html>
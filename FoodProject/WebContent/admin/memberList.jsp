<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"/>
	<div class="main">
		<h2 align="center">모든 회원 보기</h2>
	</div>
	<table width="800" border="1" bordercolor="gray" align="center">
		<tr height="40">
			<td align="center" width="200">아이디</td>
			<td align="center" width="200">비밀번호</td>
			<td align="center" width="150">이름</td>
			<td align="center" width="1000">주소</td>
			<td align="center" width="150">성별</td>
			<td align="center" width="150">전화번호</td>
			<td align="center" width="300">이메일</td>
			<td align="center" width="150">생년월일</td>
		</tr>
		<!-- forEach문을 돌려서 빈에 저장된 값을 차례대로 출력한다. -->
		<!-- c태그를 사용하였으므로 $를 사용하여 출력한다. -->

		<c:forEach var="bean" items="${v }">

			<tr height="40">
				<td align="center" width="50">${bean.id }</td>
				<td align="center" width="200">${bean.pass1 }</td>
				<td align="center" width="150">${bean.name }</td>
				<td align="center" width="150">${bean.address }</td>
				<td align="center" width="150">${bean.gender }</td>
				<td align="center" width="150">${bean.tel }</td>
				<td align="center" width="150">${bean.email }</td>
				<td align="center" width="150">${bean.birth }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
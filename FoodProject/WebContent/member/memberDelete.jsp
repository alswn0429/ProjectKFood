<%-- <%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 페이지</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="../footer.jsp" flush="false" />
	<%-- <%
		MemberDAO mdao=new MemberDAO();
		MemberBean mbean = (MemberBean)session.getAttribute("member");
		mbean=mdao.oneSelect(mbean.getId());
	%> --%>

	<div align="center">
	<h1 align="center"><a href="../index2.jsp">메인으로</a></h1>
		<h2>회원 탈퇴</h2>
		<form action="../MemberDeleteProc.do" method="post">
			<table width="400" border="1">
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="250">${sessionScope.memberResult.id}</td>
				</tr>

				<tr height="50">
					<td align="center" width="150">비밀번호 확인</td>
					<td width="250"><input type="password" name="password"required></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2"><input type="hidden" name="id"
						value="${sessionScope.memberResult.id}"> <input
						type="submit" value="회원삭제하기">
						<button onclick="location.href='memberMain.jsp'">취소</button></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>
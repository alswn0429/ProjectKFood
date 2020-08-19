<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		if(session.getAttribute("member") != null){
			MemberDAO mdao=new MemberDAO();
			MemberBean mbean = (MemberBean)session.getAttribute("member");
			mbean=mdao.oneSelect(mbean.getId());
			response.sendRedirect("BoardWriteForm3.jsp");
		}else{
	%>
		<script type="text/javascript">
			alert("로그인 후 이용해주세요");
			location.href = '../member/memberLoginForm.jsp';
		</script>
	<%
		}
	%>
</body>
</html>
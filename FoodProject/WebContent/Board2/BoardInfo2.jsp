<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardInfo2</title>
<style>
body {
	padding-top: 100px;
	padding-bottom: 30px;
	font-family: 'Nanum Gothic', sans-serif;
}

table, th {
	padding-top: 50px;
}
	.title {
		font-family: 'Jua', sans-serif;
	}
	.success {
		text-align: center;
	}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 뚱뚱이체(h2) -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 나눔고딕체(body) -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp" flush="false"/>
<%-- <jsp:include page="../footer.jsp" flush="false"/> --%>
	<article>
		<div class="container" role="showBoard">
			<div class="row">
				<div class="col-xs-2 col-md-2"></div>
				<div class="col-xs-8 col-md-8">
					<div align="center" class="title">
						<h2>레시피 보기</h2>
					</div>
					<div align="right">
						<button type="button" class="btn btn-sm btn-info" id="main"
							onclick="location.href='../index2.jsp'">메인으로</button>
					</div>
					<p>&nbsp;</p>
					<div class="table table-responsive">
						<table class="table">
							<tr >
								<th class="success">글번호</th>
								<td><c:out value="${bean.num }" /></td>
								<th class="success">조회수</th>
								<td><c:out value="${bean.readcount-1 }" /></td>
							</tr>
							<tr>
								<th class="success">작성자</th>
								<td><c:out value="${bean.writer }" /></td>
								<th class="success">작성일</th>
								<td><c:out value="${bean.reg_date }" /></td>
							</tr>
							<tr>
								<th class="success">레시피 종류</th>
								<td colspan="3"><c:out value="${bean.kind }" /></td>
							</tr>
							<tr>
								<th class="success">이메일</th>
								<td colspan="3"><c:out value="${bean.email }" /></td>
							</tr>

							<tr>
								<th class="success">제목</th>
								<td colspan="3"><c:out value="${bean.subject }" /></td>
							</tr>

							<tr>
								<th class="success" style="margin: 20%;">글 내용</th>
								<td colspan="3">${bean.content }</td>
							</tr>
							
								<tr height="90">
								<td class="text-center" align="center" colspan="4">
									<button class="btn btn-info btn-sm"
										onclick="location.href='BoardReWriteCon2.do?num=${bean.num }&ref=${bean.ref }&re_step=${bean.re_step}&re_level=${bean.re_level}'">답글쓰기</button>

									<%
										if (session.getAttribute("member") != null) {
											MemberDAO mdao = new MemberDAO();
											MemberBean mbean = (MemberBean) session.getAttribute("member");
											mbean = mdao.oneSelect(mbean.getId());

											if (mbean.getId().equals("admin")) {
									%>
									<button class="btn btn-info btn-sm"
										onclick="location.href='../BoardUpdateCon2.do?num=${bean.num}'">수정하기</button>
									<button class="btn btn-info btn-sm"
										onclick="location.href='../BoardDeleteCon2.do?num=${bean.num}'">삭제하기</button>
									<%
										}
										}
									%>
									<button class="btn btn-info btn-sm"
										onclick="location.href='../BoardListCon2.do'">목록보기</button>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</article>
</body>
</html>
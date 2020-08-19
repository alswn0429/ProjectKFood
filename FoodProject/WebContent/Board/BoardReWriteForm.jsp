<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardReWriteForm</title>
  <style>
    body {
	padding-top: 70px;
	padding-bottom: 30px;
	font-family: 'Nanum Gothic', sans-serif;
	}
	.title {
	font-family: 'Jua', sans-serif;
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
<article>
	<div class="container" role="main">
		<div class="title">
			<h2 align="center">공지사항 답글 작성</h2>
		</div>
		
		<div class="table-response">
			<form action="../BoardReWriteProcCon.do" method="post" role="form" name="form" id="form">
			<c:set var="session" value="${sessionScope.member }"/>
			<div class="mb-3">
				<label for="subject">제목</label>
				<input type="text" class="form-control" name="subject" id="subject" value="[re]" required><br/>
			</div>
			
			<div class="mb-3">
				<label for="writer">작성자</label>
				<input type="text" class="form-control" name="writer" id="writer" value="${session.id }" readonly><br/>
			</div>
			
			<div class="mb-3">
				<label for="email">이메일</label>
				<input type="text" class="form-control" name="email" id="email" value="${session.email }" readonly><br/>
			</div>
			
			<div class="mb-3">
				<label for="password">비밀번호</label>
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요."required><br/>
			</div>
			
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력하세요."required></textarea><br/>
			</div>
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="re_step" value="${re_step }">
				<input type="hidden" name="re_level" value="${re_level}">
				
			<div align="center">
				<button type="submit" class="btn btn-md btn-info" id="write">답글쓰기</button>
				<button type="reset" class="btn btn-md btn-info" id="reset">다시작성</button>
				<button type="button" class="btn btn-md btn-info" id="list" onclick="location.href='../BoardListCon.do'">목록으로</button>
			</div>
			<p>&nbsp;</p>
		</form>
		</div>
	</div>
</article>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="../css/survey.css">
<style>
body {
	padding-top: 20px;
	padding-bottom: 30px;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<jsp:include page="../header.jsp" flush="false"/>
<article>
	<div class="jumbotron">
		<h1 class="title1" align="center">당신의 음식 취향</h1><br/>
			<p class="question" align="center">Q1. 당신은 같은 메뉴의 음식을 먹을 예정이다.<br />
				당신은 편안히 집에서 먹겠는가, 멋진 풍경이 있는 장소에서 먹겠는가?</p>
			<div align="center">
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='surveyQ_1.jsp'">집에서 편안히 먹고싶다</button>
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='surveyQ_1.1.jsp'">밖에서 먹는게 더 맛있다</button>
			</div>
	</div>
</article>
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>
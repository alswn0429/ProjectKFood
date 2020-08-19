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
	padding-top: 70px;
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
			<p class="question" align="center">Q2. 당신은 혼자 먹는것이 좋은가?<br />
				누군가와 함께 먹는것이 좋은가?</p>
			<div align="center">
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='surveyQ_2.jsp'">나는야 프로 혼밥러</button>
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='surveyQ_2.1.jsp'">둘이 먹다가 하나가 죽어야지</button>
			</div>
	</div>
</article>
<jsp:include page="../footer.jsp" flush="false"/> 
</body>
</html>
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
			<p class="question" align="center">Q3. 당신은 누군가를 위해 요리하는것을 좋아하는가요?<br />
				 누군가 당신을 위한 요리를 하는 것을 좋아하는가요?</p>
			<div align="center">
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='survey_final.jsp'">누군가를 위한 요리</button>
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='survey_final.jsp'">도비야 나를 위해 음식해라</button>
			</div>
	</div>
</article>   
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>
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
			<p class="question" align="center">Q3. 새로운 맛집을 찾아 도전하는편?<br />
				 이미 매번 주문하는데가 있어?</p>
			<div align="center">
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='survey_final.jsp'">나의 취미는 맛집여행</button>
				<button type="button" class="btn btn-lg btn-info" onclick="location.href='survey_final.jsp'">구관이 명관이야</button>
			</div>
	</div>
</article> 
<jsp:include page="../footer.jsp" flush="false"/>  
</body>
</html>
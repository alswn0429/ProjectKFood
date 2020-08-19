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
		<h1 class="title1" align="center">당신의 오늘 점심</h1><br/>
			<p class="question" align="center">당신의 오늘 점심은 냉면 입니다.<br />
				축하드립니다.</p>
			<div align="center">
				<img src="../image/cold.jpg"  class="pic">
			</div>
	</div>
</article>    
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>
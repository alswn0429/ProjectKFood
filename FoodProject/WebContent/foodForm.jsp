<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body {
      font-family: 'Nanum Gothic', sans-serif;
      text-align: center;
      background: pink;
   }
   .jumbotron{
   margin-top:30px;
   }
   h1 {
      font-family: 'Jua', sans-serif;
   }
   .blinking{
	-webkit-animation:blink 1.5s ease-in-out infinite alternate;
    -moz-animation:blink 1.5s ease-in-out infinite alternate;
    animation:blink 1.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
.name {
	font-size: 150%;
	font-family: 'Jua', sans-serif;
	color: 
}

</style>
</head>
<body>
<%--    <jsp:include page="header.jsp" flush="false"/>
 --%>   <article>
   <div class="jumbotron">
      <h1 class="title1" align="center">당신의 오늘 점심</h1><br/>
         <p class="question" align="center">당신의 오늘 점심은 <span class="name">${foodName}</span> 입니다.<br />
            축하드립니다.</p>
         <div align="center">
            <img src="${food }"  class="blinking" style="width:300px; height:300px;">
         </div>
      </div>
            <a class="btn btn-info btn-lg" href="random.do" role="button">Random</a>&nbsp;&nbsp;   
			<a class="btn btn-info btn-lg" href="index2.jsp" role="button">Home</a>
   </article>
   
</body>
</html>
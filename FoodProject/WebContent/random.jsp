<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오점뭐먹?</title>
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
<style>
   body {
      font-family: 'Nanum Gothic', sans-serif;
      text-align: center;
      background: pink;
   }
   h1 {
      font-family: 'Jua', sans-serif;
   }
   .jumbotron{
   margin-top:10%;
   }
</style>
</head>
<body>
<article >
   <div class="jumbotron" >
      <h1>오점뭐먹?</h1>
      <p>당신의 오늘 점심을 골라드립니다!</p>
      <p>&nbsp;</p>
      <a class="btn btn-info btn-lg" href="random.do" role="button">Random</a>   
   </div>
</article>
</body>
</html>
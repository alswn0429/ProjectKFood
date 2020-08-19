<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
body {
   /*color: #EAB3AB;*/
   font-family: 'Nanum Gothic', sans-serif;
}
.container-fluid {
  /*  background-color: #1B253B; */
   font-family: 'Nanum Gothic', sans-serif;
   async: false;
}
 .navbar-header {
   font-weight: bold;
}
</style>
</head>
<body>
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
         <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target="#myNavbar">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <div class="navbar-header">
            <a class="navbar-brand" href="../index2.jsp">한식의 민족</a>
         </div>
         <div>
            <div class="collapse navbar-collapse" id="myNavbar">
               <ul class="nav navbar-nav">
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">마이 페이지<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <c:if test="${sessionScope.id == null }">
                           <li><a href="../member/memberLoginForm.jsp">로그인</a></li>
                        </c:if>
                        <c:if test="${sessionScope.id != null }">
                           <c:if test="${sessionScope.id == 'admin' }">
                              <li><a href="../admin/adminPage.jsp">내 정보</a></li>
                           </c:if>
                           <c:if test="${sessionScope.id != 'admin' }">
                              <li><a href="../member/memberMain.jsp">내 정보</a></li>
                           </c:if>
                           <c:if test="${sessionScope.id != null }">
                              <li><a href="../MemberLogoutProc.do">로그아웃</a></li>
                           </c:if>
                           <c:if test="${sessionScope.id == null }">
                              <li><a href="../member/memberLoginForm.jsp">로그인</a></li>
                           </c:if>
                        </c:if>
                     </ul></li>
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">레시피<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="../RecipeCheck.do?number=1">밥류</a></li>
                        <li><a href="../RecipeCheck.do?number=2">찌개류</a></li>
                        <li><a href="../RecipeCheck.do?number=3">반찬류</a></li>
                        <li><a href="../RecipeCheck.do?number=4">음료</a></li>
                        <li><a href="../RecipeCheck.do?number=5">후식</a></li>
                     </ul></li>
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="../BoardListCon.do">공지사항</a></li>
                        <li><a href="../BoardListCon3.do">건의사항</a></li>
                        <li><a href="../BoardListCon4.do">레시피공유</a></li>
                     </ul></li>
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">부가기능<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                         <li><a href="../delicious.jsp">맛집추천</a></li>
                             <li><a href="../random.jsp">오점뭐먹?</a></li>
                             <!-- <li><a href="../delivery.jsp">식재료 배송</a></li> -->
                     </ul></li>
                  <li class="dropdown"><a class="dropdown-toggle"
                     data-toggle="dropdown" href="#">도움주신 분<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="#">주먹왕</a></li>
                        <li><a href="#">회식요정</a></li>
                        <li><a href="#">인천주민</a></li>
                        <li><a href="#">자바천재</a></li>
                     </ul></li>
               </ul>
            </div>
         </div>
      </div>
   </nav>
</body>
</html>
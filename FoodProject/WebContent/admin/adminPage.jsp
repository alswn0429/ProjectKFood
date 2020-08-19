<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
body {
   padding-top: 200px;
   padding-bottom: 30px;
}
.jb-xx-large { 
   font-size: xx-large; 
   font-weight: bold;
   text-align: center;
}
.jb-medium {
   text-align: center;
   font-size: medium;
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
   <div class="container">
   <c:if test="${sessionScope.id != 'admin' }">
      <script type="text/javascript">
         alert("관리자 접속이 필요합니다.");
         location.href = "../member/memberLoginForm.jsp";
      </script>
   </c:if> 
   <c:if test="${sessionScope.id == 'admin'}">
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="../member/memberUpdate.jsp" style="text-decoration: none">회원정보 수정</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=0" style="text-decoration: none">전체 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=1" style="text-decoration: none">밥류 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=2" style="text-decoration: none">찌개류 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=3" style="text-decoration: none">반찬류 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=4" style="text-decoration: none">음료 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="RecipeCheck.do?number=5" style="text-decoration: none">후식 레시피 게시판</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="../noticeListCon.do" style="text-decoration: none">건의사항</a></p><br/>
      </div>
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="../boardListCon.do" style="text-decoration: none">건의사항</a></p><br/>
      </div>
      
      <div class="col-md-6">
         <p class="text-secondary jb-medium"><a href="../memberList.do" style="text-decoration: none">회원 리스트</a></p><br/>
      </div>
     </c:if>
   </div>
</article>
</body>
</html>
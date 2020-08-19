<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<style>
body {
   padding-top: 70px;
   padding-bottom: 30px;
   font-family: 'Nanum Gothic', sans-serif;
}

#color {
   color: #807F89;
}
.title{
	font-family: 'Jua', sans-serif;
}
table {
	text-decoration: none;
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
   <div class="container">
      <div class="table-response">
      	<div class="title">
         <h2 align="center">공지사항</h2>
        </div>
         <div align="right">
            <button type="button" class="btn btn-sm btn-info" id="main"
               onclick="location.href='../index2.jsp'">메인으로</button>
            <button type="button" class="btn btn-sm btn-info" id="main"
               onclick="location.href='Board/AdminCheck.jsp'">글쓰기</button>
         </div>
		 <p>&nbsp;</p>
         
         <table class="table table-hover table-md">
            <colgroup>
               <col style="width: 5%;">
               <col style="width: auto;">
               <col style="width: 15%;">
               <col style="width: 10%;">
               <col style="width: 10%;">
            </colgroup>

            <thead>
               <tr>
                  <th>NO</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
               </tr>
            </thead>
            
            <c:set var="number" value="${number}"/>
            <c:forEach var="bean" items="${vec}">
            
            <tr height="40">
               <td width="70" align="left">${number}</td>
               <td width="310" align="left">
               
               		<c:if test="${bean.re_step > 1}">
               			<c:forEach var="j" begin="1" end="${(bean.re_step -1) *3}">
               					&nbsp;
               			</c:forEach>
               		</c:if>
                  		<a href="MemberCheckCon.do?num=${bean.num}&check=2">${bean.subject}</a>
 					</td>
 					
               <td width="100" align="left">${bean.writer}</td>
               <td width="150" align="left">${bean.reg_date }</td>
               <td width="70" align="left">${bean.readcount }</td>
            </tr>
            <c:set var="number" value="${number-1}"/>
            </c:forEach>

         </table>
         <p align="center">
            <!-- 페이지 카운터링 소스를 작성 -->
            <c:if test="${count > 0}">
            	<c:set var="pageCount" value="${count / pageSize + (count%pageSize == 0 ? 0 : 1)}"/>
            	<c:set var="startPage" value="${1}"/>
				
				<c:if test="${currentPage % 10 != 0 }">
						<!-- 결과를 정수형으로 리턴 받아야 하기에 fmt사용 -->
					<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true"/>
					<c:set var="startPage" value="${result * 10 + 1}"/>
				</c:if>
				
				<c:if test="${currentPage % 10 == 0 }">
						<!-- fmt가 이미 선언 했기때문에 안쓴다 -->
					<c:set var="startPage" value="${(result - 1) * 10 + 1}"/>
				</c:if>
					<!-- 화면에 보여질 페이지 처리 숫자를 표현 -->
				<c:set var="pageBlock" value="${10}"/>
				<c:set var="endPage" value="${startPage + pageBlock -1}"/>
				
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<!-- 이전 링크를 걸지 파악 -->
				<c:if test="${startPage > 10}">
					<a class="btn btn-sm btn-info" href='BoardListCon.do?pageNum=${startPage -10}'>[이전] </a>
				</c:if>
				
				<!-- 페이징 처리 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href='BoardListCon.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				
				<!-- 다음이라는 링크를 만들건지 파악 -->
				<c:if test="${endPage < pageCount}">
					<a class="btn btn-sm btn-info" href='BoardListCon.do?pageNum=${startPage +10}'>[다음]</a>
				</c:if>
            </c:if>
            </p>
            </div>
            <p>&nbsp;</p>
      </div>
</body>
</html>
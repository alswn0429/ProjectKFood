<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
#footer {
   height: 30px;
   font-family: 'Nanum Gothic', sans-serif;
    
}

.footer {
   /* padding: 20px 0; */
   text-align: center;
   font-size: 20px;
}

.footer a {
   text-decoration: none;
   color: #99C1BE;
}

.footer li {
   position: relative;
   display: inline;
   padding: 0 7px 0 10px;
}

.footer ul>li>a:hover {
   color: #85A7A9;
}

address {
   color: #99C1BE;
   font-family: 'Nanum Gothic', sans-serif;
   margin-bottom: auto;
   text-align: center;
}
</style>
</head>
<body>
   <footer id="main_footer" class="navbar navbar-inverse navbar-fixed-bottom">
      <div id="footer">
         <div class="footer">
            <ul>
               <li><a href="#">사이트 도움말</a></li>
               <li><a href="#">사이트 이용약관</a></li>
               <li><a href="#"><strong>개인정보 취급방침</strong></a></li>
               <li><a href="#">Contact to 주먹왕</a></li>
               <li><a href="#">Contact to 회식요정</a></li>
               <li><a href="#">Contact to 인천주민</a></li>
               <li><a href="#">Contact to 자바천재</a></li>
            </ul>
         </div>
      </div>
      <div>
        <address class="address">Copyright&copy;www.naver.com All
         Right Reserved</address>

      </div>
   </footer>
</body>
</html>
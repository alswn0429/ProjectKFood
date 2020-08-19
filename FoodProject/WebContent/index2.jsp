<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA Compatible" content="ie=edge">
    <!--익스플로어 사용자고려-->
    <meta name="keyword" content="한식, Korean Food"> <!-- 해당문서 키워드 -->
    <meta name="description" content="한식레시피를 설명하는 사이트 입니다"><!-- 해당문서 설명 -->
    <meta name="author" content="주먹대장, 회식요정, 인천주민, 자바천재">
    <!--해당 문서 소유주 및 제작자-->
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/final_css.css">
    <!-- 스크롤 올라가는 효과 -->
    <script>
        function isElementUnderBottom(elem, triggerDiff) {
            const {
                top
            } = elem.getBoundingClientRect();
            const {
                innerHeight
            } = window;
            return top > innerHeight + (triggerDiff || 0);
        }

        function handleScroll() {
            const elems = document.querySelectorAll('.up-on-scroll');
            elems.forEach(elem => {
                if (isElementUnderBottom(elem, -20)) {
                    elem.style.opacity = "0";
                    elem.style.transform = 'translateY(70px)';

                } else {
                    elem.style.opacity = "1";
                    elem.style.transform = 'translateY(0px)';

                }
            })
        }

        window.addEventListener('scroll', handleScroll);
    </script>

    <!-- 구글 차트 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {
            'packages': ['corechart']
        });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Current', 'Expected'],
                ['2018', 400, 500],
                ['2019', 700, 600],
                ['2020', 700, 1000],
                ['2021', 1000, 1200]
            ]);

            var options = {
                title: '한식의 민족',
                curveType: 'function',
                legend: {
                    position: 'bottom'
                }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
    </script>
    <!-- 구글 차트 끝 -->
    <!-- 지도  -->
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<style>
	   
    #map{display: inline; float: left; margin-left: 10%; margin-bottom: 2%;}
    .table_map{float: right; margin-left:10%;}
    .title{text-align: center; margin-bottom: 2%;}
   table {
   margin-left:10%;
   margin-bottom:2%;
    width: 80%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  th:nth-child(2n), td:nth-child(2n) {
    background-color: #bbdefb;
  }
  th:nth-child(2n+1), td:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
  a{
  text-decoration: none;}
  
</style>
 	<!-- 스크롤 이동 -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- 스크롤 올라가는 효과 -->
	<script type="text/javascript">
	$(function(){
	  $(".return-top").hide(); // 탑 버튼 숨김 - 이걸 빼면 항상 보인다.
	     
	     $(window).scroll(function () {
	         if ($(this).scrollTop() > 300) { // 스크롤 내릴 표시
	             $('.return-top').fadeIn();
	         } else {
	             $('.return-top').fadeOut();
	         }
	     });
	     $(window).scroll(function () {
	         if ($(this).scrollTop() < 300) { // 스크롤 내릴 표시
	             $('.return-bottom').fadeIn();
	         } else {
	             $('.return-bottom').fadeOut();
	         }
	     });
	             
	     $('.return-top').click(function () {
	         $('body,html').animate({
	             scrollTop: 0  //탑 설정 클수록 덜올라간다
	         }, 2000);  // 탑 이동 스크롤 속도를 조절할 수 있다.
	         return false;
	     });
	     $(".return-bottom").click(function() {
		        $('html').animate({scrollTop : ($('#footer').offset().top)}, 2000);
		    });
	}); 
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>

		$(document).ready(function(){
	
			$('#aboutMove').click(function(){
	
				var offset = $('#curve_chart').offset(); //선택한 태그의 위치를 반환
	
	                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 2.0초 동안 부드럽게 해당 위치로 이동함 
	
		        $('html').animate({scrollTop : offset.top}, 2000);
	
			});
	
		});

	</script>
	
    <title>한식의 민족</title>
</head>

<body>

    <div id="page-wrapper">
        <!-- Header -->
        <header id="header">
            <h1 id="logo"><a href="index.jsp">한식의민족</a></h1>
            <nav id="nav">
                <ul>
                <c:set var="session1" value="${sessionScope.member}"/>
                <c:if test="${session1 == null}">
                    <span><a href="member/memberLoginForm.jsp">LOGIN</a></span>
                    <span><a href="member/memberJoinForm.jsp">JOIN</a></span>
                    <span><a href="contact.jsp">CONTACT</a></span>
                    <span><a id="aboutMove">ABOUT</a></span>
                </c:if>
				<c:if test="${session1 != null }">
					<c:if test="${session_name != null }">
						<c:if test="${sessionScope.id != 'admin' }">
                		<span>${session_name}님</span>
	                    <span><a href="member/memberMain.jsp">MY PAGE</a></span>
	                    <span><a href="MemberLogoutProc.do">LOGOUT</a></span>
	                    <span><a href="contact.jsp">CONTACT</a></span>
	                    <span><a id="aboutMove">ABOUT</a></span>
	                    </c:if>
	                    <c:if test="${sessionScope.id == 'admin' }">
                		<span>${session_name}님</span>
                    	<span><a href="admin/adminPage.jsp">ADMIN PAGE</a></span>
	                    <span><a href="MemberLogoutProc.do">LOGOUT</a></span>
	                    <span><a href="contact2.jsp">CONTACT</a></span>
	                    <span><a id="aboutMove">ABOUT</a></span>
	                    </c:if>
	            </c:if>
	            </c:if>
                </ul>
            </nav>
        </header>
        <a class="return-top" href="#">[맨위로 이동]</a>
        <a class="return-bottom" href="#">[맨아래로 이동]</a>
    </div>
    <!-- Banner -->
    <section id="banner">
        <div class="content">
            <header>
                <h2 class="bounce">한식의 민족 프로젝트</h2>
                <p>SOLKFOOD에서 제안하는<br />
                    당신만을 위한 최고의 레시피</p>
            </header>
            <span class="image"><img src="images/pic01.jpg" alt="" /></span>
        </div>
    </section>
    <!-- 본문시작 -->
    <div class="container">
        <div class="list">

            <img src="images/pic02.jpg" id="block_image">
            <!-- 본문 첫번째 -->
            <article class="up-on-scroll">
                <h1 id="middle_menu" class="up-on-scroll"> 한식의민족 메뉴 (SOLKFOOD - MENU)</h1>
                <div class="base">
                    <ul>
                        <li class="item">
                            <span onclick="location.href='RecipeCheck.do?number=0'">레시피</span>
                            <ul>
                                <span>
                                    <li><a href="RecipeCheck.do?number=1">밥류</a></li>
                                    <li><a href="RecipeCheck.do?number=2">찌개류</a></li>
                                    <li><a href="RecipeCheck.do?number=3">반찬류</a></li>
                                    <li><a href="RecipeCheck.do?number=4">음료</a></li>
                                    <li><a href="RecipeCheck.do?number=5">후식</a></li>
                                </span>
                            </ul>
                        </li>
                        <li class="item">
                            	게시판
                            <ul>
                                <span>
                                    <li><a href="BoardListCon.do">공지사항</a></li>
                                    <li><a href="BoardListCon3.do">건의사항</a></li>
                                    <li><a href="BoardListCon4.do">레시피공유</a></li>
                                </span>
                            </ul>
                        </li>
                        <li class="item">
                            	부가기능
                            <ul>
                                <span>
                                    <li><a href="delicious.jsp">맛집추천</a></li>
                                    <li><a href="random.jsp">오점뭐먹?</a></li>
                                </span>
                            </ul>
                        </li>
                        <li class="item">
                            	도움주신분
                            <ul>
                                <span>
                                    <li><a href="#">주먹왕</a></li>
                                    <li><a href="#">회식요정</a></li>
                                    <li><a href="#">인천주민</a></li>
                                    <li><a href="#">자바천재</a></li>
                                </span>
                            </ul>
                        </li>
                    </ul>
                </div>
            </article>
            <!-- 본문 두번째 -->
            <article class="up-on-scroll">
                <div class="div_space" class="up-on-scroll">
                    <div class="div_left" class="up-on-scroll">
                        <h1>Why? <br />
                            Solkfood!?</h1>
                        <p>한식의 민족의 사이트에 접속하는 사용자 수는<br />
                            꾸준하게 증가하고 있습니다.<br />
                            다음년도에는 더욱 크게 증가하여 많은 서비스를<br />
                            제공해 드릴 수 있을 것으로 예상하고 있습니다.
                        </p>
                    </div>
                    <div class="div_right">
                        <div id="curve_chart" style="width: 100%; height: 100%;"></div>
                    </div>
                </div>
            </article>
            <!-- 본문 세번재 -->
               <article class="up-on-scroll">
                <div class="div_space" class="up-on-scroll">
                    <div class="div_left2" class="up-on-scroll">
                    <div><h1 class="title">한식의 민족에서 추천하는 맛집들</h1></div>

<div id="map" style="width:80%; height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f3bf2ff5160b0ea200ecf03eef263a1"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.569629, 126.986011), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);	

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
	 {
	        content: '<div style="color:black">종로-솔데스크<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:02-6901-7001</div>', 
	        latlng: new kakao.maps.LatLng(37.569629, 126.986011)
	    },
	];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'click', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</script>
	
                    </div>
                    <div class="div_right2">
                    <h1>CONTACT</h1><br> 
                       &nbsp;&nbsp;한식의 민족에서는 온라인 서비스 뿐만 아니라<br>
                       &nbsp;&nbsp;오프라인에서도 최고의 서비스를 제공하기 위해<br>
                       &nbsp;&nbsp;노력하고 있습니다. 
                    </div>
                </div>
            </article>
             <!-- 본문 3.5번째 -->
            <article class="up-on-scroll">
                <div class="div_space" class="up-on-scroll" style="height: 300px;">
                    <div class="div_left" class="up-on-scroll" style="margin-top: -50px;">
                        <h1>VIDEO</h1>
                        <p>한식의 민족의 사이트에서는 단순한 레시피의 설명이 아니라, 따라하기 쉽게 각종 요리에 대한 동영상을 제공하고 있습니다.
                        </p>
                    </div>
                    <div class="div_right" style="border-left: 5px solid blue; padding: 5px;">
                       <iframe style=float: left; width="49%"  height="100%;"src="https://www.youtube.com/embed/ImwORBDiqD4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                       <iframe style=margin-left: 3px; float: left; width="50%" height="100%" src="https://www.youtube.com/embed/t3WLY00kf5Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
             <!-- 본문 네번째-->
             <article id="forth" class="up-on-scroll" style="background-color:#913553; height: 300px;">
             <h3 style="text-align: center; font-size: 25px;  margin-top: 75px; padding-top:65px">정기적인 구독을 원하신다면 이메일을 입력해주세요</h3>
             <br>
            <input class="forth_text" type="text" placeholder="E-mail을 입력해주세요"
            style="float: left; margin-left: 32%; height: 30px; width: 500px;">  
            <!-- submit으로 변경후에 데이터값 받아오기 -->
            <input style="float: left; height: 36px;" class="forth_button" type="button" value="구독"  
            onclick="javascript:window.location='join.jsp'">   
            
        </article>
              <!-- footer -->
        <div id="footer" class="up-on-scroll">
            <div class="footer">
                <ul>
                    <li><a href="#">사이트 도움말</a></li>
                    <li><a href="#">사이트 이용약관</a></li>
                    <li><a href="#"><strong>개인정보 취급방침</strong></a></li>
                    <li><a href="#">Contact to 주먹왕</a></li>
                    <li><a href="#">Contact to 회식요정</a></li>
                    <li><a href="#">Contact to 인천주민</a></li>
                    <li><a href="#">Contact to 자바천재</a></li><br>
                    <li>&copy;Copyright SOLKFOOD All Right Reserved</li>
                </ul>
            </div>
        </div>
        
        
     </div>
    </div>


</body></html>
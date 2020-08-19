<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>한식의 민족에서 추천하는 맛집들</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <!-- 뚱뚱이체(h2) -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
    
    body{
       background-color:#fff;   
       font-family: 'Nanum Gothic', sans-serif;
       padding-top: 70px;
    }
    .title {	
    	font-family: 'Jua', sans-serif;
    }
    #map{display: inline; float: left; margin-left: 10%; margin-bottom: 2%;}
    .table_map{float: right; margin-left:10%;}
    .title{text-align: center; margin-bottom: 2%;}
   table {
   margin-left:10%;
   margin-bottom:80px;
    width: 80%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    text-align: center;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    
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
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
<%-- <jsp:include page="footer3.jsp" flush="false" /> --%>
<div><h1 class="title">한식의 민족에서 추천하는 맛집들</h1></div>

<div id="map" style="width:80%; height:450px;"></div>

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
           content: '<div>종로-솔데스크<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:02-6901-7001</div>', 
           latlng: new kakao.maps.LatLng(37.569629, 126.986011)
       },
       {
           content: '<div>시청-맛집</div>', 
           latlng: new kakao.maps.LatLng(37.565849, 126.976861)
       },
       {
           content: '<div>종로-삼숙이네<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-555-5555</div>', 
           latlng: new kakao.maps.LatLng(37.571565, 126.985617)
       },
       {
           content: '<div>종로-이층집<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.569705, 126.986768)
       },
       {
           content: '<div>종로-시골집<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.571350, 126.985890)
       },
       {
           content: '<div>종로-불돼지<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.569148, 126.984921)
       },
       {
           content: '<div>종로설렁탕<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.569961, 126.989958)
       },
       {
           content: '<div>광화문미진<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.570722, 126.979952)
       },
       {
           content: '<div>마라공방<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.572453, 126.983203)
       },
       {
           content: '<div>이춘복 참치<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:123-444-4444</div>', 
           latlng: new kakao.maps.LatLng(37.569815, 126.986828)
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
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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

/* 아래와 같이도 할 수 있습니다 */
/*
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

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    })(marker, infowindow);
}
*/
</script>

<table border="1" class="map_table" >
   <tr>
      <td>맛집순위</td>
      <td>이름</td>
      <td>정보</td>
   </tr>
   <tr>
      <td>1</td>
      <td>솔데스크</td>
      <td>서울 종로구 종로12길 15 코아빌딩1
      Tel: 02-6901-7001 / <a href="http://www.soldesk.com/">홈페이지 바로가기</a>
      </td>
   </tr>
   <tr>
      <td>2</td>
      <td>마라공방</td>
      <td>서울 종로구 종로 19
      Tel:02-2075-7366 / <a href="https://store.naver.com/restaurants/detail?id=1708692042/">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>3</td>
      <td>종로설렁탕</td>
      <td>서울 종로구 종로 110-1
      Tel:02-2271-3820 / <a href="https://store.naver.com/restaurants/detail?id=11855938">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>4</td>
      <td>교대 이층집</td>
      <td>서울 종로구 삼일대로19길 16
      Tel:02-732-8188 / <a href="https://store.naver.com/restaurants/detail?id=1288875088">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>5</td>
      <td>종로 시골집</td>
      <td>서울 종로구 종로11길 22
      Tel:02-704-5025 </td>
   </tr>
   <tr>
      <td>6</td>
      <td>종로 불돼지</td>
      <td>서울 종로구 청계천로 67
      Tel:02-734-1190 / <a href="https://store.naver.com/restaurants/detail?entry=plt&id=21582064&query=%EC%A2%85%EB%A1%9C%EB%B6%88%EB%8F%BC%EC%A7%80">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>7</td>
      <td>광화문미진</td>
      <td>서울 종로구 종로 19
      Tel:02-730-6198 / <a href="https://store.naver.com/restaurants/detail?entry=plt&id=11680222&query=%EA%B4%91%ED%99%94%EB%AC%B8%EB%AF%B8%EC%A7%84">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>8</td>
      <td>광화문미진</td>
      <td>서울 종로구 종로 19
      Tel:02-730-6198 / <a href="https://store.naver.com/restaurants/detail?entry=plt&id=11680222&query=%EA%B4%91%ED%99%94%EB%AC%B8%EB%AF%B8%EC%A7%84">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>9</td>
      <td>이춘복 참치</td>
      <td>서울 종로구 종로14길 4
      Tel:02-723-4558 / <a href="https://store.naver.com/restaurants/detail?entry=plt&id=33878581&query=%EC%9D%B4%EC%B6%98%EB%B3%B5%EC%B0%B8%EC%B9%98%20%EC%A2%85%EA%B0%81%EC%A0%90">홈페이지 바로가기</a></td>
   </tr>
   <tr>
      <td>10</td>
      <td>삼숙이라면</td>
      <td>서울 종로구 종로11길 30
      Tel:02-720-9711 / <a href="https://store.naver.com/restaurants/detail?entry=plt&id=12024567&query=%EC%82%BC%EC%88%99%EC%9D%B4%EB%9D%BC%EB%A9%B4">홈페이지 바로가기</a></td>
   </tr>
</table>
</body>
</html>
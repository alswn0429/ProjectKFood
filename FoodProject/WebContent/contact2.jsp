<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>CONTACT</title>
</head>
<style>
hr{
height: 3px;
background-color:skyblue;
}
.table{
font-size:15px;
height: 30px;
}

</style>

<jsp:include page="header.jsp" flush="false" />
<div id="map" style="width:50%; height:500px; margin-top:120px; float:left; margin-left:130px;"></div>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f3bf2ff5160b0ea200ecf03eef263a1"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
      mapOption = {
         center : new kakao.maps.LatLng(37.569629, 126.986011), // 지도의 중심좌표
         level : 1
      // 지도의 확대 레벨
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
      var positions = [ {
         content : '<div>SOLKFOOD<br/><a href="https://www.naver.com">홈페이지</a><br>전화번호:02-0000-0000</div>',
         latlng : new kakao.maps.LatLng(37.569629, 126.986011)
      }

      ];

      for (var i = 0; i < positions.length; i++) {
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커의 위치

         });

         // 마커에 표시할 인포윈도우를 생성합니다 
         var infowindow = new kakao.maps.InfoWindow({
            content : positions[i].content,// 인포윈도우에 표시할 내용
         });

         // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
         // 이벤트 리스너로는 클로저를 만들어 등록합니다 
         // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
         kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
               map, marker, infowindow));
         kakao.maps.event.addListener(marker, 'click',
               makeOutListener(infowindow));
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
<div style="float:left; margin-top:180px; margin-left: 100px; 
height: 500px;">
<h1> 오시는길</h1><br>
<table class="table">
<tr>
<td>회사명</td>
<td>SOLKFOOD</td>
</tr>
<tr>
<td>대표이사</td>
<td>화정주먹 회식요정 인천주민 자바천재</td>
</tr>
<tr>
<td>주소</td>
<td>서울특별시 종로구 관철동</td>
</tr>
<tr>
<td>사업자등록번호</td>
<td>777-77-7777</td>
</tr>
<tr>
<td>대표전화</td>
<td>02-1234-4567</td>
</tr>
</table>

</div>
</body>
</html>
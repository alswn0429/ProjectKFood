<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>CONTACT</title>
</head>
<style>
body {
	padding-top: 80px;
	padding-bottom: 30px;
	font-family: 'Nanum Gothic', sans-serif;
}

#map {
	width: 90%;
	height: 550px;
	float: left;
	margin: 50px 0 0 5%;
}

.contact1 {
	width: 30%;
	height: 500px;
	float: left;
	margin: 5% 0 0 10%;
}

.contact2 {
	width: 50%;
	height: 500px;
	float: left;
	margin: 5%;
}
 
hr {
	height: 2px;
	background-color: skyblue;
}
span {
	align: left;
	font-weight: bold;
	font-size: 20px;
}
.title {
	font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<h1 align="center" class="title">오시는 길</h1>
	<div id="map"></div>
	<div class="contact1">
		<span>회사명</span>
		<br>
		<hr>
		<br> <span>대표이사</span>
		<hr>
		<br> <span>주소</span>
		<hr>
		<br> <span>사업자등록번호</span>
		<hr>
		<br> <span>대표전화</span>
	</div>
	<div class="contact2">
		<span>SOLKFOOD</span>
		<br>
		<hr>
		<br> <span>마계인천주민 회식요정 자바천재 백석불주먹</span>
		<hr>
		<br> <span>서울특별시 종로구 관철동</span>
		<hr>
		<br> <span>OOO - OO - OOOOO</span>
		<hr>
		<br> <span>02 - OOOO - OOOO</span>
	</div>

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
</body>
</html>

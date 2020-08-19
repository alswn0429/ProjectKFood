<%@page import="model.MemberDAO"%>
<%@page import="model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<title>회원 수정 페이지</title>
<style>
body,html {
   margin: 0;
   padding: 0;
   font-family: 'Jua', sans-serif;
   background-color: rgba(27, 27, 29, 0.97);
   background-size: cover;
}

.update-box {
   width: 280px;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -45%);
   color: white;
  padding-top: 20%; 
   padding-bottom: 20px;
}

.update-box h1 {
   float: left;
   font-size: 40px;
   border-bottom: 6px solid #ffa9a9;
   margin-bottom: px;
   padding: 5px 0;
   font-family: 'Jua', sans-serif;
}

.textbox {
   width: 100%;
   overflow: hidden;
   font-size: 20px;
   padding: 8px 0;
   margin: 8px 0;
   border-bottom: 1px solid #ffa9a9;
}

.textbox i {
   width: 26px;
   float: left;
   text-align: center;
}

.textbox input {
   border: none;
   outline: none;
   background: none;
   color: white;
   font-size: 18px;
   width: 80%;
   float: left;
   margin: 0 10px;
}

.btn {
   width: 100%;
   background: none;
   /*
  border: 2px solid #ffa9a9;
*/
   color: white;
   padding: 5px;
   font-size: 18px;
   cursor: pointer;
   margin: 12px 0;
}
</style>
</head>
<body>
	<%
		/* String id= (String)session.getAttribute("sessionId"); */
		MemberDAO mdao=new MemberDAO();
		MemberBean mbean = (MemberBean)session.getAttribute("member");
		mbean=mdao.oneSelect(mbean.getId());
	%>
<jsp:include page="../header.jsp" flush="false" />

<div class="container">
      <div class="update-box">
         <form action="../MemberUpdateProc.do" method="post">
            <h1>Update</h1>
            <div class="textbox">
               <i class="fas fa-user"></i> 
                <label>아이디</label>
               <input name="id" type="text" class="input" value="<%=mbean.getId() %>" readonly>
            </div>
            <div class="textbox">
               <i class="fas fa-lock"></i> 
               <label>이름</label>
                <input name="name" type="text" class="input" value=<%=mbean.getName()%> required>
            </div>
            <div class="textbox">
               <i class="fas fa-lock"></i>
               <label>생년월일</label> 
                <input name="birth" type="text" class="input" value="<%=mbean.getBirth()%>" required>
            </div>
            <!-- <div class="textbox">
           	   <i class="fas fa-lock"></i>
               <label>GENDER</label>
               <input type="radio" name="gender" value="남자">MAN
               <input type="radio" name="gender" value="여자">WOMAN
            </div> -->
            <div class="textbox">
               <i class="fas fa-lock"></i> 
               <label>전화번호</label>
                <input name="tel" type="text" class="input" value="<%=mbean.getTel()%>" required>
            </div>
            <div class="textbox">
               <i class="fas fa-lock"></i>
               <label>메일</label> 
                <input name="email" class="input" value="<%=mbean.getEmail()%>" required>
            </div>
            <div class="textbox">
               <i class="fas fa-lock"></i> 
               <label>주소</label>
               <input type="text" class="input" value="<%=mbean.getAddress()%>" readonly>
            </div>
            <div class="textbox">
               <i class="fas fa-lock"></i>
               <label>비밀번호</label>
               <input name="password" type="password" class="input" placeholder="비밀번호를 입력하세요." required>
            </div>
            
            <input type="hidden" name="id" value="<%=mbean.getId()%>">
	        <div>
	            <input type="submit" class="btn" value="Update" style="border: 2px solid red;">  
	            <input type="reset" class="btn" value="Reset" style="border: 2px solid blue;">  
	            <a href="memberMain.jsp" class="log_a">
	               <input type="button" class="btn" value="Back" style="border: 2px solid green;" >
	            </a>
   		 	</div>
            <!-- <div>
					<input type="text" id="sample4_postcode" class="input"placeholder="우편번호"required readonly>
				    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"style="float: right;"><br>
				    <input type="text" id="sample4_roadAddress" class="input" name="address" placeholder="도로명주소"required readonly><br>
				    <input type="text" id="sample4_jibunAddress" class="input"placeholder="지번주소"required readonly><br>
				    <span id="guide" style="color:#999;display:none"></span>
				    <input type="text" id="sample4_detailAddress" class="input" placeholder="상세주소"required><br>
				    <input type="text" id="sample4_extraAddress" class="input" placeholder="참고항목"required readonly>
				
				    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				    <script>
				        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				        function sample4_execDaumPostcode() {
				            new daum.Postcode({
				                oncomplete: function(data) {
				                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                    var roadAddr = data.roadAddress; // 도로명 주소 변수
				                    var extraRoadAddr = ''; // 참고 항목 변수
				
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				                        extraRoadAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if (data.buildingName !== '' && data.apartment === 'Y') {
				                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if (extraRoadAddr !== '') {
				                        extraRoadAddr = ' (' + extraRoadAddr + ')';
				                    }
				
				                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                    document.getElementById('sample4_postcode').value = data.zonecode;
				                    document.getElementById("sample4_roadAddress").value = roadAddr;
				                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				
				                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                    if (roadAddr !== '') {
				                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                    } else {
				                        document.getElementById("sample4_extraAddress").value = '';
				                    }
				
				                    var guideTextBox = document.getElementById("guide");
				                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                    if (data.autoRoadAddress) {
				                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                        guideTextBox.style.display = 'block';
				
				                    } else if (data.autoJibunAddress) {
				                        var expJibunAddr = data.autoJibunAddress;
				                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                        guideTextBox.style.display = 'block';
				                    } else {
				                        guideTextBox.innerHTML = '';
				                        guideTextBox.style.display = 'none';
				                    }
				                }
				            }).open();
				        }
				    </script>
            </div> -->
            
         </form>
      </div>
   </div>
</body>
</html>
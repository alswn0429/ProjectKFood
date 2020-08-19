<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title></title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Jua', sans-serif;
	background-color: rgba(27, 27, 29, 0.97);
	background-size: cover;
}

.login-box {
	width: 280px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -60%);
	color: white;
}

.login-box h1 {
	float: left;
	font-size: 40px;
	border-bottom: 6px solid #ffa9a9;
	margin-bottom: 50px;
	padding: 13px 0;
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

	<div class="container">
		<div class="login-box">
			<form action="../MemberLoginProc.do" method="post">
				<h1>Login</h1>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text"
						placeholder="Username" name="id">
				</div>
				<div class="textbox">
					<i class="fas fa-lock"></i> <input type="password"
						placeholder="Password" name="password">
				</div>
				<input type="submit" class="btn" value="Login"
					style="border: 2px solid red;"> <a
					href="memberJoinForm.jsp"><input type="button" class="btn"
					value="Join" style="border: 2px solid blue;"></a> <a
					href="../index2.jsp" class="log_a"><input type="button"
					class="btn" value="Home" style="border: 2px solid green;"></a>
			</form>
		</div>
	</div>
</body>
</html>
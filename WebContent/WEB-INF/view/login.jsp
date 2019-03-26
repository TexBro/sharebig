<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="model.dataObject.*, java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css?ver=1">


<script>
	/*
	 폼에서 사용자 입력이 유효한 경우에만 로그인 요청이 나갈수 있도록 제한한다.
	 */
	var messageDiv = null;

	function submitHandler(event) {
		var id = document.querySelector('#id');
		var passwd = document.querySelector('#passwd');
		var message = '';
		var result = false;

		
		if (id.value && passwd.value) {

			if (id.value.length >= 2 && passwd.value.length >= 2) {
				result = true;
			 } else {
			 message = '아이디와 패스워드 2자 이상 입력하여야 합니다.';
			 }
		} else {
			message = '아이디와 패스워드에는 반드시 값이 존재해야 합니다.';
		}

		if (!result) {
			event.preventDefault();
			messageDiv.innerHTML = message;
		}
	}

	function init() {
		var loginForm = document.querySelector('#loginForm');
		loginForm.addEventListener('submit', submitHandler);
		messageDiv = document.querySelector('#message');
		var param;
		var url = new URL(window.location.href);
		
		try{
		param=url.searchParams.get("command");
		console.log(param);
		}
		catch (e) {
			// TODO: handle exception
		}
		
		if(param=="wrong"){
			messageDiv.innerHTML += '아이디 또는 비밀번호를 다시 확인하세요.<br>';
		}
	}

	window.addEventListener('load', init);
</script>

<style>
#message {
	color: red;
}

#logo {
	width: 80%;
	height: 80%;
}
</style>

</head>
<body>
	<div class="sidenav">
		<div class="login-main-text">
			<img id="logo" src="images/login_logo.png">
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form method="POST" id="loginForm" action="login_controller.jsp">
					<div class="form-group">
						<label>User Name</label> <input typ="text" class="form-control"
							placeholder="User Name" name="userid" id="id">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" placeholder="Password" name="passwd"
							id="passwd">
					</div>
					<input type="hidden" name="command" value="login" />
					<button type="submit" class="btn btn-black">Login</button>
					<button type="button" class="btn btn-secondary" id="register"
						onclick="location.href='login_controller.jsp?command=signup'">Register</button>

				</form>


				<div id="message"></div>

			</div>
		</div>
	</div>
</body>
</html>
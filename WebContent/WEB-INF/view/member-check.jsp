<%@ page language="java" contentType="text/html; charset=UTF-8"
import="model.dataObject.*, java.util.*" %>

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
var member_no = document.querySelector('#member_no');
var member_name = document.querySelector('#member_name');
var message = '';
var result = false;

if (member_no.value && member_name.value) {
result = true;
} else {
message = '사번과 사원 명을 반드시 적어주어야 합니다 ';
}

if (!result) {
event.preventDefault();
messageDiv.innerHTML = message;
}
}

function init() {
var checkMemberForm = document.querySelector('#checkMemberForm');
checkMemberForm.addEventListener('submit', submitHandler);
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

if(param=="checkWrong"){
messageDiv.innerHTML += '사번과 사원명을 다시 확인하세요.
';
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
<form method="POST" id="checkMemberForm" action="login_controller.jsp">

<div class="form-group">
<label>Employee Number</label> <input type="text"
class="form-control" placeholder="사번을 입력해주세요" name="member_no"
id="member_no">
</div>

<div class="form-group">
<label>Employee Name</label> <input typ="text" class="form-control"
placeholder="사원 명을 입력해주세요" name="member_name" id="member_name">
</div>

<input type="hidden" name="command" value="checkMember" />
<input type="submit" class="btn btn-secondary" id="checkMemberSubmit" value="register">

</form>



<div id="message"></div>

</div>
</div>
</div>
</body>
</html>
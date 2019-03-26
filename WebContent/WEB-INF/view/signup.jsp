<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="model.dataObject.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css?ver=1">

<%@ include file="../include/header.jsp"%>
</head>
<body>
	
	<%@ include file="../include/menubar.jsp"%>
	<div class="container">
		<h1><%= session.getAttribute("login") %>님의 방문을 환영합니다</h1>
		<div class="row">
			<div class="col-md-8 big-margin" style="margin: auto" >
						<h2>Sign Up</h2>
					<hr>
					<form class="form-horizontal" action="login_controller.jsp" method="post">
						<div class="form-group">
							<label class="control-label col-sm-3">ID <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input type="text"
										class="form-control" name="id" id="emailid"
										placeholder="Enter your ID" value="">
								</div>
								<small> Your Email Id is being used for ensuring the
									security of your account, authorization and access recovery. </small>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">Set Password <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="password"
										class="form-control" name="pw" id="password"
										placeholder="Choose password (5-15 chars)" value="">
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Phone <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="hp"
									id="dd" placeholder="Enter your Phone Number here" value="">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Email <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="email"
									id="email" placeholder="Enter your Email here" value="">
							</div>
						</div>
						
						
						<div class="form-group">
						<label class="control-label col-sm-3">Dept name. <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<select name="dept_no" class="form-control">
								<option value="1">전략기획</option>
								<option value="2">재무</option>
								<option value="3">인사</option>
								<option value="4">윤리경영</option>
								<option value="5">구매</option>
								<option value="6">손보운영</option>
								<option value="7">생명운영</option>
								<option value="8">금융운영</option>
								<option value="9">손보인프라</option>
								<option value="10">생명인프라</option>
								<option value="11">신기술연구소</option>
								<option value="12">서비스사업</option>
								<option value="13">금융사업</option>
								<option value="14">제조운영</option>
							</select>
						</div>
					</div>
						
		

						<div class="form-group">
							<div class="col-xs-offset-3 col-md-8 col-sm-9">
								<span class="text-muted"><span class="label label-danger">Note:-</span>
									By clicking Sign Up, you agree to our <a href="#">Terms</a> and
									that you have read our <a href="#">Policy</a>, including our <a
									href="#">Cookie Use</a>.</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">
								<input name="Submit" type="submit" value="Sign Up"
									class="btn btn-primary">
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
</body>
</html>
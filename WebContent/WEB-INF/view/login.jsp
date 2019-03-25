<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">


<script type="text/javascript">


</script>
</head>
<body>
	<div class="sidenav">
		<div class="login-main-text">
			<h1>
				Share <br> Big
			</h1>
			<p>Login or register from here to access.</p>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form action="login_controller.jsp" method ="POST">
					<div class="form-group">
						<label>User Name</label> 
						<input type="text" class="form-control"
							name="userid">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password"
							class="form-control" name="passwd">
					</div>
					<button type="submit" class="btn btn-black" value="login" name="command">Login</button>
					<button type="submit" class="btn btn-secondary" value="signup" name="command">Register</button>

				</form>

			</div>
		</div>
	</div>
</body>
</html>
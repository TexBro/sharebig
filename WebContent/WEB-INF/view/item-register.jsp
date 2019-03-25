<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">

<!-- 가장 기본 데이트피커  -->
<!--     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!--     <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script> -->
<!--     <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" /> -->

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<%@ include file="../include/header.jsp"%>

</head>
<body>
		<%@ include file="../include/menubar.jsp"%>
	
	<div class="container">

		<div class="row">
			<div class="col-md-8 big-margin" style="margin: auto">
				<h2>새로운 상품 등록하기</h2>
				<hr>
				<form class="form-horizontal" method="post" name="signup"
					id="signup" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-sm-3">상품명 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input type="email"
									class="form-control" name="emailid" id="emailid"
									placeholder="상품명을 입력해주세요" value="">
							</div>

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">유형 선택 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="gender" type="radio" value="Male"
								checked> 대여
							</label> ??? <label> <input name="gender" type="radio"
								value="Female"> 판매
							</label> <br> <small> Your Email Id is being used for
								ensuring the security of your account, authorization and access
								recovery. </small>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">시작 날짜 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input id="datepicker1" width="276" />
							<script>
						        $('#datepicker1').datepicker({
						            uiLibrary: 'bootstrap4'
						        });
						    </script>


						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">종료 날짜 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input id="datepicker2" width="276" />
							<script>
						        $('#datepicker2').datepicker({
						            uiLibrary: 'bootstrap4'
						        });
						    </script>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">datepicker <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input type="text" name="daterange"
								value="03/21/2019 - 01/15/2020" />

							<script>
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
});
</script>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">카테고리 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<select name="mm" class="form-control">
								<option value="">디지털/가전</option>
								<option value="1">생활/건강</option>
								<option value="2">출산/육아</option>
								<option value="3">스포츠/레져</option>
								<option value="4">패션잡화</option>
								<option value="5">패션의류</option>
								<option value="6">가구/인테리어</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-3">가격 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input type="text" class="form-control" name="mem_name"
								id="mem_name" placeholder="가격을 입력해주세요." value="">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">상세설명 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<textarea class="form-control" name="mem_name" id="mem_name"
								placeholder="상품의 상세 설명을 입력해주세요." value=""></textarea>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-3">사진 등록 <span
							class="text-danger">*</span><br></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon" id="file_upload"><i
									class="glyphicon glyphicon-upload"></i></span> <input type="file"
									name="file_nm" id="file_nm" class="form-control upload"
									placeholder="" aria-describedby="file_upload">
							</div>
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
							<input name="Submit" type="submit" value="등록"
								class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>


</body>
</html>
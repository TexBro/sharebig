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

<style>
.big-margin {
	/*border: 20px solid #00ff00;*/
	background: white;
	border: 0px solid black;
	padding-top: 50px;
}
</style>

<%@ include file="../include/header.jsp"%>

</head>
<body>
	<%@ include file="../include/menubar.jsp"%>

	<div class="container">

		<div class="row">
			<div class="col-md-8 big-margin" style="margin: auto">
				<h2>새로운 상품 등록하기</h2>
				<hr>
				<form class="form-horizontal" method="post" name="registerForm"
					id="registerForm" action="main_controller.jsp?command=register" enctype="multipart/form-data">
					<span class="text-danger"> &nbsp; &nbsp; &nbsp; <small>*은
							필수입력사항입니다.</small></span>
					<div class="form-group">
						<label class="control-label col-sm-3" style="max-width: 50%">1.
							물품 등록 유형 선택 <span class="text-danger">*</span>
						</label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="register_type" type="radio"
								value="1" checked> 판매
							</label> <label> <input name="register_type" type="radio"
								value="2"> 대여
							</label> <br> <small> 대여를 선택한 경우 1-1으로 가주세요 </small>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" style="max-width: 50%">1-1.
							대여 가능 마지막 날짜 <span class="text-danger">* <small>대여의
									경우</small></span>
						</label>
						<div class="col-md-8 col-sm-9">
							<input type="date" name="share_final_date" id="datepicker1"
								width="276" />

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" style="max-width: 50%">2.
							물품 소유자 유형 <span class="text-danger">*</span>
						</label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="item_type" type="radio" value="3"
								checked> 회사
							</label> <label> <input name="item_type" type="radio" value="4">
								개인
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">3. 상품명 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-envelope"></i></span> <input type="text"
									class="form-control" name="item_name" id="item_name"
									placeholder="상품명을 입력해주세요" value="">
							</div>

						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-3">4. 카테고리 <span
							class="text-danger">*</span>
						</label>
						<div class="col-md-8 col-sm-9">
							<select name="cata_no" class="form-control">
								<option value="101">디지털/가전</option>
								<option value="102">생활/건강</option>
								<option value="103">출산/육아</option>
								<option value="104">스포츠/레져</option>
								<option value="105">패션잡화</option>
								<option value="106">패션의류</option>
								<option value="107">가구/인테리어</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-3" style="max-width: 13%">5.
							가격 <span class="text-danger">*</span>
						</label> <small>판매:판매가격/대여:하루대여가격 </small>
						<div class="col-md-8 col-sm-9">
							<input type="text" class="form-control" name="price" id="price"
								placeholder="가격을 입력해주세요" value="">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">6. 상세설명 </label>
						<div class="col-md-8 col-sm-9">
							<textarea class="form-control" name="item_info" id="item_info"
								placeholder="상품의 상세 설명을 입력해주세요."></textarea>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-3">7. 사진 등록 <br></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon" id="file_upload"> <i
									class="glyphicon glyphicon-upload"></i></span> <input type="file"
									name="item_file" id="item_file" class="form-control upload"
									placeholder="" aria-describedby="file_upload">
							</div>
						</div>
					</div>


					<div class="form-group">
						<div class="col-xs-offset-3 col-md-8 col-sm-9">
							<span class="text-muted"> <span class="label label-danger">Note:-</span>
								<br> 필수 정보를 모두 입력하셨나요? <a href="#">등록버튼</a>을 누르시면 제품등록이
								완료됩니다. <br> Did you fill in all the required information?
								Click <a href="#">register button</a> to complete product
								registration.
							</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
							<input type="hidden" name="command" value="register"> <input
								name="Submit" type="submit" value="등록" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>


</body>
</html>
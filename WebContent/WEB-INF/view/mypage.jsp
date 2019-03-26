<%@page import="model.dataObject.ItemDO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dataObject.MemberDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0"
	class="">
	<%@ include file="../include/menubar.jsp"%>
	<%
		MemberDO user = (MemberDO)session.getAttribute("member"); 
		ArrayList<ItemDO> salelist=(ArrayList<ItemDO>)session.getAttribute("salelist")
	%>
	<div class="mysite-section"
		style="margin: 30px; text-align: -webkit-center;">
		<div class="col-md-10 row">
			<div class="col-md-3 "
				style="height: 250px; background-color: green; padding: 20px;">
				<div class="mypage-name">
					<h1><%=user.getMember_name() %></h1>
					<p><%=user.getEmail()%></p>
					<p><%=user.getHp()%></p>
				</div>
			</div>
			<div class="col-md-9" style="">
				<div class="row justify-content-center">
					<div class="col-md-7 text-center">
						<br>

						<div class="mysite-section-title">
							<h2>My page</h2>
						</div>
						<br>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-lg-4">
						<a href="#" class="service text-center"> <span
							class="icon flaticon-house"></span>
							<h2 class="service-heading">등록한 상품</h2>
							<p></p>
							<h2>1</h2>
							<p></p>
						</a>
					</div>
					<div class="col-md-6 col-lg-4">
						<a href="#" class="service text-center"> <span
							class="icon flaticon-sold"></span>
							<h2 class="service-heading">찜한 상품</h2>
							<p></p>
							<h2>1</h2>
							<p></p>
						</a>
					</div>
					<div class="col-md-6 col-lg-4">
						<a href="#" class="service text-center"> <span
							class="icon flaticon-camera"></span>
							<h2 class="service-heading">대여중인 상품</h2>
							<p></p>
							<h2>1</h2>
							<p></p>


						</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="../include/listview.jsp"%>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>
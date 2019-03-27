<%@page import="com.sun.org.apache.xpath.internal.axes.IteratorPool"%>
<%@page import="model.dataObject.ItemCommentDO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dataObject.ItemDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Homeland &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="../include/header.jsp"%>

</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0"
	class="">

	<% 
	ItemDO itemDO=(ItemDO)session.getAttribute("item"); 
	ArrayList<ItemCommentDO> commentlist=(ArrayList<ItemCommentDO>)session.getAttribute("commentlist");
	%>
	<%@ include file="../include/menubar.jsp"%>

	<div class="site-section site-section-sm">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div
						class="bg-white property-body border-top border-bottom border-left border-right">
						<div class="row mb-5">
							<img src='<%="images/"+itemDO.getItem_file()%>' class="property-main-picture">
						</div>
						<h1><%=itemDO.getItem_name()%></h1>
						
						<div class="row mb-5">
							<div class="col-md-6">
								<strong class="text-success h1 mb-3"><%=itemDO.getPrice()%>원</strong>
							</div>
						</div>
						<div class="row mb-5">
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text"></span> <strong class="d-block">대여</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">제조일</span> <strong class="d-block">2018</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text"></span>
								<strong class="d-block"></strong>
							</div>
						</div>
						<h2 class="h4 text-black">More Info</h2>
						<p><%=itemDO.getItem_info()%>
						</p>

						<h2 class="h4 text-black mb-3">Commnets</h2>
						<div class="commentBox">

							<p class="taskDescription">다양한 의견을 남겨주세요.</p>
						</div>
						<div class="actionBox">
						<br>
							<ul class="commentList">
							<%
							for(ItemCommentDO itemcomt:commentlist){
							%>
								<li style="padding: 10px;">
									<div class="commenterImage">
										<img src="images/person.jpeg" style="height:45px;"/>
										<span><%=itemcomt.getMember_name()%></span>
									</div>
									<div class="commentText">
										<p class=""><%=itemcomt.getComment_info()%> </p>
										<span class="date sub-text"><%=itemcomt.getComment_date()%></span>
									</div>
								</li>
								<% 
								}
								%>

							</ul>
							<br>
							
							<form class="form-inline" role="form">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="Your comments" />
								</div>
								<div class="form-group">
									<button class="btn btn-default">Add</button>
								</div>
							</form>
							<div class="row no-gutters mt-5">
							<div class="col-12">
								<h2 class="h4 text-black mb-3">Gallery</h2>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1001_1.png" class="image-popup gal-item"><img
									src="images/1001_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="ima	ges/1002_1.png" class="image-popup gal-item"><img
									src="images/1002_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1003_1.png" class="image-popup gal-item"><img
									src="images/1003_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1004_1.png" class="image-popup gal-item"><img
									src="images/1004_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1005_1.png" class="image-popup gal-item"><img
									src="images/1005_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1006_1.png" class="image-popup gal-item"><img
									src="images/1006_1.png" alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href="images/1007_1.png" class="image-popup gal-item"><img
									src="images/1007_1.png" alt="Image" class="img-fluid"></a>
							</div>
						
						</div>
						
						</div>
					</div>
				</div>
				<div class="col-lg-4">

					<div class="bg-white widget border rounded">

						<h3 class="h4 text-black widget-title mb-3">Contact Agent</h3>
						<form action="" class="form-contact-agent">
							<div class="form-group">
								<label for="name">Name</label>
								<div class="input-append date form_datetime1"
									data-date="2019-02-21T15:25:00Z">

									<input size="20" type="text" value="" readonly
										style="width: 80%;"> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-calendar"></i></span>
								</div>

								<script type="text/javascript">
								$(".form_datetime1").datetimepicker({
									format : "yyyy-mm-dd - hh:ii",
									autoclose : true,
									todayBtn : true,
									startDate : "2013-02-14 10:00",
									minuteStep : 30
								});
							</script>
							</div>
							<div class="form-group">
								<label for="email">Email</label> <label for="offer-types">Offer
									Type</label>

								<div class="input-append date form_datetime2"
									data-date="2019-02-21T15:25:00Z">

									<input size="20" type="text" value="" readonly
										style="width: 80%;"> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-calendar"></i></span>
								</div>

								<script type="text/javascript">
								$(".form_datetime2").datetimepicker({
									format : "yyyy-mm-dd - hh:ii",
									autoclose : true,
									todayBtn : true,
									startDate : "2013-02-14 10:00",
									minuteStep : 30
								});
							</script>

							</div>
							<div class="form-group">
								<label for="phone">Phone</label> <input type="text" id="phone"
									class="form-control">
							</div>
							<div class="form-group">
								<input type="submit" id="phone" class="btn btn-primary"
									value="Send Message">
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div class="site-section site-section-sm">

		<%@include file="../include/footer.jsp"%>

	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>
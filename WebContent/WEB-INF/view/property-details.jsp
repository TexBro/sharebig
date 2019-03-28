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
<style type="text/css">
.commentBox {
	padding: 10px;
	border-top: 1px dotted #bbb;
}

.commentBox .form-group:first-child, .actionBox .form-group:first-child
	{
	width: 80%;
}

.commentBox .form-group:nth-child(2), .actionBox .form-group:nth-child(2)
	{
	width: 18%;
}

.actionBox .form-group * {
	width: 100%;
}

.taskDescription {
	margin-top: 10px 0;
}

.commentList {
	padding: 0;
	list-style: none;
	/*overflow:auto;*/
}

.commentList li {
	margin: 0;
	margin-top: 10px;
}

.commentList li>div {
	display: table-cell;
}

.commenterImage {
	width: 30px;
	margin-right: 5px;
	height: 100%;
	float: left;
}

.commenterImage img {
	width: 100%;
	border-radius: 50%;
}

.commentText p {
	margin: 0;
}

.sub-text {
	color: #aaa;
	font-family: verdana;
	font-size: 11px;
}

.actionBox {
	border-top: 1px dotted #bbb;
	padding: 10px;
}
</style>
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
							<img src='<%="images/"+itemDO.getItem_file()%>'
								class="property-main-picture">
						</div>
						<h1><%=itemDO.getItem_name()%></h1>

						<div class="row mb-5">
							<div class="col-md-6">
								<strong class="text-success h1 mb-3"><%=itemDO.getPrice()%> 원</strong>
							</div>
						</div>
						<div class="row mb-5">
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text"></span>
								<strong class="d-block">대여</strong>
							</div>
							<div
								class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
								<span class="d-inline-block text-black mb-0 caption-text">제조일</span>
								<strong class="d-block">2018</strong>
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




						<br>


						<div class="row no-gutters mt-5">
							<div class="col-12">
								<h2 class="h4 text-black mb-3">Gallery</h2>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-3">
								<a href='<%="images/"+itemDO.getItem_file()%>'
									class="image-popup gal-item"><img
									src='<%="images/"+itemDO.getItem_file()%>' class="img-fluid"></a>
							</div>

						</div>
						<div class="detailBox">
							<div class="titleBox">
								<h2 class="h4 text-black mb-3" style="margin-top: 30px;"><label>Comment Box</label></h2>
							</div>
							<div class="actionBox">
								<ul class="commentList">
									<%
								for(ItemCommentDO itemcomt:commentlist){
								%>
									<li>
										<div class="commenterImage">
											<img src="http://placekitten.com/50/50" />
										</div>
										<span><%=itemcomt.getMember_name()%></span>
										<div class="commentText">
											<p class=""><%=itemcomt.getComment_info()%></p>
											<span class="date sub-text"><%=itemcomt.getComment_date()%></span>

										</div>
									</li>
									<%
									}
									%>
								</ul>
								<form class="form-inline" role="form">
									<div class="form-group">
										<input class="form-control" type="text"
											placeholder="Your comments" />
									</div>
									<div class="form-group">
										<button class="btn btn-default">Add</button>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			
			<div class="col-lg-4">

				<div class="bg-white widget border rounded">

					<h3 class="h3 text-black widget-title mb-3">물품 대여/구매 하기</h3>
					<form action="main_controller.jsp" method="POST" class="form-contact-agent">
						<div class="form-group">
							<label for="name">대여 시작일</label>
							<div class="input-append date form_datetime1"
								data-date="2019-02-21T15:25:00Z">

								<input name="start_date" size="20" type="text" value="" readonly
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
							<label for="email">반납일</label>

							<div class="input-append date form_datetime2"
								data-date="2019-02-21T15:25:00Z">

								<input name="end_date" size="20" type="text" value="" readonly
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
							<label for="phone">전화번호 </label> <input type="text" id="phone"
								class="form-control">
						</div>
						<div class="form-group">
							<input type="hidden" name="itemid" value="<%=itemDO.getItem_no()%>">
							<input type="hidden" name="command" value="takeitem">
							<input type="submit" id="phone" class="btn btn-primary"value="Send Message">
						</div>
					</form>
				</div>
				
				<div class="bg-white widget border rounded">
						<h3 class="h4 text-black widget-title mb-3">예약 내역</h3>
						<p>~~~~</p>
						<p>~~~~</p>
						<p>~~~~</p>
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
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
	ArrayList<ItemDO> salelist = (ArrayList<ItemDO>)session.getAttribute("salelist");
	ArrayList<ItemDO> sharelist = (ArrayList<ItemDO>)session.getAttribute("sharelist");
	ArrayList<ItemDO> interestlist = (ArrayList<ItemDO>)session.getAttribute("interestlist");
	   
		MemberDO user = (MemberDO)session.getAttribute("member"); 
	%>
	<div class="mysite-section" style="margin: 30px; text-align: -webkit-center;">
		<div class="col-md-10 row">
			<div class="col-md-3 "
				style="height: 250px; background-color: green; padding: 20px;">
				<div class="mypage-name">
					<h1><%=user.getMember_name() %></h1>
					<p>ID : <%=session.getAttribute("id") %> </p>
					<p>이메일 : <%=user.getEmail()%></p>
					<p>전화번호 : <%=user.getHp()%></p>
					<p>부서 : <%=user.getDept_name()%> </p>
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
							<h2 class="service-heading">판매 등록 상품</h2>
							<p></p>
							<h2><%= salelist.size() %></h2>
							<p></p>
						</a>
					</div>
					<div class="col-md-6 col-lg-4">
						<a href="#" class="service text-center"> <span
							class="icon flaticon-sold"></span>
							<h2 class="service-heading">대여 등록 상품</h2>
							<p></p>
							<h2><%= sharelist.size() %></h2>
							<p></p>
						</a>
					</div>
					<div class="col-md-6 col-lg-4">
						<a href="#" class="service text-center"> <span
							class="icon flaticon-camera"></span>
							<h2 class="service-heading">찜한 상품</h2>
							<p></p>
							<h2><%= interestlist.size() %></h2>
							<p></p>
						</a>
					</div>
				</div>

			</div>
		</div>
	</div>

<div class="site-section site-section-sm bg-light">
	<div class="container">
		<div class="row mb-4"
			style="display: contents; text-align: -webkit-center; margin-top: 24px;">
			<div style="">
				<h3 style="text-align: c; background: #80808057;">등록한 상품</h3>
			</div>
		</div>
<% 
	
	for(ItemDO itemDO : salelist){
%>
			<div class="row mb-4">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">
						<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">판매</span>
							</div> 
							<img src='<%="images/"+itemDO.getItem_file()%>' alt="Image" class="img-fluid">
						</a>
						<div class="property-body">
							<a href="main_controller.jsp?command=favorite&itemid=<%=itemDO.getItem_no()%>" class="property-favorite"> 
							<span class="icon-heart-o"></span>
							</a>
							<h2 class="property-title">
								<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>"><%= itemDO.getItem_name()%></a>
							</h2>
							<span class="property-location d-block mb-3"> 
								<span class="property-icon icon-room">
								</span>
							 	본사
							</span> 
							<strong class="property-price text-primary mb-3 d-block text-success"><%=itemDO.getPrice()%> 원</strong>
							<%--  <p><%= itemDO.getItem_info() %>--%>
							<ul class="property-specs-wrap mb-3 mb-lg-0">
								<li>
								<span class="property-specs">카테고리</span> 
								<span class="property-specs-number"><%=itemDO.getCata_name()%></span>
								</li>
								<li>
								<span class="property-specs">판매일</span>
								<span class="property-specs-number"><%=itemDO.getSale_date()%></span>
								</li>
								<li>
								<span class="property-specs"></span> 
								<span class="property-specs-number"></span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<%
		}
	%>

		<div class="row mb-4"
			style="display: contents; text-align: -webkit-center; margin-top: 24px;">
			<div style="">
				<h3 style="text-align: c; background: #80808057;">대여중인 상품</h3>
			</div>
		</div>
	
	<% 
	
		for(ItemDO itemDO : sharelist){
			%>
				<div class="row mb-4">
					<div class="col-md-12">
						<div class="property-entry horizontal d-lg-flex">
							<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>" class="property-thumbnail">
								<div class="offer-type-wrap">
									<span class="offer-type bg-success">대여</span>
								</div> 
								<img src='<%="images/"+itemDO.getItem_file()%>' alt="Image" class="img-fluid">
							</a>
							<div class="property-body">
								<a href="#" class="property-favorite"> 
								<span class="icon-heart-o"></span>
								</a>
								<h2 class="property-title">
									<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>"><%= itemDO.getItem_name()%></a>
								</h2>
								<span class="property-location d-block mb-3"> 
									<span class="property-icon icon-room">
									</span>
								 	본사
								</span> 
								<strong class="property-price text-primary mb-3 d-block text-success"><%=itemDO.getPrice()%> 원</strong>
								<%--  <p><%= itemDO.getItem_info() %>--%>
								<ul class="property-specs-wrap mb-3 mb-lg-0">
									<li>
									<span class="property-specs">카테고리</span> 
									<span class="property-specs-number"><%=itemDO.getCata_name()%></span>
									</li>
									<li>
									<span class="property-specs">대여 종료일</span>
									<span class="property-specs-number"><%=itemDO.getShare_final_date() %></span>
									</li>
									<li>
									<span class="property-specs"></span> 
									<span class="property-specs-number"></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			<%
		}
	%>
			<div class="row mb-4"
			style="display: contents; text-align: -webkit-center; margin-top: 24px;">
			<div style="">
				<h3 style="text-align: c; background: #80808057;">찜한 상품</h3>
			</div>
		</div>
	
	<% 
	
	for(ItemDO itemDO : interestlist){
		%>
			<div class="row mb-4">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">
						<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-success">대여</span>
							</div> 
							<img src='<%="images/"+itemDO.getItem_file()%>' alt="Image" class="img-fluid">
						</a>
						<div class="property-body">
							<a href="main_controller.jsp?command=favorite&itemid=<%=itemDO.getItem_no()%>" class="property-favorite active"> 
							<span class="icon-heart-o"></span>
							</a>
							<h2 class="property-title">
								<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>"><%= itemDO.getItem_name()%></a>
							</h2>
							<span class="property-location d-block mb-3"> 
								<span class="property-icon icon-room">
								</span>
							 	본사
							</span> 
							<strong class="property-price text-primary mb-3 d-block text-success"><%=itemDO.getPrice()%> 원</strong>
							<%--  <p><%= itemDO.getItem_info() %>--%>
							<ul class="property-specs-wrap mb-3 mb-lg-0">
								<li>
								<span class="property-specs">카테고리</span> 
								<span class="property-specs-number"><%=itemDO.getCata_name()%></span>
								</li>	
								<li>
								<span class="property-specs"></span>
								<span class="property-specs-number"></span>
								</li>
								<li>
								<span class="property-specs"></span> 
								<span class="property-specs-number"></span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		<%
	}
	%>
	</div>
</div>
	
</body>
</html>
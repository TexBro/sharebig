<%@page import="model.dataObject.ItemDO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<div class="site-section site-section-sm bg-light">
	<div class="container">
	
	<%

	for(ItemDO itemDO : itemlist){
		if(itemDO.getRegister_type()==1){
		%>
			<div class="row mb-4">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">
						<a href="property-details.html" class="property-thumbnail">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">판매</span>
							</div> 
							<img src='<%="images/"+itemDO.getItem_file()%>' alt="Image" class="img-fluid">
						</a>
						<div class="property-body">
							<a href="#" class="property-favorite"> 
							<span class="icon-heart-o"></span>
							</a>
							<h2 class="property-title">
								<a href="#"><%= itemDO.getItem_name()%></a>
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
								<span class="property-specs-number"><%=itemDO.getSale_date() %></span>
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
		else if(itemDO.getRegister_type()==2){
			%>
				<div class="row mb-4">
					<div class="col-md-12">
						<div class="property-entry horizontal d-lg-flex">
							<a href="property-details.html" class="property-thumbnail">
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
									<a href="#"><%= itemDO.getItem_name()%></a>
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
		}
		%>
		<%-- <div class="row mb-4">
			<div class="col-md-12">
				<div class="property-entry horizontal d-lg-flex">

					<a href="#" class="property-thumbnail h-100">
						<div class="offer-type-wrap">
							<span class="offer-type bg-danger">Sale</span> <span
								class="offer-type bg-success">Rent</span>
						</div> <img src="images/1001_1.png" alt="Image" class="img-fluid">
					</a>

					<div class="  property-body">
						<a href="#" class="property-favorite active"><span
							class="icon-heart-o"></span></a>
						<h2 class="property-title">
							<a href="#">853 S Lucerne Blvd</a>
						</h2>
						<span class="property-location d-block mb-3"><span
							class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit
							101 Los Angeles, CA 90005</span> <strong
							class="property-price text-primary mb-3 d-block text-success">265,500원</strong>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Autem dolorem tenetur magni. Aspernatur odit rem repudiandae
							cumque tenetur enim consequuntur esse.</p>
						<ul class="property-specs-wrap mb-3 mb-lg-0">
							<li><span class="property-specs">Beds</span> <span
								class="property-specs-number">2 <sup>+</sup></span></li>
							<li><span class="property-specs">Baths</span> <span
								class="property-specs-number">2</span></li>
							<li><span class="property-specs">SQ FT</span> <span
								class="property-specs-number">5,500</span></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-md-12">
				<div class="property-entry horizontal d-lg-flex">

					<a href="#" class="property-thumbnail h-100">
						<div class="offer-type-wrap">
							<span class="offer-type bg-danger">Sale</span> <span
								class="offer-type bg-success">Rent</span>
						</div> <img src="images/img_4.jpg" alt="Image" class="img-fluid">
					</a>

					<div class="  property-body">
						<a href="#" class="property-favorite"><span
							class="icon-heart-o"></span></a>
						<h2 class="property-title">
							<a href="#">853 S Lucerne Blvd</a>
						</h2>
						<span class="property-location d-block mb-3"><span
							class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit
							101 Los Angeles, CA 90005</span> <strong
							class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
						<p>Lorem ipsum dolor sit amet co	nsectetur adipisicing elit.
							Autem dolorem tenetur magni. Aspernatur odit rem repudiandae
							cumque tenetur enim consequuntur esse.</p>
						<ul class="property-specs-wrap mb-3 mb-lg-0">
							<li><span class="property-specs">Beds</span> <span
								class="property-specs-number">2 <sup>+</sup></span></li>
							<li><span class="property-specs">Baths</span> <span
								class="property-specs-number">2</span></li>
							<li><span class="property-specs">SQ FT</span> <span
								class="property-specs-number">5,500</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-md-12">
				<div class="property-entry horizontal d-lg-flex">

					<a href="#" class="property-thumbnail h-100">
						<div class="offer-type-wrap">
							<span class="offer-type bg-danger">Sale</span> <span
								class="offer-type bg-success">Rent</span>
						</div> <img src="images/img_5.jpg" alt="Image" class="img-fluid">
					</a>

					<div class="  property-body">
						<a href="#" class="property-favorite"><span
							class="icon-heart-o"></span></a>
						<h2 class="property-title">
							<a href="#">853 S Lucerne Blvd</a>
						</h2>
						<span class="property-location d-block mb-3"><span
							class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit
							101 Los Angeles, CA 90005</span> <strong
							class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Autem dolorem tenetur magni. Aspernatur odit rem repudiandae
							cumque tenetur enim consequuntur esse.</p>
						<ul class="property-specs-wrap mb-3 mb-lg-0">
							<li><span class="property-specs">Beds</span> <span
								class="property-specs-number">2 <sup>+</sup></span></li>
							<li><span class="property-specs">Baths</span> <span
								class="property-specs-number">2</span></li>
							<li><span class="property-specs">SQ FT</span> <span
								class="property-specs-number">5,500</span></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="property-entry horizontal d-lg-flex">

					<a href="#" class="property-thumbnail h-100">
						<div class="offer-type-wrap">
							<span class="offer-type bg-info">Lease</span>
						</div> <img src="images/img_1.jpg" alt="Image" class="img-fluid">
					</a>

					<div class="  property-body">
						<a href="#" class="property-favorite"><span
							class="icon-heart-o"></span></a>
						<h2 class="property-title">
							<a href="#">853 S Lucerne Blvd</a>
						</h2>
						<span class="property-location d-block mb-3"><span
							class="property-icon icon-room"></span> 853 S Lucerne Blvd Unit
							101 Los Angeles, CA 90005</span> <strong
							class="property-price text-primary mb-3 d-block text-success">$2,265,500</strong>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Autem dolorem tenetur magni. Aspernatur odit rem repudiandae
							cumque tenetur enim consequuntur esse.</p>
						<ul class="property-specs-wrap mb-3 mb-lg-0">
							<li><span class="property-specs">Beds</span> <span
								class="property-specs-number">2 <sup>+</sup></span></li>
							<li><span class="property-specs">Baths</span> <span
								class="property-specs-number">2</span></li>
							<li><span class="property-specs">SQ FT</span> <span
								class="property-specs-number">5,500</span></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		--%>
	</div>
</div>

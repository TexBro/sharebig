<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ include file="menubar.jsp" %>
	<div class="site-loader"></div>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->

		<div class="site-navbar mt-4">
			<div class="container py-1">
				<div class="row align-items-center">
					<div class="col-8 col-md-8 col-lg-4">
						<h1 class="mb-0">
							<a href="index.html" class="text-black h2 mb-0"><strong>Homeland<span
									class="text-danger">.</span></strong></a>
						</h1>
					</div>
					<div class="col-4 col-md-4 col-lg-8">
						<nav class="site-navigation text-right text-md-right"
							role="navigation">

							<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
								<a href="#" class="site-menu-toggle js-menu-toggle"> <span
									class="icon-menu h3"> </span>
								</a>
							</div>

							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="active"><a href="index.html">Home</a></li>
								<li><a href="buy.html">Buy</a></li>
								<li><a href="rent.html">Rent</a></li>
								<li class="has-children"><a href="properties.html">Properties</a>
									<ul class="dropdown arrow-top">
										<li><a href="#">Condo</a></li>
										<li><a href="#">Property Land</a></li>
										<li><a href="#">Commercial Building</a></li>
										<li class="has-children"><a href="#">Sub Menu</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
											</ul></li>
									</ul></li>
								<li><a href="blog.html">Blog</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <div class="site-section">
    
    
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 text-center"><br>
          	
            <div class="site-section-title">
              <h2>My page</h2>
            </div><br>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-4">
            <a href="#" class="service text-center">
              <span class="icon flaticon-house"></span>
              <h2 class="service-heading">Research Subburbs</h2>
              <p><h2>1</h2></p>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a href="#" class="service text-center">
              <span class="icon flaticon-sold"></span>
              <h2 class="service-heading">Sold Houses</h2>
              <p><h2>1</h2></p>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
					<a href="#" class="service text-center"> <span
						class="icon flaticon-camera"></span>
						<h2 class="service-heading">Security Priority</h2>
						<p><h2>1</h2></p>

					</a>
				</div>
        </div>
      </div>
    </div>
	 
	<div class="sidenav">
		<div class="mypage-name">
			<h1>
				OOO 님
			</h1>
			<p>Login or register from here to access.</p>
		</div>
	</div>
	


		<div class="site-section site-section-sm bg-light">
		<div align ="center" class="container">


			<div class="row mb-4 mypage-row">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">
						<a href="property-details.html" class="property-thumbnail h-100">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_2.jpg" alt="Image" class="img-fluid">
						</a>
						<div class="p-4 property-body">
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

			<div class="row mb-4 mypage-row">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">

						<a href="#" class="property-thumbnail h-100">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_3.jpg" alt="Image" class="img-fluid">
						</a>

						<div class="p-4 property-body">
							<a href="#" class="property-favorite active"><span
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

			<div class="row mb-4 mypage-row">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">

						<a href="#" class="property-thumbnail h-100">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_4.jpg" alt="Image" class="img-fluid">
						</a>

						<div class="p-4 property-body">
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

			<div class="row mb-4 mypage-row">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">

						<a href="#" class="property-thumbnail h-100">
							<div class="offer-type-wrap">
								<span class="offer-type bg-danger">Sale</span> <span
									class="offer-type bg-success">Rent</span>
							</div> <img src="images/img_5.jpg" alt="Image" class="img-fluid">
						</a>

						<div class="p-4 property-body">
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

			<div class="row mb-4 mypage-row">
				<div class="col-md-12">
					<div class="property-entry horizontal d-lg-flex">

						<a href="#" class="property-thumbnail h-100">
							<div class="offer-type-wrap">
								<span class="offer-type bg-info">Lease</span>
							</div> <img src="images/img_1.jpg" alt="Image" class="img-fluid">
						</a>

						<div class="p-4 property-body">
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


			<div class="row mt-5">
				<div class="col-md-12 text-center">
					<div class="site-pagination">
						<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
						<a href="#">4</a> <a href="#">5</a> <span>...</span> <a href="#">10</a>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>
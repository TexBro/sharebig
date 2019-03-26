<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="col-10 col-md-10 col-lg-6">
					<img alt="" src="images/dbinc_ci.png" style="float: left;">
					<h1>
						<a href="main_controller.jsp" class="text-black h2 mb-0"
							style="float: left; padding-top: 35px; padding-left: 10px;"><strong>ShareBig<span
								class="text-danger">.</span></strong></a>
					</h1>

				</div>
				<div class="col-2 col-md-2 col-lg-6">
					<nav class="site-navigation text-right text-md-right"
						role="navigation">

						<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
							<a href="main_controller.jsp?command=list" class="site-menu-t	oggle js-menu-toggle"><span
								class="icon-menu h3"></span></a>
						</div>

						<ul class="site-menu js-clone-nav d-none d-lg-block">
							<li><a href="main_controller.jsp?command=sell">구매</a></li>
							<li><a href="main_controller.jsp?command=rent">대여</a></li>
							<li class="has-children"><a href="main_controller.jsp?command=rent">카테고리</a>
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
								
							<li><a href="main_controller.jsp?command=regist">물품등록</a></li>
							<li><a href="main_controller.jsp?command=mypage">My Page</a></li>
							<li><a href="main_controller.jsp?command=logout" style="padding: 0px;">
									<img src="images/logout.png" style="height: 25px; ">
								</a>
							</li>
							
						</ul>
					</nav>
				</div>


			</div>
		</div>
	</div>
</div>

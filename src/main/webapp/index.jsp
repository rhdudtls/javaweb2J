<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>티켓 체인지:Ticket Change</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <jsp:include page="/include/bs4.jsp" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<style>
		@font-face {
		    font-family: 'KCC-Ganpan';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'KyoboHandwriting2021sjy';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KyoboHandwriting2021sjy.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'SUITE-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
		    font-weight: 400;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'TheJamsil5Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
		    font-weight: 400;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'KorailRoundGothicBold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
		
		
		/* Typography */
		body, ul, li, p, a, label, input, div {
		  font-family: 'KyoboHandwriting2021sjy', sans-serif;
		  font-size: 18px;
		  font-weight: 300;
		}
		.h1 {
		  font-family: 'KCC-Ganpan', sans-serif;
		  color:#ff9966;
		  font-size: 48px;
		  font-weight: 200;
		}
		.h1_1 {
		  font-family: 'KCC-Ganpan', sans-serif;
		  color:#ff9966;
		  font-size: 46px;
		  font-weight: 200;
		}
		.h1_2 {
		  font-family: 'KCC-Ganpan', sans-serif;
		  color:#ff9966;
		  font-size:38px; 
		  font-weight: 200; 
		}
		.h2 {
		  font-family: 'KyoboHandwriting2021sjy', sans-serif;
		  font-size: 30px;
		  font-weight: 300;
		}
		.h2_1 {
		  font-family: 'KyoboHandwriting2021sjy', sans-serif;
		  font-size: 25px;
		  font-weight: 300;
		}
		.h3 {
		  font-family: 'KyoboHandwriting2021sjy', sans-serif;
		  font-size: 22px;
		}
		.banner_content {
			font-family: 'SUITE-Regular';
		}
		.this_month *{
			font-family: 'SUITE-Regular';
		}
		#tempaltemo_footer .foot_title {
			font-family: 'SUITE-Regular';
			color: #FFABAB;
		}
		#tempaltemo_footer a {
			font-family: 'SUITE-Regular';
		}
		#tempaltemo_footer span {
			font-family: 'SUITE-Regular';
		}
		#tempaltemo_footer h2 {
			font-family: 'SUITE-Regular';
		}
		hr {
			width:80%;
			margin-left : auto;
			margin-right : auto;
		}
		
		/* General */
		.logo { font-weight: 500 }
		.text-warning {  color: #ede861 }
		.text-muted { color: #bcbcbc }
		.text-success { color: #59ab6e }
		.text-light { color: #cfd6e1 }
		.bg-dark { background-color: #212934 }
		.bg-light { background-color: #e9eef5 !important}
		.bg-black { background-color: #1d242d }
		.bg-success { background-color: #59ab6e}
		.btn-success {
		  background-color: #59ab6e;
		  border-color: #56ae6c
		}
		.pagination .page-link:hover {color: #000;}
		.pagination .page-link:hover, .pagination .page-link.active {
		  background-color: #69bb7e;
		  color: #fff;
		}
		/* Nav */
		#templatemo_nav_top { min-height: 40px; background-color:#FFABAB;}
		#templatemo_nav_top * {font-size: 15px}
		#templatemo_nav_top a {font-family: 'SUITE-Regular';}
		#templatemo_nav_top span {font-family: 'SUITE-Regular';}
		#templatemo_main_nav a {font-family: 'KorailRoundGothicBold'; color: #212934;}
		#templatemo_main_nav a:hover { color: #FFABAB;}
		#templatemo_main_nav .navbar .nav-icon { margin-right: 20px;}
		
		
		/* header_home 아이콘 색 지정 */
		#login_icon{color: #FEBE8C;}
		#join_icon{color: #a5de9f;}
		#logout_icon{color: #A6D0DD;}
		#mypage_icon{color: #FFE194;}
		#search_icon{color: #E7A4E4;}
		
		/* Hero Carousel */
		#template-mo-zay-hero-carousel { background-color: #ebebeb !important}
		/* Accordion */
		.templatemo-accordion a { color: #000;}
		.templatemo-accordion a:hover { color: #333d4a;}
		/* Shop */
		.shop-top-menu a:hover { color: #69bb7e}
		/* Product */
		.product-wap { box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.10);}
		.product-wap .product-color-dot.color-dot-red { background:#f71515;}
		.product-wap .product-color-dot.color-dot-blue { background:#6db4fe;}
		.product-wap .product-color-dot.color-dot-black { background:#000000;}
		.product-wap .product-color-dot.color-dot-light { background:#e0e0e0;}
		.product-wap .product-color-dot.color-dot-green { background:#0bff7e;}
		.card.product-wap .card .product-overlay {
		  background: rgba(0,0,0,.2);
		  visibility: hidden;
		  opacity: 0;
		  transition: .3s;
		}
		.card.product-wap:hover .card .product-overlay {
		  visibility: visible;
		  opacity: 1;
		}
		
		.card:hover{
		  transform: scale(1.05);
		  box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
		}
		.card.product-wap a { color: #000;}
		#carousel-related-product .slick-slide:focus { outline: none}
		#carousel-related-product .slick-dots li button:before {
		  font-size: 15px;
		  margin-top: 20px;
		}
		/* Brand */
		.brand-img {
		  filter: grayscale(100%);
		  opacity: 0.5;
		  transition: .5s;
		}
		.brand-img:hover {
		  filter: grayscale(0%);
		  opacity: 1;
		}
		/* Carousel Hero */
		#template-mo-zay-hero-carousel .carousel-indicators li {
		  margin-top: -30px;
		  background-color: #ff9966;
		}
		#template-mo-zay-hero-carousel .carousel-control-next i,
		#template-mo-zay-hero-carousel .carousel-control-prev i {
		  color: #ff9966;
		  font-size: 2.8em 
		}
		/* Carousel Brand */
		.tempaltemo-carousel .h1 {
		  font-size: .5em;
		  color: #000
		  }
		/* Services */
		.services-icon-wap {transition: .3s;}
		.services-icon-wap:hover, .services-icon-wap:hover i {color: #fff;}
		.services-icon-wap:hover {background: #F7E1AE;}
		/* Contact map */
		.leaflet-control a, .leaflet-control { font-size: 10px}
		.form-control { border: 1px solid #e8e8e8;}
		/* Footer */
		#tempaltemo_footer a { color: #dcdde1;}
		#tempaltemo_footer a:hover { color: #FFABAB;}
		#tempaltemo_footer p {text-align:right;}
		#tempaltemo_footer ul.footer-link-list li { padding-top: 10px;}
		#tempaltemo_footer ul.footer-icons li {
		  width: 2.6em;
		  height: 2.6em;
		  line-height: 2.6em;
		}
		#tempaltemo_footer ul.footer-icons li:hover {
		  background-color: #cfd6e1;
		  transition: .5s;
		}
		#tempaltemo_footer ul.footer-icons li:hover i {
		  color: #212934;
		  transition: .5s;
		}
		#tempaltemo_footer .border-light { border-color: #2d343f}
		/*
		// Extra small devices (portrait phones, less than 576px)
		// No media query since this is the default in Bootstrap
		*/
		/* Small devices (landscape phones, 576px and up)*/
		.product-wap .h3, .product-wap li, .product-wap i, .product-wap p {
		  font-size: 12px;
		}
		.product-wap .product-color-dot {
		  width: 6px;
		  height: 6px;
		}
		
		.make_center {
			margin-left:50px;
			margin-right:50px;
		}
		.make_center i{
			color:#E08E6D;
		}
		
		@media (min-width: 576px) {
		  .tempaltemo-carousel .h1 { font-size: 1em}
		}
		
		/*// Medium devices (tablets, 768px and up)*/
		@media (min-width: 768px) {
		  #templatemo_main_nav .navbar-nav {max-width: 450px;}
		 }
		
		/* Large devices (desktops, 992px and up)*/
		@media (min-width: 992px) {
		  #templatemo_main_nav .navbar-nav {max-width: 550px;}
		  #template-mo-zay-hero-carousel .carousel-item {min-height: 30rem;}
		  .product-wap .h3, .product-wap li, .product-wap i, .product-wap p {font-size: 18px}
		  .product-wap .product-color-dot {
		    width: 12px;
		    height: 12px;
		  }
		}
		
		/* Extra large devices (large desktops, 1200px and up)*/
		@media (min-width: 1200px) {}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img class="img-fluid" src="./assets/img/nabi.png">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left align-self-center">
                            <h1 class="h1">뮤지컬&nbsp; '나는 나비'</h1>
                            <h3 class="h2">세상에 모든 나비들에게</h3>
                            <h3 class="h2">청소년뮤지컬 공연의 새로운 패러다임을 쓰다</h3>
                            <br/>
                            <p class="banner_content">
                            	청소년들의 갈등과 현실을 담아낸 무대로 왕따를 당한 동훈과 그의 친구였던 나비가 겪는 일들을 그려낸 작품<br/>
                            	오직 5.13 ~ 5.20 성북문화재단 꿈빛극장에서 만나요!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img src="./assets/img/Gju.jpg" width="450px" height="487px">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1_1">연극 '나는 광주에 없었다'</h1>
                            <h3 class="h2">나는 광주에 없었습니다.<br/>하지만 80년 5월의 광주를 기억하겠습니다.</h3>
                            <br/>
                            <p class="banner_content">
                            	5·18 민주화 운동을 그대로 전달하고, 관객들 스스로가 작품을 느끼고 몸소 체험할 수 있는 관객 참여형 공연<br/>
                            	우리 모두가 결코 잊지 말아야 하는 그 날을 기억하며, 역사의 현장 속으로 당신을 초대합니다!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container">
                <div class="row p-5">
                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                        <img src="./assets/img/tt_concert.gif" width="450px" height="487px">
                    </div>
                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                        <div class="text-align-left">
                            <h1 class="h1_2">콘서트 'TOMORROW X TOGETHER WORLD TOUR'</h1>
                            <h3 class="h2">〈ACT : SWEET MIRAGE〉 IN SEOUL</h3>
                            <br/>
                            <p class="banner_content">
                            	빅히트 뮤직 소속의 5인조 보이그룹 투모로우바이투게더의 2023 월드투어! 서울에서 시작합니다!<br/>
                            	공연 일시 : 3.25 ~ 3.26<br/>티켓오픈일정 : 3.15 20:00<br/>팬클럽 선예매 : 3.17 20:00    
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>
<!-- End Banner Hero -->
<!-- Start Categories of The Month -->
<section class="container py-5">
    <div class="row text-center pt-3">
        <div class="col-lg-6 m-auto">
            <h1>이달의 콘텐츠</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-12 col-md-4 p-5 mt-3 this_month">
            <a href="#"><img src="./assets/img/month_1.jpg" class="border" height="320px"></a>
            <h5 class="text-left mt-3 mb-3">청춘기록&nbsp;&nbsp;<span class="badge badge-secondary">공연중</span></h5>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=뮤지컬">뮤지컬 목록</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 mt-3 this_month">
            <a href="#"><img src="./assets/img/month_2.jpg" class="border" height="320px"></a>
            <h2 class="h5 text-left mt-3 mb-3">추남,미녀&nbsp;&nbsp;<span class="badge badge-secondary">공연예정</span></h2>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=연극">연극 목록</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 mt-3 this_month">
            <a href="#"><img src="./assets/img/month_3.jpg" class="border" width="250px" height="320px"></a>
            <h2 class="h5 text-left mt-3 mb-3">The entry to Jazz&nbsp;&nbsp;<span class="badge badge-secondary">공연중</span></h2>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=콘서트">콘서트 목록</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 this_month">
            <a href="#"><img src="./assets/img/month_4.jpg" class="border" height="320px"></a>
            <h2 class="h5 text-left mt-3 mb-3">필리프 헤레베허 ＆ 샹젤리제 오케스트라&nbsp;&nbsp;<span class="badge badge-secondary">공연중</span></h2>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=클래식">클래식 목록</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 this_month">
            <a href="#"><img src="./assets/img/month_5.jpg" class="border" height="320px"></a>
            <h2 class="h5 text-left mt-3 mb-3">만복이네 떡집&nbsp;&nbsp;<span class="badge badge-secondary">공연예정</span></h2>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=가족/아동">가족/아동 목록</a></p>
        </div>
        <div class="col-12 col-md-4 p-5 this_month">
            <a href="#"><img src="./assets/img/month_6.jpg" class="border" height="320px"></a>
            <h2 class="h5 text-left mt-3 mb-3">대구국제음악제&nbsp;&nbsp;<span class="badge badge-secondary">공연중</span></h2>
            <p class="text-left"><a class="btn btn-info" href="${ctp}/ContentList.co?kind=기타">기타 목록</a></p>
        </div>
    </div>
</section>
<!-- End Categories of The Month -->
<!-- Start Featured Product -->
<section class="bg-light">
    <div class="container py-5">
        <div class="row text-center py-3">
            <div class="col-lg-6 m-auto">
                <h1>우리 티켓 교환해요🙋‍♂️</h1>
                <p class="banner_content">
                    티켓 정보를 올리고 원하는 자리로 서로 교환하세요!<br/>
                    교환은 현장 직거래를 추천👍 판매 행위는 금지🚫
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="#">
                        <img src="./assets/img/month_1.jpg" class="card-img-top" height="280px">
                    </a>
                    <div class="card-body this_month">
                        <a href="#" class="h2 text-decoration-none text-dark">청춘기록</a>
                        <p class="card-text mt-3">
                            공연 날짜 : 2023.05.30<br/>
                            공연 시간 : 16:00<br/>
                            예매 인원 : 2명<br/>
                            예매한 자리 : C구역 10번, 11번<br/>
                            원하는 자리 : B구역, A구역 6~10번<br/>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="#">
                        <img src="./assets/img/tc_2.jpg" class="card-img-top" height="280px">
                    </a>
                    <div class="card-body this_month">
                        <a href="#" class="h2_1 text-decoration-none text-dark">양요섭 솔로 콘서트 〈BITTER SWEET〉</a>
                        <p class="card-text mt-3">
                        	공연 날짜 : 2023.06.10<br/>
                            공연 시간 : 18:00<br/>
                            예매 인원 : 1명<br/>
                            예매한 자리 : 6구역 2번<br/>
                            원하는 자리 : 5구역, 8구역<br/>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="#">
                        <img src="./assets/img/tc_3.jpg" class="card-img-top" height="280px">
                    </a>
                    <div class="card-body this_month">
                        <a href="#" class="h2 text-decoration-none text-dark">히스토리 보이즈</a>
                        <p class="card-text mt-3">
                        	공연 날짜 : 2023.07.06<br/>
                            공연 시간 : 19:30<br/>
                            예매 인원 : 2명<br/>
                            예매한 자리 : B구역 B2 4번,5번<br/>
                            원하는 자리 : B구역 B9 번호무관<br/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- End Featured Product -->
<jsp:include page="/include/footer.jsp" />
</body>
</html>
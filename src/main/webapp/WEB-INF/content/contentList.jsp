<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>contentList.jsp</title>
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
		.bg-light { background-color: #e9eef5 }
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
		#template-mo-zay-hero-carousel { background-color: #efefef !important}
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
	<script>
		'use strict';
		function cateCheck() {
			let kind = $("#kind").val();
			location.href="${ctp}/ContentList.co?kind="+kind;
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<section>
    	<div class="container py-5">
	        <div class="row text-center py-3">
	            <div class="col-lg-6 m-auto">
	                <h1>공연리스트</h1>
	                <p class="banner_content">
	                  	마음에 드는 공연을 찾아 예매하세요!<br/>
	                </p>
            	</div>
        	</div>
        	<div class="mb-4">
        		<select name="kind" id="kind" onchange="cateCheck()">
        			<option <c:if test="${kind == '전체'}">selected</c:if>>전체</option>
        			<option <c:if test="${kind == '뮤지컬'}">selected</c:if>>뮤지컬</option>
        			<option <c:if test="${kind == '연극'}">selected</c:if>>연극</option>
        			<option <c:if test="${kind == '콘서트'}">selected</c:if>>콘서트</option>
        			<option <c:if test="${kind == '클래식'}">selected</c:if>>클래식</option>
        			<option <c:if test="${kind == '가족/아동'}">selected</c:if>>가족/아동</option>
        			<option <c:if test="${kind == '뮤직페스티벌'}">selected</c:if>>뮤직페스티벌</option>
        			<option <c:if test="${kind == '공연제'}">selected</c:if>>공연제</option>
        			<option <c:if test="${kind == '기타'}">selected</c:if>>기타</option>
        		</select>
	        	<c:if test="${sLevel == 0}"><input type="button" value="공연추가" class="btn btn-info mb-3" onclick="location.href='${ctp}/ContentInput.co';"/></c:if>
	        </div>
	        <div class="card-columns">
	        	<c:forEach var="vo" items="${vos}" varStatus="st">
	                <div class="card h-100 mb-4">
	                    <a href="${ctp}/ContentInfo.co?idx=${vo.idx}&kind=${kind}">
	                        <img src="${ctp}/assets/img/content/${vo.photo}" class="card-img-top" height="280px">
	                    </a>
	                    <div class="card-body this_month">
	                        <a href="${ctp}/ContentInfo.co?idx=${vo.idx}&kind=${kind}" class="h2_1 text-decoration-none text-dark">${vo.title}</a>
	                        <c:if test="${vo.day_diff <= 0}"><span class="badge badge-secondary">공연중</span></c:if>
	                        <c:if test="${vo.day_diff > 0}"><span class="badge badge-secondary">D-${vo.day_diff}</span></c:if>
	                        <p class="card-text mt-3">
	                            공연 날짜 : <br/>${fn:substring(vo.startDate,0,11)} ~ ${fn:substring(vo.lastDate,0,11)}<br/>
	                            공연 시간 : <br/>${vo.startTime}
	                            공연 장소 : ${vo.place}<br/>
	                            연령 제한 : ${vo.age}<br/>
	                            런타임 : ${vo.runTime}분<br/>
	                            <c:if test="${vo.price != 0}">관람 가격 : ${vo.price}원</c:if>
                        		<c:if test="${vo.price == 0}">관람 가격 : 무료</c:if>
	                        </p>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
    	</div>
	</section>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
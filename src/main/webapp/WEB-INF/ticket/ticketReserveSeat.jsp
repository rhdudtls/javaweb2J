<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ticketReserveSeat.jsp</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<jsp:include page="/include/bs4.jsp" />
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
		    font-family: 'TheJamsil';
		    font-weight: 400;
		    font-style: normal;
		    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Regular.eot');
		    src: url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Regular.eot?#iefix') format('embedded-opentype'),
		        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Regular.woff2') format('woff2'),
		        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Regular.woff') format('woff'),
		        url('https://cdn.jsdelivr.net/gh/webfontworld/TheJamsil/TheJamsil-Regular.ttf') format("truetype");
		    font-display: swap;
		}
		
		@font-face {
		    font-family: 'KorailRoundGothicBold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
		
		
		/* Typography */
		.seat_num * {
			font-family: 'TheJamsil';
		}
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
		.bg-pink {
		  background-color: #F2D8D8;
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
		function onDisplay() {
			$('#noneDiv').show();
		}
		
		$(document).ready(function(){
			$(".seat").click(function(){  // 여기서 .click은 체크박스의 체크를 뜻한다.
				var str = "";  // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
				$(".seat").each(function(){  // .each()는 forEach를 뜻한다.
					if($(this).is(":checked")) { // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
						str += $(this).val() + ", ";  // 체크된 객체를 str에 저장한다.
					}
				});
				let cnt = $("input:checkbox[name=seat]:checked").length;
				let totalPrice = cnt * ${vo.price};
				str = str.substring(0, (str.length-2));
				$("#demo").html("선택된 좌석 :"+str+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"총 가격: "+totalPrice+"원");  // #multiPrint에 체크된 원소를 출력한다.
			});
		});
		
		function seatCheck() {
			let cnt = $("input:checkbox[name=seat]:checked").length;
			let totalPrice = cnt * ${vo.price};
			myform.totalPrice.value = totalPrice;
			if(myform.totalPrice.value == 0){
				alert("좌석을 하나 이상 선택하세요!")
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/TicketReserveCheck.ti?idx=${vo.idx}&yy=${yy}&mm=${mm}&dd=${dd}&weekDay=${weekDay}&startTime=${realTime}">
		<section class="bg-pink">
		    <div class="container pb-5">
		    	<h1 class="h1 text-center">공연 시간과 좌석을 선택하세요!</h1>
		        <div class="row">
		            <div class="col-lg-3 mt-5 this_month">
		                <div class="card mb-3" >
		                	공연 제목 : ${vo.title}<br/><br/>
		                	예약 날짜 : ${yy}-${mm}-${dd} ${weekDay}
		                </div>
		                <div class="card text-center">
			                	공연 시간<br/>
		                </div>
		                <c:if test="${realTime != ''}"><input type="button" value="${realTime}" onclick="onDisplay()" class="btn btn-light mt-3 btn-lg"/></c:if>
		                <c:if test="${realTime == ''}">${weekDay}에는 공연을 진행하지 않습니다. 다른 요일을 선택해주세요!</c:if>
		                <br/><br/><br/><br/> <br/><br/>
		                <div class="text-center"><input type="button" value="돌아가기" onclick="location.href='${ctp}/TicketReserveDate.ti?idx=${idx}';" class="btn btn-warning"/></div>
		            </div>
		            <!-- col end -->
		            <div class="col-lg-9 mt-5 seat_num">
			         	<div id="noneDiv" style="display:none;">
			                <div class="card">
			                    <div class="card-body">
			                    	<div class="text-center">|&nbsp;&nbsp;무대&nbsp;&nbsp;|</div>
			                    	<div class="row">
			                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    		<div>
					                    	<c:forEach begin="0" end="6" step="1" var="i">
					                    		<br/>
					                    		<c:forEach begin="1" end="3" step="1" var="j">
				                    				<c:set var="seatName" value="A${i}${j}" />
				                    				<c:if test="${fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="A${i}${j}" disabled/>A${i}${j}</c:if>
				                    				<c:if test="${!fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="A${i}${j}" />A${i}${j}</c:if>
					                    		</c:forEach>
					                    	</c:forEach>
				                    	</div>
				                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    		<div>
					                    	<c:forEach begin="0" end="6" step="1" var="i">
					                    		<br/>
					                    		<c:forEach begin="1" end="6" step="1" var="j">
					                    				<c:set var="seatName" value="B${i}${j}" />
					                    				<c:if test="${fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="B${i}${j}" disabled/>B${i}${j}</c:if>
					                    				<c:if test="${!fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="B${i}${j}" />B${i}${j}</c:if>
					                    		</c:forEach>
					                    	</c:forEach>
				                    	</div>
				                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    		<div>
					                    	<c:forEach begin="0" end="6" step="1" var="i">
					                    		<br/>
					                    		<c:forEach begin="1" end="3" step="1" var="j">
				                    				<c:set var="seatName" value="C${i}${j}" />
				                    				<c:if test="${fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="C${i}${j}" disabled/>C${i}${j}</c:if>
				                    				<c:if test="${!fn:contains(reservSeat,seatName)}"><input type="checkbox" class="seat" name="seat" value="C${i}${j}" />C${i}${j}</c:if>
					                    		</c:forEach>
					                    	</c:forEach>
				                    	</div>
				                    </div>
			                    </div>
				            	<div id="demo" class="text-center"></div>
				            	<input type="hidden" name="totalPrice"/>
			                </div>
			                <div class="text-center"><input type="button" value="확인" onclick="seatCheck()" class="text-center btn btn-success mt-3"/></div>
		            	</div>
		           	</div>
		        </div>
		    </div>
		</section>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
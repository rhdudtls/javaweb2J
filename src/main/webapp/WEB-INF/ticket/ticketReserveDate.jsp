<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ticketReserveDate.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
	    #td1,#td8,#td15,#td22,#td29,#td36 {color:red}
	    #td7,#td14,#td21,#td28,#td35 {color:blue}
	    .today {
	      background-color: pink;
	      color: #fff;
	      font-weight: bolder;
    	}
    	.gray {
    	  background-color:gray;
    	}
  </style>
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
		.reservation_ok:hover {
			background-color:pink;
		}
	</style>
	<script>
		'use strict';
		
		function ansCheck(title,yy,mm,dd){
			let ans = confirm(title+" : "+yy+"-"+mm+"-"+dd+"에 예약하시겠습니까?");
			if(!ans) return false;
			location.href='${ctp}/TicketReserveSeat.ti?idx=${idx}&yy='+yy+'&mm='+mm+'&dd='+dd;
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<div class="text-center">
	  <button type="button" onclick="location.href='${ctp}/TicketReserveDate.ti?yy=${yy-1}&mm=${mm}&idx=${vo.idx}';" class="btn btn-secondary btn-sm" title="이전년도">◁◁</button>
	  <button type="button" onclick="location.href='${ctp}/TicketReserveDate.ti?yy=${yy}&mm=${mm-1}&idx=${vo.idx}';" class="btn btn-secondary btn-sm" title="이전월">◀</button>
	  <font size="5">${yy}년 ${mm+1}월</font>
	  <button type="button" onclick="location.href='${ctp}/TicketReserveDate.ti?yy=${yy}&mm=${mm+1}&idx=${vo.idx}';" class="btn btn-secondary btn-sm" title="다음월">▶</button>
	  <button type="button" onclick="location.href='${ctp}/TicketReserveDate.ti?yy=${yy+1}&mm=${mm}&idx=${vo.idx}';" class="btn btn-secondary btn-sm" title="다음년도">▷▷</button>
		&nbsp;&nbsp;
	  <button type="button" onclick="location.href='${ctp}/TicketReserveDate.ti';" class="btn btn-secondary btn-sm" title="오늘날짜">홈</button>
  </div>
  <br/>
  <div class="text-center">
    <table class="table table-bordered" style="height:450px">
      <tr class="table-dark text-dark">
        <th style="width:14%; vertical-align:middle; color:red">일</th>
        <th style="width:14%; vertical-align:middle;">월</th>
        <th style="width:14%; vertical-align:middle;">화</th>
        <th style="width:14%; vertical-align:middle;">수</th>
        <th style="width:14%; vertical-align:middle;">목</th>
        <th style="width:14%; vertical-align:middle;">금</th>
        <th style="width:14%; vertical-align:middle; color:blue">토</th>
      </tr>
      <tr>
      	<!-- 시작일 이전을 공백처리한다.(오늘이 월요일이면 startWeek가 2이기에 1칸을 공백처리한다. -->
      	<c:set var="gap" value="1"/>
      	<c:forEach begin="1" end="${startWeek - 1}">
      	  <td>&nbsp;</td>
      	  <c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      	
      	<!-- 해당월에 대한 첫째주 날짜부터 출력하되, gap이 7이되면 줄바꿈한다. -->
      	<c:forEach begin="1" end="${lastDay}" varStatus="st">
      	  <c:if test="${(startYear==yy && startMonth>(mm+1)) || (startYear==yy && startMonth==(mm+1) && st.count < startDay)}"><td id="td${gap}" class="gray">${st.count}</td></c:if>
      	  <c:if test="${(lastYear==yy && lastMonth<(mm+1)) || (lastYear==yy && lastMonth==(mm+1) && st.count > lastDayC)}"><td id="td${gap}" class="gray">${st.count}</td></c:if>
      	  <c:if test="${(startYear==yy && startMonth==(mm+1) && lastMonth==(mm+1)) && (startDay <= st.count && st.count <= lastDayC)}"><td id="td${gap}" class="reservation_ok" onClick="ansCheck('${vo.title}','${yy}','${mm+1}','${st.count}')" style="cursor:pointer;">${st.count}</td></c:if>
      	  <c:if test="${(lastYear==yy && startMonth != lastMonth && startMonth==(mm+1)) && (startDay <= st.count)}"><td id="td${gap}" class="reservation_ok" onClick="ansCheck('${vo.title}','${yy}','${mm+1}','${st.count}')" style="cursor:pointer;">${st.count}</td></c:if>
      	  <c:if test="${(lastYear==yy && startMonth != lastMonth && ((mm+1) > startMonth && (mm+1 < lastMonth)))}"><td id="td${gap}" class="reservation_ok" onClick="ansCheck('${vo.title}','${yy}','${mm+1}','${st.count}')" style="cursor:pointer;">${st.count}</td></c:if>
      	  <c:if test="${(lastYear==yy && startMonth != lastMonth && lastMonth==(mm+1)) && (lastDayC >= st.count)}"><td id="td${gap}" class="reservation_ok" onClick="ansCheck('${vo.title}','${yy}','${mm+1}','${st.count}')" style="cursor:pointer;">${st.count}</td></c:if>
      	  <c:if test="${gap % 7 == 0}"></tr><tr></c:if>
      	  <c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      </tr>
    </table>
	<input type="button" value="돌아가기" onclick="location.href='${ctp}/ContentInfo.co?idx=${vo.idx}';" class="btn btn-warning"/>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
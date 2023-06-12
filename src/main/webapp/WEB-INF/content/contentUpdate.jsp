<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>contentInput.jsp</title>
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
	<script>
		'use strict';
		function fCheck() {
			let place = myform.place.value.trim();
			let runTime = myform.runTime.value.trim();
			let age = myform.age.value.trim();
			let price = myform.price.value.trim();
			let photo = myform.photo.value.trim();
			let startDate = myform.startDate.value.trim();
			let lastDate = myform.lastDate.value.trim();
			let startTime1 = myform.startTime1.value.trim();
			let startTime2 = myform.startTime2.value.trim();
			let startTime3 = myform.startTime3.value.trim();
			let startTime4 = myform.startTime4.value.trim();
			let startTime5 = myform.startTime5.value.trim();
			let startTime6 = myform.startTime6.value.trim();
			let startTime7 = myform.startTime7.value.trim();
			
			myform.startTime.value = startTime1+"/"+startTime2+"/"+startTime3+"/"+startTime4+"/"+startTime5+"/"+startTime6+"/"+startTime7;
			
			let regPlace = /^(?=.*[a-z0-9가-힣])[a-z0-9A-Z가-힣~@$!%*#?&\s]{2,50}$/;
			
			if(place == "") {
				alert("공연 장소를 입력하세요");
				myform.place.focus();
				return false;
			}
			else if(!regPlace.test(place)) {
				alert("공연 장소가 너무 짧거나 깁니다.");
				myform.place.focus();
				return false;
			}
			else if(startDate == "") {
				alert("공연 시작일을 입력하세요");
				myform.startDate.focus();
				return false;
			}
			else if(lastDate == "") {
				alert("공연 종료일을 입력하세요");
				myform.lastDate.focus();
				return false;
			}
			else if(runTime == "") {
				alert("런타임을 입력하세요");
				myform.runTime.focus();
				return false;
			}
			else if(age == "") {
				alert("연령 제한을 입력하세요");
				myform.age.focus();
				return false;
			}
			else if(price == "") {
				alert("관람 가격을 입력하세요");
				myform.price.focus();
				return false;
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
	<form name="myform" method="post" action="${ctp}/ContentUpdateOk.co" class="was-validated" enctype="multipart/form-data">
    	<h1 class="text-center" style="font-family: 'KCC-Ganpan'; color:#ff9966">공연정보수정</h1>
    	<br/>
    	<div class="form-group">
			<label for="title">공연 제목 : ${vo.title}</label>
    	</div>
	    <div class="form-group">
			<label for="place">공연 장소 : </label>
			<input type="text" class="form-control" name="place" id="place" value="${vo.place}" placeholder="공연장소를 입력하세요." required/>
	    </div>
	    <div class="form-group">
			<label for="startDate">공연 시작일</label>
			<input type="date" name="startDate" value="${startDate}" class="form-control" required/>
	    </div>
	    <div class="form-group">
			<label for="lastDate">공연 종료일</label>
			<input type="date" name="lastDate" value="${lastDate}"  class="form-control" required/>
	    </div>
	     <div class="form-group">
			<label for="startTime">공연 시작시간</label><br/>
			<font size="2" color="green">해당 요일에 공연이 없는 경우 초기값(4AM)으로 설정해주세요.</font>
			<table>
				<tr>
					<th>월요일</th>
					<td><input type="time" name="startTime1" id="startTime1" value="${startTime[0]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>화요일</th>
					<td><input type="time" name="startTime2" id="startTime2" value="${startTime[1]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>수요일</th>
					<td><input type="time" name="startTime3" id="startTime3" value="${startTime[2]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>목요일</th>
					<td><input type="time" name="startTime4" id="startTime4" value="${startTime[3]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>금요일</th>
					<td><input type="time" name="startTime5" id="startTime5" value="${startTime[4]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>토요일</th>
					<td><input type="time" name="startTime6" id="startTime6" value="${startTime[5]}" class="form-control" required/></td>
				</tr>
				<tr>
					<th>일요일</th>
					<td><input type="time" name="startTime7" id="startTime7" value="${startTime[6]}" class="form-control" required/></td>
				</tr>
			</table>
	    </div>
	    <div class="form-group">
			<label for="runTime">런타임 : </label>
			<input type="text" class="form-control" value="${vo.runTime}" name="runTime" id="runTime" placeholder="런타임을 입력하세요." required/>
	    </div>
	    <div class="form-group">
			<label for="age">연령 제한 : </label>
			<input type="text" class="form-control" value="${vo.age}" name="age" id="age" placeholder="연령제한을 입력하세요." required/>
	    </div>
	    <div class="form-group">
			<label for="price">관람 가격 : </label>
			<input type="number" class="form-control" value="${vo.price}" name="price" id="price" placeholder="관람가격을 입력하세요." required/>
	    	<font size="2" color="green">예매가 없는 공연의 경우 가격을 0으로 설정해주세요.</font>
	    </div>
		<div class="form-group">
			<label for="kind">공연 분류</label>
			<select class="form-control" id="kind" name="kind">
			  <!-- <option value="">직업선택</option> -->
				<option <c:if test="${vo.kind == '뮤지컬'}">selected</c:if>>뮤지컬</option>
				<option <c:if test="${vo.kind == '연극'}">selected</c:if>>연극</option>
				<option <c:if test="${vo.kind == '콘서트'}">selected</c:if>>콘서트</option>
				<option <c:if test="${vo.kind == '클래식'}">selected</c:if>>클래식</option>
				<option <c:if test="${vo.kind == '가족/아동'}">selected</c:if>>가족/아동</option>
				<option <c:if test="${vo.kind == '뮤직페스티벌'}">selected</c:if>>뮤직페스티벌</option>
				<option <c:if test="${vo.kind == '공연제'}">selected</c:if>>공연제</option>
				<option <c:if test="${vo.kind == '기타'}">selected</c:if>>기타</option>
			</select>
		</div>
		<div class="form-group">
			<div class="form-check-inline">
				<span class="input-group-text">공연 예매 가능 여부 :</span> &nbsp; &nbsp;
				<label class="form-check-label">
					<input type="radio" class="form-check-input" name="rsv_type" value="YES" <c:if test="${vo.rsv_type == 'YES'}">checked</c:if>>가능
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label">
				    <input type="radio" class="form-check-input" name="rsv_type" value="NO" <c:if test="${vo.rsv_type == 'NO'}">checked</c:if>>불가능
				</label>
			</div>
		</div>
    	<div class="form-group">
			<label for="content">공연소개</label>
			<textarea rows="5" class="form-control" id="content" name="content" placeholder="공연소개를 입력하세요." required>${vo.content}</textarea>
		</div>
		<div class="form-group">
		    공연 사진(파일용량:2MByte이내) :
		    <img src="${ctp}/assets/img/content/${vo.photo}" width="100px"/>
		    <input type="file" name="photo" id="file" class="form-control-file border"/>
		</div>
		<input type="hidden" name="idx" value="${vo.idx}"/>
		<input type="hidden" name="startTime"/>
		<button type="button" class="btn btn-success" onclick="fCheck()">공연수정</button> &nbsp;
		<button type="reset" class="btn btn-warning">다시작성</button> &nbsp;
		<button type="button" class="btn btn-info" onclick="location.href='${ctp}/ContentInfo.co?idx=${vo.idx}';">돌아가기</button>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
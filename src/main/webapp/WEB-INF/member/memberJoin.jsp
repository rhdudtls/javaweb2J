<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberJoin.jsp</title>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/woo.js"></script>
	<script>
	  'use strict';
	  // 아이디와 닉네임 중복버튼을 클릭했는지의 여부를 확인하기위한 변수(버튼 클릭후에는 내용 수정처리 못하도록 처리)
	  let idCheckSw = 0;
	  let nickCheckSw = 0;
	  
	  function fCheck() {
	  	
	  	let submitFlag = 0;
	  	
	  	let regMid = /^[A-Za-z]{1}[A-Za-z0-9_]{3,19}$/; // 첫글자는 영대소문자, 이후는 영대소문자+숫자+언더바 가능 4~20자
	  	let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,19}$/; // 최소 8자, 최대20자, 하나 이상의 대소문자+숫자+특수문자 
	    let regNickName = /^[a-zA-Z0-9가-힣]{1,10}$/; // 영대소문자숫자한글(자모 x)로 이루어진 1글자이상 10글자 이하
	    let regName = /^[가-힣]{2,10}$/; //한글로 된 실명 최소 2글자 성+외자 최대 10글자
	    let regEmail =/^[a-zA-Z0-9_]{2,}$/; //2글자 이상의 영문 대소문자 + 숫자
	  	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;  //처음 2~3숫자 중간 3~4숫자 마지막은 4숫자
	  	
	  	let mid = myform.mid.value;
	  	let pwd = myform.pwd.value;
	  	let nickName = myform.nickName.value;
	  	let name = myform.name.value;
	  	let email1 = myform.email1.value;
	  	let email2 = myform.email2.value;
	  	let email = email1 + "@" + email2;
	  	let tel1 = myform.tel1.value;
	  	let tel2 = myform.tel2.value;
	  	let tel3 = myform.tel3.value;
	  	let tel = tel1 + "-" + tel2 + "-" + tel3; 
	
	  	let postcode = myform.postcode.value + " ";
	  	let roadAddress = myform.roadAddress.value + " ";
	  	let detailAddress = myform.detailAddress.value + " ";
	  	let extraAddress = myform.extraAddress.value + " ";
		myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
		
		
	  	if(mid.trim() == "") {
	  		alert("아이디를 입력하세요!");
	  		myform.mid.focus();
	  		return false;
	  	}
	  	else if(!regMid.test(mid)) {
	  		alert("아이디가 입력형식에 맞지 않습니다.");
	  		mid = $("#mid").val("");
	  		myform.mid.focus();
	  		return false;
	  	}
	  	else if(pwd.trim() == "") {
	  		alert("비밀번호를 입력하세요!");
	  		myform.pwd.focus();
	  		return false;
	  	}
	  	else if(!regPwd.test(pwd)) {
	  		alert("비밀번호가 입력형식에 맞지 않습니다.");
	  		pwd = $("#pwd").val("");
	  		myform.pwd.focus();
	  		return false;
	  	}
	  	else if(nickName.trim() == "") {
	  		alert("닉네임을 입력하세요!");
	  		myform.nickName.focus();
	  		return false;
	  	}
	  	else if(!regNickName.test(nickName)) {
		   	alert("닉네임이 입력형식에 맞지 않습니다.")
		   	nickName = $("#nickName").val("");
		    myform.nickName.focus();
		    return false;
	    }
	  	else if(name.trim() == "") {
	  		alert("성명을 입력하세요!");
	  		myform.name.focus();
	  		return false;
	  	}
	  	else if(!regName.test(name)) {
		   	alert("성명이 입력형식에 맞지 않습니다.")
		   	name = $("#name").val("");
	        myform.name.focus();
	        return false;
	    }
	  	else if(email1.trim() == "") {
	  		alert("이메일을 입력하세요!");
	  		myform.email1.focus();
	  		return false;
	  	}
	  	else if(!regEmail.test(email1)) {
	       alert("이메일이 입력형식에 맞지 않습니다.");
	       email1 = $("#email1").val("");
	       myform.email1.focus();
	       return false;
	    }
	  	else if(tel2.trim() == "" || tel3.trim() == "") {
	  		alert("전화번호를 입력하세요!");
	  		myform.tel2.focus();
	  		return false;
	  	}
	  	else if(!regTel.test(tel)) {
	        alert("전화번호가 입력형식에 맞지 않습니다.");
	        tel2 = $("#tel2").val("");
	        myform.tel2.focus();
	        return false;
	    }
	  	else {
	  		submitFlag = 1;
	  	}
	  	
	  	if(submitFlag == 1) {
	  		if(idCheckSw == 0) {
	  			alert("아이디 중복체크버튼을 눌러주세요!");
	  			document.getElementById("midBtn").focus();
	  		}
	  		else if(nickCheckSw == 0) {
	  			alert("닉네임 중복체크버튼을 눌러주세요!");
	  			document.getElementById("nickNameBtn").focus();
	  		}
	  		else {
	   		myform.email.value = email;
	   		myform.tel.value = tel;
	   		
	    	myform.submit();
	  		}
	   }
	  	else {
	  		alert("회원가입 실패~~ 폼의 내용을 확인하세요.");
	  	}
	  }
	  
	  // 아이디 중복체크
	  function idCheck() {
	  	let mid = myform.mid.value;
	  	let url = "${ctp}/MemberIdCheck.mem?mid="+mid;
	  	
	  	if(mid.trim() == "") {
	  		alert("아이디를 입력하세요!");
	  		myform.mid.focus();
	  	}
	  	else {
	  		idCheckSw = 1;
	  		myform.mid.readOnly = true;
	  		window.open(url,"nWin","width=580px,height=250px");
	  	}
	  }
	  
	// 닉네임 중복체크
	  function nickCheck() {
	  	let nickName = myform.nickName.value;
	  	let url = "${ctp}/MemberNickCheck.mem?nickName="+nickName;
	  	
	  	if(nickName.trim() == "") {
	  		alert("닉네임을 입력하세요!");
	  		myform.nickName.focus();
	  	}
	  	else {
	  		nickCheckSw = 1;
	  		myform.nickName.readOnly = true;
	  		window.open(url,"nWin","width=580px,height=250px");
	  	}
	  }
	  
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/MemberJoinOk.mem" class="was-validated">
    <h1 class="text-center" style="font-family: 'KCC-Ganpan'; color:#ff9966">회원가입</h1>
    <div class="text-center" style="font-family: 'KCC-Ganpan'">아이디 또는 닉네임을 수정할 수 없을 경우 새로고침(F5)을 눌러주세요😊</div>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
      <font size="2" color="green">아이디는 영문 대소문자, 숫자, _(언더바) 조합의 8~20자리로 작성해주세요. 첫글자는 영문만 허용합니다.</font>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
      <font size="2" color="green">비밀번호는 하나 이상의 영문, 숫자, 특수문자 조합의 8~20자리로 작성해주세요.</font>
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
      <font size="2" color="green">성명은 한글로 된 실명으로 작성해주세요.</font>
    </div>
    <div class="form-group">
      <label for="email1">Email address:</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">
              <option value="naver.com" selected>naver.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="nate.com">nate.com</option>
              <option value="yahoo.com">yahoo.com</option>
            </select>
          </div>
        </div>
    </div>
    <div class="form-group">
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" selected>010</option>
              <option value="02">서울</option>
              <option value="031">경기</option>
              <option value="032">인천</option>
              <option value="041">충남</option>
              <option value="042">대전</option>
              <option value="043">충북</option>
              <option value="051">부산</option>
              <option value="052">울산</option>
              <option value="061">전북</option>
              <option value="062">광주</option>
            </select>-
        </div>
        <input type="text" name="tel2" size=4 maxlength=4 class="form-control" required/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control" required/>
      </div>
    </div>
    <div class="form-group">
      <label for="address">주소</label>
      <div class="input-group mb-1">
        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
        </div>
      </div>
      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
        <div class="input-group-append">
          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
        </div>
      </div>
    </div>
    <button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-warning">다시작성</button> &nbsp;
    <button type="button" class="btn btn-info" onclick="location.href='${ctp}/MemberLogin.mem';">돌아가기</button>
    
    <input type="hidden" name="email" />
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
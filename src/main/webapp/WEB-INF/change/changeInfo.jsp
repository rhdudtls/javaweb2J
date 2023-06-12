<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>changeInfo.jsp</title>
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
		.btn-purple {background-color: #B2A4FF}
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
	 function changeInfoDelete() {
		 let ans = confirm("해당 교환글을 삭제하시겠습니까?");
		 if(!ans) return false;
		 location.href='${ctp}/ChangeDelete.ch?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}';
	 }
	 
	 function replyInput() {
		var checked = $('#secret').is(':checked');
		let secret = ''; 
		if(checked == true){
			secret = 'on'
		}
		else {
			secret = 'off'
		}
		let content = $("#content").val();
		
		if(content.trim() == "") {
			alert("댓글을 입력하세요!");
			$("#content").focus();
			return false;
		}
		let query = {
			changeIdx : ${vo.idx},
			mid      : '${sMid}',
			nickName : '${sNickName}',
			content  : content,
			secret : secret
		}
		
		$.ajax({
			type  : "post",
			url   : "${ctp}/ChangeReplyInput.ch",
			data  : query,
			success:function(res) {
				if(res == "1") {
					alert("댓글이 입력되었습니다.");
					location.reload();
				}
				else {
					alert("댓글이 입력 실패~~");
				}
			},
			error : function() {
				alert("전송 오류!!!");
			}
		});
	 }
	 function replyDelete(idx) {
		let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
		if(!ans) return false;
	      
		$.ajax({
		  type : 'post',
		  url : '${ctp}/ChangeReplyDelete.ch',
		  data : {replyIdx : idx},
		  success : function(res) {
		    if(res == '1') {
		     alert('댓글이 삭제되었습니다.');
		     location.reload();
		    }
		    else {
		     alert('댓글이 삭제되지 않았습니다.');
		    }
		  },
		  error : function() {
		    alert('전송실패~~');
		  }
		});
	 }
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">교환글</h2>
  <br/>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.writeTime,0,fn:length(vo.writeTime)-2)}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>공연&좌석 정보</th>
      <td>${vo.contentInfo}</td>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>원하는 좌석 정보</th>
      <td colspan="3">${vo.wantSeat}</td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
        <c:if test="${flag == 'search'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/ChangeSearch.ch?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
        <c:if test="${flag == 'myChange'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/ChangeMyList.ch?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
        <c:if test="${flag == 'myReply'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/ChangeMyReplyList.ch?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
        <c:if test="${flag != 'search' && flag != 'myChange' && flag != 'myReply'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/ChangeList.ch?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
        &nbsp;
       	<c:if test="${sLevel == 0 || sNickName == vo.nickName}"><input type="button" value="수정하기" onclick="location.href='${ctp}/ChangeUpdate.ch?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning"/></c:if> &nbsp;
       	<c:if test="${sLevel == 0 || sNickName == vo.nickName}"><input type="button" value="삭제하기" onclick="changeInfoDelete()" class="btn btn-danger"/></c:if> &nbsp;
       	<c:if test="${(sLevel == 0 || sNickName == vo.nickName) && vo.day_diff <= -5}"><input type="button" value="끌어올리기" onclick="location.href='${ctp}/ChangeWriteTimeUpdate.ch?idx=${vo.idx}';" class="btn btn-purple text-light"/></c:if>
      </td>
    </tr>
  </table>
  <div class="container">
    <table class="table table-hover text-center">
      <tr>
        <th> &nbsp;작성자</th>
        <th>댓글내용</th>
        <th>작성일자</th>
      </tr>
      <c:forEach var="replyVo" items="${replyVos}" varStatus="st">
        <tr>
          <td class="text-center">${replyVo.nickName}
            <c:if test="${sMid == replyVo.mid || sLevel == 0}">
              (<a href="javascript:replyDelete(${replyVo.idx})" title="댓글삭제"><b>x</b></a>)
            </c:if>
          </td>
          <c:if test="${level == 0 || sNickName == vo.nickName ||(level <= 1 && replyVo.secret == 'off')}"><td>${fn:replace(replyVo.content, newLine, "<br/>")}</td></c:if>
          <c:if test="${level > 1}"><td>비회원은 댓글을 볼 수 없습니다.</td></c:if>
          <c:if test="${level == 1 && sNickName != vo.nickName && replyVo.secret == 'on' && sNickName == replyVo.nickName}"><td>${fn:replace(replyVo.content, newLine, "<br/>")}</td></c:if>
          <c:if test="${level == 1 && sNickName != vo.nickName && replyVo.secret == 'on' && sNickName != replyVo.nickName}"><td>비밀댓글입니다.</td></c:if>
          <td class="text-center">${fn:substring(replyVo.wDate,0,10)}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
  <!-- 댓글 입력창 -->
  <c:if test="${sLevel <= 1}">
	<form name="replyForm">
		<table class="table text-center">
		  <tr>
		    <td style="width:85%" class="text-left">
		      댓글내용 :
		      <textarea rows="4" name="content" id="content" class="form-control"></textarea>
		    </td>
		    <td style="width:15%">
		    	<br/>
		      <p>작성자 : ${sNickName}</p>
		      <p><input type="checkbox" name="secret" id="secret"/>비밀댓글</p>
		      <p><input type="button" value="댓글달기" onclick="replyInput()" class="btn btn-info btn-sm"/></p>
		    </td>
		  </tr>
		</table>
	</form>
  </c:if>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
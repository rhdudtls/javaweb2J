<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand text-success logo h1 align-self-center" href="${ctp}/">
            <img src="${ctp}/assets/img/logo.png" width="200px" height="80px"/>
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${ctp}/ContentList.co">공연</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctp}/TicketReserve.ti">예매</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctp}/ChangeList.ch">티켓교환</a>
                    </li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex">
                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                        <div class="input-group-text">
                            <i class="fa fa-fw fa-search"></i>
                        </div>
                    </div>
                </div>
                <c:if test="${level >= 2}">
                <a class="nav-icon position-relative text-decoration-none mt-3" href="${ctp}/MemberLogin.mem">
	                <i class="fa fa-user fa-2x ml-1" id="login_icon"></i><br/>
	                <span><font size="2px">로그인</font></span>
                </a>
                <a class="nav-icon position-relative text-decoration-none mt-3" href="${ctp}/MemberJoin.mem">
	                <i class="fa fa-users fa-2x ml-1" id="join_icon"></i><br/>
	                <span><font size="2px">회원가입</font></span>
	            </a>
	            </c:if>
	            <c:if test="${level < 2}">
                <a class="nav-icon position-relative text-decoration-none mt-3" href="${ctp}/MemberLogout.mem">
	                &nbsp;<i class="fa fa-door-open fa-2x" id="logout_icon"></i><br/>
	                <span><font size="2px">로그아웃</font></span>
                </a>
                <a class="nav-icon position-relative text-decoration-none mt-3" href="${ctp}/MemberMypage.mem">
	                &nbsp;<i class="fa fa-star fa-2x ml-2" id="mypage_icon"></i><br/>
	                <span><font size="2px">마이페이지</font></span>
                </a>
                </c:if>
                <a class="nav-icon d-none d-lg-inline text-decoration-none" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                    <i class="fa fa-fw fa-search fa-2x mt-3" id="search_icon"></i><br/>
                    <span><font size="2px">&nbsp;&nbsp;&nbsp;검색</font></span>
                </a>
            </div>
        </div>
    </div>
</nav>
<!-- Close Header -->

<!-- Modal -->
<div class="modal fade" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="w-100 pt-1 mb-5 text-right">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="fa fa-fw fa-chevron-up"></i></button>
        </div>
        <form action="" method="get" class="modal-content modal-body border-0 p-0">
            <div class="input-group mb-2">
                <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                <button type="submit" class="input-group-text bg-success text-light">
                    <i class="fa fa-fw fa-search text-white"></i>
                </button>
            </div>
        </form>
    </div>
</div>
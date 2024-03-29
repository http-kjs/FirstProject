<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
}

.aLogo {
	width: 30px;
	height: 27px
}
.aLogo li {
	width: 30px;
	height: 27px;
	transition: background-color 0.6s ease;
}

.aLogo:hover {
	background-color: rgb(245, 246, 247);
}

.aLogo {
	transition: background-color 0.6s ease;
} 
.aLogo li:hover {
	background-color: rgb(245, 246, 247);
}

.aLogo li {
	transition: background-color 0.6s ease;
} 

.img-fluid {
	border-radius: 12px;
}

.panel-body {
	position: relative;
	width: 240px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.pro-title {
	position: relative;
	color: #000;
	font-size: 14px;
	box-sizing: border-box;
}

.starIcon {
	width: 15px;
	height: 15px;
	vertical-align: middle;
	margin-top: -5px;
}
</style>
</head>
<body>
<div>
	<h4><b>총 ${totalCategory}개</b></h4>
</div>

<c:forEach var="vo" items="${list}">
	<div class="col-md-4" style="padding: 8px;">
		<section class="panel">
			<div class="pro-img-box">
				<a href="../activity/activity_detail_before.do?acino=${vo.acino}">
					<img src="${vo.main_poster}" class="img-fluid" style="width: 240px; height: 240px;">
				</a>
			</div>
			<div style="height: 10px"></div>
			<div class="panel-body text-left">
				<a href="../activity/activity_detail_before.do?acino=${vo.acino}" class="pro-title">${vo.title}</a>
				<br>
				<img src="https://dffoxz5he03rp.cloudfront.net/icons/ico_star.svg" class="starIcon">
				&nbsp;<b>${vo.score}</b>&nbsp;${vo.review_count}
				<h6 style="font-weight: bold">
					<fmt:formatNumber value="${vo.price}" pattern="#,###" />원
				</h6>
			</div>
		</section>
	</div>
</c:forEach>

<div class="pagination">
	<c:if test="${startPage > 1}">
		<a href="#" class="page-link" data-page="${startPage - 1}">&laquo;</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="#" class="page-link" data-page="${i}">${i}</a>
	</c:forEach>
	<c:if test="${endPage < totalpage}">
		<a href="#" class="page-link" data-page="${endPage + 1}">&raquo;</a>
	</c:if>
</div>
</body>
</html>
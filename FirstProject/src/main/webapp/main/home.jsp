<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.addEventListener("load", initializeCategory);
	function initializeCategory() {
		let select = document.getElementById("chooseCategory");
		if (select.value === "") {
			select.removeAttribute("name"); // 선택된 값이 전체일 경우 name 속성 제거
		} else {
			select.setAttribute("name", "lno"); // 다른 옵션 선택 시 name 속성 추가
		}
	}
	function handleCategoryChange(select) {
		if (select.value === "") {
			select.removeAttribute("name"); // 선택된 값이 전체일 경우 name 속성 제거
		} else {
			select.setAttribute("name", "lno"); // 다른 옵션 선택 시 name 속성 추가
		}
	}
	$(function() {
		$('.top10title').css("cursor", "pointer")
		$('.top10title').click(function() {
			let img = $(this).attr("data-poster")
			$('#poster').attr("src", img)

		})

		$('.foodTop10').css("cursor", "pointer")
		$('.foodTop10').click(function() {
			let fimg = $(this).attr("data-poster")
			$('#fposter').attr("src", fimg)
		})

		$('.acTop10').css("cursor", "pointer")
		$('.acTop10').click(function() {
			let aimg = $(this).attr("data-aposter")
			$('#aposter').attr("src", aimg)
		})
		
		$('.hotelTop10').css("cursor", "pointer")
		$('.hotelTop10').click(function() {
			let himg = $(this).attr("data-poster")
			$('#hposter').attr("src", himg)
		})
		
		$('.rentcarTop10').css("cursor", "pointer")
		$('.rentcarTop10').click(function() {
			let rimg = $(this).attr("data-rposter")
			$('#rentcarposter').attr("src", rimg)
		})
	})
</script>
</head>
<body>
	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top-text header-text">
						<h2>Jeju Travel</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<form id="search-form" name="gs" method="get" role="search"
						action="../travel/travel_find.do">
						<input type="hidden" name="page" value="1">
						<div class="row">
							<div class="col-lg-3 align-self-center">
								<fieldset>
									<select name="lno" style="color: #FF7F31" class="form-select"
										aria-label="Area" id="chooseCategory"
										onchange="handleCategoryChange(this); this.form.click();">
										<option value="" selected>전체</option>
										<option value="1">관광지</option>
										<option value="2">음식점</option>
										<option value="3">숙박</option>
										<option value="4">행사/축제</option>
									</select>
								</fieldset>
							</div>
							<div class="col-lg-6 align-self-center">
								<fieldset>
									<input type="text" name="fd" class="searchText"
										placeholder="검색어를 입력하세요." required>
								</fieldset>
							</div>
							<div class="col-lg-3">
								<fieldset>
									<button class="main-button" style="background-color: #FFA63C;">
										<i class="fa fa-search"></i> Search Now
									</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-10 offset-lg-1">
					<ul class="categories">
						<li><a href="../food/food_list.do"><span class="icon"><img
									src="../assets/images/search-icon-02.png" alt="Food"></span>
								Food </a></li>
						<li><a href="../travel/course_list.do"><span class="icon"><img
									src="../assets/images/search-icon-05.png" alt="Travel"></span>
								Courses </a></li>
						<li><a href="../activity/activity_list.do"><span
								class="icon"><img
									src="../assets/images/search-icon-06.png" alt="Activity"></span>
								Activity </a></li>
						<li><a href="../hotel/hotel_list.do"><span class="icon"><img
									src="../assets/images/search-icon-01.png" alt="Hotel"></span>
								Hotel </a></li>
						<li><a href="../rentcar/rentcar_main.do"><span
								class="icon"><img
									src="../assets/images/search-icon-03.png" alt="RentalCar"></span>
								Cars </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 70px;"></div>
	<div class="popular-categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Popular Categories</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="naccs">
						<div class="grid">
							<div class="row">
								<div class="col-lg-3">
									<div class="menu">
										<div class="first-thumb active">
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-01.png" alt=""></span>
												Hotel
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-02.png" alt=""></span>
												Food
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-03.png" alt=""></span>
												Rentcar
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-06.png" alt=""></span>
												Activity
											</div>
										</div>
										<div class="last-thumb">
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-05.png" alt=""></span>
												Travel
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-9 align-self-center">
									<ul class="nacc">
										<li class="active">
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h3 style="color: white">추천 호텔 10선</h3>
																<br>


																<c:forEach var="vo" items="${hhList }" varStatus="h">
																	<span class="hotelTop10"
																		style="font-size: 15pt; color: white; line-height: 2"
																		data-poster="${vo.poster }"> <strong>${h.index+1 }.
																			&nbsp;${vo.name }</strong>
																	</span>
																	<br>
																</c:forEach>

																<div class="main-white-button">
																	<a href="../hotel/hotel_list.do"><i
																		class="fa fa-eye"></i>제주 호텔 더보기</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-01.jpg"
																	id="hposter" style="width: 455px; height: 510px">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h3 style="color: white">인기 맛집 Top 10</h3>
																<br>


																<c:forEach var="vo" items="${ffList }" varStatus="f">
																	<span class="foodTop10"
																		style="font-size: 15pt; color: white; line-height: 2"
																		data-poster="${vo.poster }"> <strong>${f.index+1 }.
																			&nbsp;${vo.name }</strong> <span style="font-size: 11pt;">&nbsp;(${vo.score })</span>
																	</span>
																	<br>
																</c:forEach>

																<div class="main-white-button">
																	<a href="../food/food_list.do"><i class="fa fa-eye"></i>제주
																		맛집 더보기</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-02.jpg"
																	id="fposter" style="width: 455px; height: 510px">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h3 style="color: white">인기 렌트카 TOP 10</h3>
																<p>
																	<br>
																	<c:forEach var="rtop" items="${rtList }" varStatus="s">
																		<span class="rentcarTop10"
																			style="font-size: 15pt; color: white; line-height: 2"
																			data-rposter="${rtop.img }"> <strong>${s.index+1 }.</strong><span
																			style="font-size: 14pt"> &nbsp;${rtop.car_name }</span>
																			<span style="font-size: 11pt;">&nbsp;${rtop.hit }</span>
																		</span>
																		<br>
																	</c:forEach>
																</p>

															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-05.jpg" alt=""
																	id="rentcarposter" style="width: 455px; height: 510px">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h3 style="color: white">인기 액티비티 TOP 10</h3>
																<p>
																	<br>
																	<c:forEach var="atop" items="${atList }" varStatus="s">
																		<span class="acTop10"
																			style="font-size: 15pt; color: white; line-height: 2"
																			data-aposter="${atop.poster }"> <strong>${s.index+1 }.</strong><span
																			style="font-size: 14pt"> &nbsp;${atop.title }</span>
																			<span style="font-size: 11pt;">&nbsp;${atop.review_count }</span>
																		</span>
																		<br>
																	</c:forEach>
																</p>

															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-05.jpg" alt=""
																	id="aposter" style="width: 455px; height: 510px">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h3 style="color: white">여행 인기 검색어 TOP 10</h3>
																<p>
																	<br>
																	<c:forEach var="ttop" items="${ttoplist }"
																		varStatus="s">
																		<span class="top10title"
																			style="font-size: 15pt; color: white; line-height: 2"
																			data-poster="${ttop.poster }">${s.index+1 }.
																			&nbsp;${ttop.title }</span>
																		<br>
																	</c:forEach>
																</p>

															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="dol.png" alt="" id="poster"
																	style="width: 455px; height: 510px">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="recent-listing">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Recent Listing</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="owl-carousel owl-listing">
						<%-- Activity 출력 --%>
						<c:forEach var="cvo" items="${cList}" varStatus="s1">
							<c:if test="${s1.index>=0 && s1.index<2 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a
														href="../activity/activity_detail.do?acino=${cvo.acino }">
														<img src="${cvo.main_poster }" class="recentImg"
														style="width: 480px; height: 400px;">
													</a>
												</div>
												<div class="right-content align-self-center">
													<a
														href="../activity/activity_detail.do?acino=${cvo.acino }">
														<h4>${cvo.title}</h4>
													</a> <span class="price">
														<div class="icon">
															<img src="../assets/images/listing-icon-01.png" alt="">
														</div> <fmt:formatNumber value="${cvo.price }" pattern="#,###" />원
													</span> <span class="details"> <em></em>
													</span>
													<h1>${cvo.score }</h1>
													<span> <c:forEach var="i" begin="1" end="5">
															<sup style="color: gold"> <c:if
																	test="${cvo.score+1>i }">★</c:if>
															</sup>
														</c:forEach> <br> <sup>후기 ${cvo.review_count }</sup>
													</span>
													<div class="main-white-button">
														<a
															href="../activity/activity_detail.do?acino=${cvo.acino }">
															<i class="fa fa-eye"></i> Contact Now
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<%-- Course 출력 --%>
						<c:forEach var="tvo" items="${tList}" varStatus="s2">
							<c:if test="${s2.index>=0 && s2.index<2 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a href="../travel/travel_find_detail.do?no=${tvo.no }">
														<img src="${tvo.poster }" class="recentImg"
														style="width: 480px; height: 400px;">
													</a>
												</div>
												<div class="right-content align-self-center">
													<a href="../travel/travel_find_detail.do?no=${tvo.no }">
														<h4>${tvo.title}</h4>
													</a> <span class="price"> ${tvo.tag } </span> <span
														class="details"> ${tvo.introduction } </span> <span>
														${tvo.label } </span> <span> ${tvo.addr } </span>
													<div class="main-white-button">
														<a href="../travel/travel_find_detail.do?no=${tvo.no }">
															<i class="fa fa-eye"></i> Show Detail
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<%-- Hotel 출력 --%>
						<c:forEach var="hvo" items="${hList}" varStatus="s3">
							<c:if test="${s3.index>=0 && s3.index<2 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a href="../hotel/hotel_detail.do?huno=${hvo.huno }"> <img
														src="http://www.jejutori.com/${hvo.poster }"
														class="recentImg" style="width: 480px; height: 400px;">
													</a>
												</div>
												<div class="right-content align-self-center">
													<a href="../hotel/hotel_detail.do?huno=${hvo.huno }">
														<h4>${hvo.name}</h4>
													</a> <span class="price">
														<div class="icon">
															<img src="../assets/images/listing-icon-01.png" alt="">
														</div>
													</span> <span class="details"> <em></em>
													</span> <span> <br>
													</span>
													<div class="main-white-button">
														<a href="../hotel/hotel_detail.do?huno=${hvo.huno }">
															<i class="fa fa-eye"></i> 상세보기
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<%-- food 출력 --%>
						<c:forEach var="fvo" items="${fList}" varStatus="s4">
							<c:if test="${s4.index>=0 && s4.index<2 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a href="../food/food_detail.do?fino=${fvo.fino }"> <img
														src="${fvo.poster }" class="recentImg"
														style="width: 480px; height: 400px;">
													</a>
												</div>
												<div class="right-content align-self-center">
													<a href="../food/food_detail.do?fino=${fvo.fino }">
														<h4>${fvo.name}</h4>
													</a> <span class="details"> <strong
														style="color: orange">평점&nbsp;&nbsp;${fvo.score }</strong>
													</span><br> <span> <i class="fa fa-map-marker"></i>&nbsp;&nbsp;${addr1 }
													</span><br> <span>
														<ul>
															<c:forTokens items="${fvo.menu }" delims="원" var="m">
																<c:choose>
																	<c:when test="${m eq 'no' }">
																		<li style="display: block;">정보없음</li>
																	</c:when>
																	<c:otherwise>
																		<li style="display: block;">${m }원</li>
																	</c:otherwise>
																</c:choose>
															</c:forTokens>
														</ul>
													</span>
													<div class="main-white-button">
														<a href="../food/food_detail.do?fino=${fvo.fino }"> <i
															class="fa fa-eye"></i> 상세보기
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<c:forEach var="rvo" items="${rList}" varStatus="s5">
							<c:if test="${s5.index>=0 && s5.index<2 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a href="../rentcar/rentcar_detail.do?cid=${rvo.cid }">
														<img src="${rvo.img }" class="recentImg"
														style="width: 480px; height: 400px;">
													</a>
												</div>
												<div class="right-content align-self-center">
													<a href="../rentcar/rentcar_detail.do?cid=${rvo.cid }">
														<h4>${rvo.car_name}</h4>
													</a> <span class="price">
														<div class="icon">
															<img src="../assets/images/listing-icon-01.png" alt="">
														</div> <fmt:formatNumber value="${rvo.price }" pattern="#,###" />원

													</span> <span class="details"> <br>
													<em>${rvo.car_size}ㆍ${rvo.seater}ㆍ${rvo.fuel_type}ㆍ${rvo.gear_type}ㆍ${rvo.brand}</em>
													</span> <span> <br>
													</span>
													<div class="main-white-button">
														<a href="../rentcar/rentcar_detail.do?cid=${rvo.cid }">
															<i class="fa fa-eye"></i> 상세보기
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jeju Project</title>
<style type="text/css">
body{
	font-family: Arial;
}
.row1{
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;	
}
.row1 ul li{
	display: inline;
}
.container1{
	margin: 0px auto;
	width: 1000px;
}
p{
	text-align: left;
	font-size: 13pt;
	margin: 5px;
}
</style>
</head>
<body>
<div class="page-heading">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="top-text header-text">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container1">
  <h2>${sessionScope.name }님의 문의사항</h2>
  <p>
    <a href="../qnaboard/qna_insert.do" class="btn btn-sm" 
    style="border-color:gray;float:right;margin-bottom: 10px;">글작성</a>
  </p>
  <table class="table table-striped">
    <thead style="border-top: 1px solid;">
      <tr>
        <th width=10% class="text-center">번호</th>
 		<th width=45%>제목</th>
 		<th width=15% class="text-center">작성자</th>
 		<th width=20% class="text-center">작성일</th>
 		<th width=20% class="text-center">상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${sessionScope.admin=='n' && id==vo.id}">
          <tr>
            <td width=10% class="text-center">${ vo.num }</td>
            <td width=45%>
              <a href="../qnaboard/qna_detail.do?no=${vo.no}" style="color: black">[${vo.type}]&nbsp;&nbsp;${vo.subject }</a>
              <c:if test="${today.equals(vo.dbday) }">
                <sub style="color: red">new</sub>
              </c:if>
            </td>
            <td width=15% class="text-center">${vo.id }</td>
            <td width=20% class="text-center">${vo.dbday }</td>
            <c:if test="${vo.isreply==0 }">
              <td width=20% class="text-center">답변대기</td>
            </c:if>
            <c:if test="${vo.isreply==1 }">
              <td width=20% class="text-center">답변완료</td>
            </c:if>
          </tr>
          </c:if>
      </c:forEach>
    </tbody>
  </table>
</div>
<div class="row1">
  <ul class="text-center">
    <li><a href="../qnaboard/qna_list.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm" style="background-color: #EEEEEE;">이전</a></li>
    <li>${curpage } / ${totalpage }</li>
    <li><a href="../qnaboard/qna_list.do?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm" style="background-color: #E7E3E3">다음</a></li>
  </ul>
</div>
</body>
</html>
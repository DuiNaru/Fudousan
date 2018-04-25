<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 	
 	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
    <title>Agency Page</title>
	


    <!-- 부트스트랩 -->
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/templete.css"/>" >
	

<body>
	<!-- login modal  -->
 	<%@include file="/WEB-INF/views/include/loginmodal.jsp" %> 
 	
	<!-- header -->
	<%@include file="/WEB-INF/views/include/header.jsp" %>
	
	<!-- main -->
	<%@include file="/WEB-INF/views/include/agencypagemain.jsp" %>

<%-- 
<div style="width: 80%; margin-left: 15%">
<h3> 매물 관리</h3>
 <div style="margin-top: 20px"> 
<input  type="button" value="매물 작성" class="btn btn-info" onclick="location.href='/fudousan/bw'"/>
 </div>

<!-- 테스쳐 업로드 페이지로 이동 -->
<input type="button" value="텍스쳐 업로드" class="btn btn-info" onclick="location.href='/fudousan/textureuproadpage'" > 



	<table border="1">
		<tr>
			<th>매물 번호</th>
			<th>매물 이름</th>
			<th>매물 관리</th>
			
		</tr>
		
		<c:forEach var="estate" items="${select}">
		<tr>
			<td>${estate.estateId}</td>
			<td>${estate.estateName} </td>
			
			<td>
			<input type="button" value="삭제"  class="btn btn-info" onclick="location.href='deleteEntry?agencyId=${agencyId}&estateId=${estate.estateId}'">
			
			
			<input type="button" value="수정" class="btn btn-info" onclick="location.href='/fudousan/bc?estateId=${estate.estateId}'">
			<!-- 매물 작성으로 이동 -->
		</tr>
		
		</c:forEach>
	</table>




<!-- <div class="btn-group" data-toggle="buttons">
<label class="btn btn-secondary active">
<input type="radio" name="publicprivate" id="option1" autocomplete="off" value="1" checked>공개
</label>

<label class="btn btn-secondary">
<input type="radio" name="publicprivate" id="option2" autocomplete="off" value="0">비공개
</label>
</div>
 -->



</div>
<br>
<div >
<h3> 매물 3D 모델링 관리</h3>
<!-- 모델링 스냅 샷 자리  -->
<input type="radio" name="cr_page2">공개 
<input type="radio" name="cr_page2">비공개
<input type="button" class="btn btn-info" value="매물 작성">
<input type="button" value="삭제" class="btn btn-info" onclick="snapshot_delete">
 <input type="button" class="btn btn-info" value="수정">
</div>
 --%>
 
	<!-- footer -->
	<%@include file="/WEB-INF/views/include/footer.jsp" %>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    <!-- bootstrap -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>

	<!-- login.js -->
	<script src="<c:url value="/resources/js/login.js"></c:url>"></script>
	
	

	<!-- 다국어 처리 -->
	<script src="../resources/js/cookie.js"></script>
	<script src="../resources/js/translation.js"></script>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<![endif]-->
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>

</html>


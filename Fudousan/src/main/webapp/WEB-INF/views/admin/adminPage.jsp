<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript">
	function confirm(agencyId) {
		location.href="./confirm?agencyId="+agencyId;
	}
</script>
</head>
<body class="container">
	<header class="col-sm-12">헤더ttt</header>
	<div class="col-sm-12">
		<div class="col-sm-8">
			<label class="col-sm-12">공인중개사 가입신청 현황</label>
			<c:forEach var="agency" items="${agencylist }">
				<div class="col-sm-12 form-group">
					<label><c:out value="${agency.name }"/></label>
					<button class="btn btn-default" onclick="confirm(${agency.agencyId})">승인</button>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-4">
			<label>아이템 정보 관리</label>
			<div>
			</div>
			<button class="btn btn-default">아이템 등록</button>
		</div>
	</div>
	<footer class="col-sm-12">푸터</footer>
</body>
</html>
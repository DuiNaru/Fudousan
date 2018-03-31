<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>アイテム修正ページ</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/itemForm.js"/>"></script>
</head>
<body class="container">
	<header>헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-offset-3 col-sm-6">
			<form id="itemform" action="moditem" method="post" onreset="formreset()" onsubmit="return formsubmit()" enctype="multipart/form-data">
				<%@ include file="./itemForm.jsp" %>
			</form>
		</div>
	</div>
	<footer>푸터</footer>
</body>
</html>
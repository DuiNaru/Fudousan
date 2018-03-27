<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">

<style type="text/css">

</style>
</head>
<body>
	<div class="container">
		<div class="header">
		
		
		
		</div>
		
		<!-- coding start here 
		
		ex) <div id="구역 이름(예: 매물 관리 페이지 )">
			
			여기부터 코딩 시작하시면 됩니다. 
		
			</div>	
		-->
		
		<!-- 로그인 -->
		<div>
			<form method="post" onsubmit="formCheck()">
				ID <input type="text" id="memberID" name="memberID">
				Password <input type="password" id="password" name="password">
				<button type="button" onclick="formCheck()">Login</button>
			</form>
		</div>
		
		<div class="footer">
		</div>
		
	</div>

	<h1><a href="user/mypagecustomer" style="color: blue;">손님페이지</a></h1>

<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/login.js"></script>
</body>
</html>

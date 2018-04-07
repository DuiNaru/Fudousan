<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WALLPAGE</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/three.js"/>"></script>
<script src="<c:url value="/resources/js/TDSLoader.js"/>"></script>
<script src="<c:url value="/resources/js/TrackballControls.js"/>"></script>
<script src="<c:url value="/resources/js/DragControls.js"/>"></script>
<style type="text/css">
canvas {
    position: fixed;
    top: 0;
    left: 0;
}
.left-menu {
	position:absolute;
	top: 10%;
	left: 0px;
}
</style>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/js/wallPage.js"/>"></script>
<div class="left-menu">
	<menu>
		<li><input type="button" class="btn btn-default" value="저장"></li>
		<li><input type="button" class="btn btn-default" value="뒤로가기" onclick="back()"></li>
		<li><input type="button" class="btn btn-default" value="앞으로가기" onclick="forward()"></li>
		<li><input type="button" class="btn btn-default" value="벽 그리기" onclick="changeTool(0)"></li>
		<li><input type="button" class="btn btn-default" value="벽 지우기" onclick="changeTool(1)"></li>
		<li><input type="button" class="btn btn-default" value="리셋" onclick="reset()"></li>
	</menu>
</div>
</body>
</html>
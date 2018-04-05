<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ROOMPAGE</title>
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
</style>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
</body>
</html>
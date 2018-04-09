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
<script src="<c:url value="/resources/js/THREE.MeshLine.js"/>"></script>
<script type="text/javascript">
	var roomId = ${room.roomId};
	var originalWalls = [];
	var originalConnectors = [];
	<c:if test="${!empty wallsAndConnectors}">
		<c:forEach var="wall" items="${wallsAndConnectors.walls}" >
			originalWalls.push({startPoint:${wall.roomWallConnector1.connectorId}, endPoint:${wall.roomWallConnector2.connectorId}});
		</c:forEach>
		<c:forEach var="connector" items="${wallsAndConnectors.connectors}" >
			originalConnectors.push(new THREE.Vector3(${connector.x}, ${connector.y}, 0));
		</c:forEach>
	</c:if>
</script>
<style type="text/css">
canvas {
    position: fixed;
    top: 0;
    left: 0;
}
menu {
	position:absolute;
	top: 10%;
	left: 0px;
	z-index: 1;
}
</style>
</head>
<body>
<div class="left-menu">
	<menu>
	</menu>
</div>
</body>
</html>
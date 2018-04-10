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
	var room = {
		roomId:${room.roomId},
		roomPublic:${room.roomPublic},
		height:${room.height},
		ceilingTexture:${room.ceilingTexture},
		floorTexture:${room.floorTexture},
		snapshot:${room.snapshot}
	};
	var originalWalls = [
		<c:forEach var="wall" varStatus="s" items="${walls}" >
			<c:if test="${s.index != 0 }">
				,
			</c:if>
				{	c1:{x:${wall.roomWallConnector1.x}, y:${wall.roomWallConnector1.y}},
					c2:{x:${wall.roomWallConnector2.x}, y:${wall.roomWallConnector2.y}}
				}
		</c:forEach>
	];
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
<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
	<menu>
	</menu>
</div>
</body>
</html>
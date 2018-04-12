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
<script src="<c:url value="/resources/js/OrbitControls.js"/>"></script>
<script src="<c:url value="/resources/js/DragControls.js"/>"></script>
<script src="<c:url value="/resources/js/THREE.MeshLine.js"/>"></script>
<script type="text/javascript">
	var room = {
		roomId:${room.roomId}
		,roomPublic:${room.roomPublic}
		,height:${room.height}
		<c:if test="${!empty room.ceilingTexture}">
		,ceilingTexture:${room.ceilingTexture},
		</c:if>
		<c:if test="${!empty room.floorTexture}">
		,floorTexture:${room.floorTexture},
		</c:if>
		<c:if test="${!empty room.snapshot}">
		,snapshot:${room.snapshot}
		</c:if>
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
	.left-menu {
		position:absolute;
		top: 10%;
		left: 0px;
		z-index: 1;
		background-color: rgba(255, 255, 255, 0.5);
	}
			#blocker {
				position: absolute;
				width: 100%;
				height: 100%;
				background-color: rgba(0,0,0,0.5);
			}
			#instructions {
				width: 100%;
				height: 100%;
				display: -webkit-box;
				display: -moz-box;
				display: box;
				-webkit-box-orient: horizontal;
				-moz-box-orient: horizontal;
				box-orient: horizontal;
				-webkit-box-pack: center;
				-moz-box-pack: center;
				box-pack: center;
				-webkit-box-align: center;
				-moz-box-align: center;
				box-align: center;
				color: #ffffff;
				text-align: center;
				cursor: pointer;
			}
</style>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
	<div class="left-menu">
		<div>
			<label>아이템 생성</label>
			<ul>
				<c:forEach var="item" items="${itemList}">
					<li class="btn btn_default" value="${item.itemId }">
						<label>${item.itemName}</label>
						<canvas id="itemPreview${item.itemId}">
						<script type="text/javascript">previewItem(${item.itemId}, "${item.modelFileName}")</script>
						</canvas>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<menu>
	</menu>
</body>
</html>
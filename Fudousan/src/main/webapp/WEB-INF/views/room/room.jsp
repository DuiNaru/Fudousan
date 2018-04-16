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
<script src="<c:url value="/resources/js/socket.io.js"/>"></script>
<script src="<c:url value="/resources/js/vo.js"/>"></script>
<script src="<c:url value="/resources/js/CopyShader.js"/>"></script>
<script src="<c:url value="/resources/js/EffectComposer.js"/>"></script>
<script src="<c:url value="/resources/js/RenderPass.js"/>"></script>
<script src="<c:url value="/resources/js/ShaderPass.js"/>"></script>
<script src="<c:url value="/resources/js/OutlinePass.js"/>"></script>

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
		,snapshot:"${room.snapshot}"
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
	var items = [];
	var roomItems = [
		<c:forEach var="roomitem" varStatus="s" items="${roomitemList}" >
		<c:if test="${s.index != 0 }">
			,
		</c:if>
			objToRoomItem({
				color: ${roomitem.color},
				roomId: ${roomitem.roomId},
				roomitemId: ${roomitem.roomItemId},
				rotateX: ${roomitem.rotateX},
				rotateY: ${roomitem.rotateY},
				rotateZ: ${roomitem.rotateZ},
				x: ${roomitem.x},
				y: ${roomitem.y},
				z: ${roomitem.z},
				item: {
					fileDirectory: "${roomitem.item.fileDirectory}",
					itemId: ${roomitem.item.itemId},
					itemName: "${roomitem.item.itemName}",
					itemType: {
						itemTypeId: ${roomitem.item.itemType.itemTypeId},
						itemTypeName: "${roomitem.item.itemType.itemTypeName}"
					},
					modelFileName: "${roomitem.item.modelFileName}",
					text: "${roomitem.item.text}",
					itemScale: ${roomitem.item.itemScale},
					itemRotateX: ${roomitem.item.itemRotateX},
					itemRotateY: ${roomitem.item.itemRotateY},
					itemRotateZ: ${roomitem.item.itemRotateZ},
					itemX: ${roomitem.item.itemX},
					itemY: ${roomitem.item.itemY},
					itemZ: ${roomitem.item.itemZ},
					refSiteSet: [
						<c:forEach var="site" varStatus="s" items="${roomitem.item.refSiteSet}" >
						<c:if test="${s.index != 0 }">
							,
						</c:if>
							{
								creDate: "${site.creDate}",
								id: ${site.id},
								itemId: ${site.itemId},
								text: "${site.text}",
								url: "${site.url}"
							}
						</c:forEach>
					]
				}
			})
	</c:forEach>
	];
</script>
<style type="text/css">
	canvas {
	    position: fixed;
	    top: 0;
	    left: 0;
	}
	.top-menu {
		position:absolute;
		top:0%;
		margin-left: auto;
		z-index: 1;
		background-color: rgba(255, 255, 255, 0.5);
	}
	.left-menu {
		position:absolute;
		top: 10%;
		left: 0px;
		z-index: 1;
		background-color: rgba(255, 255, 255, 0.5);
	}
	.right-menu {
		position:absolute;
		top: 10%;
		right: 0px;
		z-index: 1;
		background-color: rgba(255, 255, 255, 0.5);
	}
	.preview {
		width: 100px;
		height: 100px;
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

<script>
 var socket = io('http://localhost:8000');
 
 function goback(){
	console.log('뒤로가기'); 
	socket.emit('array_back');
 };
 
 function gofront(){
	 console.log('앞으로가기');
	 socket.emit('arrayBackCancel');
 }
 function save(){
	 console.log('저장하기');
	 console.log('저장하기 눌렀습니다.');
 }
 function reset(){
	 console.log('초기화하기');
	 var clearYes = confirm('진짜 초기화 하시겠습니까?');
	  if(clearYes){
		  socket.emit('clearArray');
	  };
 }
 function esc(){
	 console.log('종료하기');
 }
 function checkArray(){
	 socket.emit('goArray1');
 }
 function AddItem(roomitem){
	console.dir(roomitem);
	 socket.emit('addItem',JSON.stringify(roomitem));
 }
 
 socket.on('takeMyOrder')
 
</script>
<script id="template" type="notjs">
	<div class="scene"></div>
	<div class="description">Scene $</div>
</script>	
<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
<div class="dat">
</div> 
	<div class="top-menu">
		<input type="button" value="삭제" onclick="deleteItem(curSelected);">
	</div>
	<div class="left-menu">
		<div>
			<label>아이템 생성</label>
			<ul>
				<c:forEach var="item" items="${itemList}">
					<li class="btn btn_default" value="${item.itemId }" onclick="createItem(item${item.itemId}, AddItem);">
						<script type="text/javascript">
							var item${item.itemId} = new Item();
							item${item.itemId}.fileDirectory = "${item.fileDirectory}";
							item${item.itemId}.itemId = ${item.itemId};
							item${item.itemId}.itemName = "${item.itemName}";
							item${item.itemId}.itemType = new ItemType(${item.itemType.itemTypeId}, "${item.itemType.itemTypeName}");
							item${item.itemId}.modelFileName = "${item.modelFileName}";
							item${item.itemId}.text = "${item.text}";
							item${item.itemId}.itemScale = ${item.itemScale};
							<c:forEach var="site" items="${item.refSiteSet}">
								item${item.itemId}.refSiteSet.push(new RefSite("${site.creDate}", ${site.id}, ${site.itemId}, "${site.text}", "${site.url}"));
							</c:forEach>
							items.push(item${item.itemId});
						</script>
						<label>${item.itemName}</label>
						<div class="preview">
							<canvas id="itemPreview${item.itemId}">
							</canvas>
						</div>
						<script type="text/javascript">previewItem(${item.itemId}, "${item.modelFileName}");</script>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="right-menu">
		<div>
			<label>종합기능</label>
			<ul>
						<li><button onclick="goback()">뒤로가기</button></li><br>
						<li><button onclick="gofront()">앞으로가기</button></li><br>
						<li><button onclick="save()">저장하기</button></li><br>
						<li><button onclick="reset()">초기화</button></li><br>
						<li><button onclick="esc()">종료</button>
						<br><br><br>
						<li><button onclick="checkArray()">Array 보기</button>
						<li><button onclick="AddItem()">의자 넣기</button>
			</ul>
		</div>
	</div>
	<menu>
	</menu>
</body>
</html>
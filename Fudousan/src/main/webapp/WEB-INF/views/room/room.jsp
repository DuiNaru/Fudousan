<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ROOMPAGE</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/loading.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/three.js"/>"></script>
<script src="<c:url value="/resources/js/TDSLoader.js"/>"></script>
<script src="<c:url value="/resources/js/OrbitControls.js"/>"></script>
<script src="<c:url value="/resources/js/DragControls.js"/>"></script>
<script src="<c:url value="/resources/js/THREE.MeshLine.js"/>"></script>
<script src="<c:url value="/resources/js/socket.io.js"/>"></script>
<script src="<c:url value="/resources/js/vo.js"/>"></script>
<script src="<c:url value="/resources/js/CopyShader.js"/>"></script>
<script src="<c:url value="/resources/js/FXAAShader.js"/>"></script>
<script src="<c:url value="/resources/js/EffectComposer.js"/>"></script>
<script src="<c:url value="/resources/js/RenderPass.js"/>"></script>
<script src="<c:url value="/resources/js/ShaderPass.js"/>"></script>
<script src="<c:url value="/resources/js/OutlinePass.js"/>"></script>
<script src="<c:url value="/resources/js/Tween.js"/>"></script>
<script src="<c:url value="/resources/js/ConvexGeometry.js"/>"></script>
<script src="<c:url value="/resources/js/QuickHull.js"/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	var room = {
		roomId:${room.roomId}
		,roomPublic:${room.roomPublic}
		,height:${room.height}
		<c:if test="${!empty room.ceilingTexture}">
		,ceilingTexture:'<c:url value='${room.ceilingTexture.file}'/>'
		</c:if>
		<c:if test="${!empty room.floorTexture}">
		,floorTexture:'<c:url value='${room.floorTexture.file}'/>'
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
					new RoomWall(
							'<c:url value='${wall.backTexture.file==null?undefined:wall.backTexture.file}'/>', 
							'<c:url value='${wall.frontTexture.file==null?undefined:wall.frontTexture.file}'/>',
							${wall.roomWallId},
							${wall.roomId},
							${wall.roomWallConnector1.connectorId},
							${wall.roomWallConnector1.x},
							${wall.roomWallConnector1.y},
							${wall.roomWallConnector2.connectorId},
							${wall.roomWallConnector2.x},
							${wall.roomWallConnector2.y},
							'${wall.type}'
					)
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
				roomItemId: ${roomitem.roomItemId},
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

	function getItemList() {
		var itemList=$("#itemList").val();
		
		$.ajax({
			url:"itemlist",
			type:"get",
			data:{
				itemTypeId:itemList
			},
			dataType: 'json',
			success: function(itemlist){
				console.dir(itemlist);
				
				var str = '';
				
				$.each(itemlist,function(index,item){
				str += '<li class="btn btn_default" value="'+item.itemId+'" onclick="createItem(item'+item.itemId+', AddItem);">';
				str += '<label>'+item.itemName+'<\/label>';
				str += '<script type="text/javascript">';
				str += 'var item'+item.itemId+' = new Item();';
				str += 'item'+item.itemId+'.fileDirectory = "'+item.fileDirectory+'";';
				str += 'item'+item.itemId+'.itemId = '+item.itemId+';';
				str += 'item'+item.itemId+'.itemName = "'+item.itemName+'";';
				str += 'item'+item.itemId+'.itemType = new ItemType('+item.itemType.itemTypeId+', "'+item.itemType.itemTypeName+'");';
				str += 'item'+item.itemId+'.modelFileName = "'+item.modelFileName+'";';
				str += 'item'+item.itemId+'.text = "'+item.text+'";';
				str += 'item'+item.itemId+'.itemScale = '+item.itemScale+';';
				
				$.each(item.refSiteSet,function(index,site){
					str +='item'+item.itemId+'.refSiteSet.push(new RefSite("'+site.creDate+'", '+site.id+', '+site.itemId+', "'+site.text+'", "'+site.url+'"));';
					str += 'items.push(item'+item.itemId+');';
				})
				
					str += "<\/script><\/li>";
				})
				console.dir(str);
				$("#itemUl").html(str);
				
		}
			
		});
	}
</script>
<script src="<c:url value="/resources/js/node_communication.js"/>"></script>
<script> </script>
<style type="text/css">
canvas {
	position: fixed;
	top: 0;
	left: 0;
}

.top-menu {
	position: absolute;
	top: 0%;
	margin-left: auto;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.5);
}

.left-menu {
	position: absolute;
	left: 0px;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.5);
}

.bottom-menu {
	position: absolute;
	bottom: 0px;
	right: 0px;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.5);
}

.right-menu {
	position: absolute;
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
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 2;
}
#blocker > div {
  position:absolute;
  top:50%;
  left:50%;
  width:100px;
  height:100px;
  margin:-50px 0 0 -50px;
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
.snapshot {
	width: 100px;
	height: 100px;
}

.imgPreview {
	width: 100px;
	height: 100px;
}
</style>

<script type="text/javascript">
	function getItemList() {
		var itemList=$("#itemList").val();
		
		$.ajax({
			url:"itemlist",
			type:"get",
			data:{
				itemTypeId:itemList
			},
			dataType: 'json',
			success: function(itemlist){
						
				var str = '';
						
				$.each(itemlist,function(index,item){
					
				str += '<li class="btn btn_default" value="'+item.itemId+'" onclick="createItem(item'+item.itemId+', AddItem);">';
				str += '<label>'+item.itemName+'<\/label>';
				str += '<script type="text/javascript">';
				str += 'var item'+item.itemId+' = new Item();';
				str += 'item'+item.itemId+'.fileDirectory = "'+item.fileDirectory+'";';
				str += 'item'+item.itemId+'.itemId = '+item.itemId+';';
				str += 'item'+item.itemId+'.itemName = "'+item.itemName+'";';
				str += 'item'+item.itemId+'.itemType = new ItemType('+item.itemType.itemTypeId+', "'+item.itemType.itemTypeName+'");';
				str += 'item'+item.itemId+'.modelFileName = "'+item.modelFileName+'";';
				str += 'item'+item.itemId+'.text = "'+item.text+'";';
				str += 'item'+item.itemId+'.itemScale = '+item.itemScale+';';
						
				$.each(item.refSiteSet,function(index,site){
					str +='item'+item.itemId+'.refSiteSet.push(new RefSite("'+site.creDate+'", '+site.id+', '+site.itemId+', "'+site.text+'", "'+site.url+'"));';
					str += 'items.push(item'+item.itemId+');';
				});
				
				str += "<\/script><\/li>";
				
				});
				$("#itemUl").html(str);
			},
			error:function(e) {
				console.log(e);
				alert("아이템 불러오기 실패");
			}
		});
	}
</script>
</head>
<body>
<div id="blocker">
	<div>
		<img src="<c:url value="/resources/image/loading.svg"/>" class="ld ld-spin"/>
	</div>
</div>
<input type="hidden" id="userId" value="${sessionScope.loginId}">
<input type="hidden" id="userName" value="${sessionScope.what_your_name}">

<script id="template" type="notjs">
	<div class="scene"></div>
	<div class="description">Scene $</div>
</script>	
<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
<div class="dat">
</div> 
	<div class="top-menu">
	</div>
	<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
	<div class="dat"></div>
	
	<!-- 위쪽 메뉴 -->
	<div class="top-menu">
		<button type="button" id="startVideoChatBtn">화상 채팅 시작</button>
		<video id="localCam" autoplay="autoplay" muted="muted"></video>
		<video id="remoteCam" autoplay="autoplay" muted="muted"></video>
	</div>
	<div id="textureInfo" class="left-menu">
		<div class="form-group">
			<label>텍스쳐 리스트</label>
			<div>
				<c:forEach var="texture" items="${textureList}">
					<div id="texture${texture.textureId }" class="form-group btn btn-default" onclick="applyTexture(${texture.textureId})">
						<label>${texture.text}</label>
						<img id="img${texture.textureId }" class="imgPreview" alt="${texture.textureId}" src="<c:url value='${texture.file}'/>">
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="itemInfo" class="left-menu">
		<div class="form-group">
			<label>아이템 이름</label>
			<p id="leftItemName" class="form-control-static"></p>
		</div>
		<div class="form-group">
			<label>아이템 유형</label>
			<p id="leftItemType" class="form-control-static"></p>
		</div>
		<div class="form-group">
			<label>아이템 설명</label>
			<p id="leftItemText" class="form-control-static"></p>
		</div>
		<div class="form-group">
			<label>아이템 참고 사이트</label>
			<p id="leftItemSite" class="form-control-static"></p>
		</div>
		<div class="form-group">
			<div>
				<label>Axis X</label> 
				<input name="itemRotateX" type="hidden">
				<div id="ax"></div>
			</div>
			<div>
				<label>Axis Y</label> 
				<input name="itemRotateY" type="hidden">
				<div id="ay"></div>
			</div>
			<div>
				<label>Axis Z</label> 
				<input name="itemRotateZ" type="hidden">
				<div id="az"></div>
			</div>
			<div>
				<label>Position X</label> 
				<input name="itemX" type="hidden">
				<div id="px"></div>
			</div>
			<div>
				<label>Position Y</label> 
				<input name="itemY" type="hidden">
				<div id="py"></div>
			</div>
			<div>
				<label>Position Z</label> 
				<input name="itemZ" type="hidden">
				<div id="pz"></div>
			</div>
		</div>
		<input type="button" value="삭제" onclick="deleteItem(curSelected.roomItem, delItem)">
		<input type="button" value="적용" onclick="itemApplyListener()">
	</div>
	
<div class="bottom-menu">

		<select id="itemList" name="itemList" onchange="getItemList()">
			<option selected>전체 </option>
			<option value="1">1</option>
			<option value="24" >24</option>
		</select>


		
		<label>${item.itemName}</label>
	
		<label>아이템 생성</label>
		<ul style="overflow: scroll;" id="itemUl">
			<c:forEach var="item" items="${itemList}">
				<li class="btn btn_default" value="${item.itemId }" onclick="createItem(item${item.itemId});">
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
					<div class="preview"></div>
					<script type="text/javascript">previewItem(${item.itemId}, "${item.modelFileName}");</script>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="right-menu">
		<div>
			<label>종합기능</label>
				<ul>
					<li><button onclick="back()">뒤로가기</button></li>
					<li><button onclick="forward()">앞으로가기</button></li>
					<li><button onclick="save()">저장하기</button></li>
					<li><button onclick="roomReset()">초기화</button></li>
					<li><button onclick="esc()">종료</button>
					<li><button onclick="takeSnapShot()">스냅샷 </button>
					<li id="snapshot">
						<c:if test="${!empty room.snapshot }">
							<img class="snapshot" src="<c:url value="${room.snapshot}"/>">
						</c:if>
					</li>
					<li>높이 <input type="text" id="height"> <button type="button" onclick="changeheight()">변경</button>   </li>
				</ul>

			<script type="text/javascript">
				function changeheight() {
					var height=$("#height").val();
					var roomId = room.roomId;	
					$.ajax({
						url:"wallheightchange",
						type:"post",
						data:{
							roomId:roomId,
							height:height
						},
						success: function(data){
							if(data != null || data == true || data == "true") {
								changeHeigthListener(height);
							} else {
								alert("방 높이 변경에 실패하였습니다.");
							}
						},
						error:function(e) {
							console.dir(e);
							alert("방 높이 변경 중 에러가 발생하였습니다.");
						}
	
					});
				}
			</script> 
		</div>
	</div>
	<menu>
	</menu>
	
	<script src="<c:url value="/resources/js/videochat.js"/>"></script>
</body>
</html>
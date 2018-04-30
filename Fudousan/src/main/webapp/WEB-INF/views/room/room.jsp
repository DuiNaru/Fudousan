<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<title>ROOMPAGE</title>

    <!-- css -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="" rel="stylesheet">
    <link href="<c:url value="/resources/css/detailedinfomationpage.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/templete.css"/>" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/loading.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/room.css"/>"/>
	
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
	<script src="<c:url value="/resources/js/MeshDepthMaterial.js"/>"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value="/resources/js/roomPageUI.js"/>"></script>
	<script src="<c:url value="/resources/js/node_communication.js"/>"></script>
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
							
					var str = '';
							
					$.each(itemlist,function(index,item){
						
						str += '<li class="btn btn_default" value="'+item.itemId+'" onclick="createItem(item'+item.itemId+');">';
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
						str += 'item'+item.itemId+'.itemPreview = "'+item.itemPreview+'";';
						
						str += "<\/script>";
		
						str += "<label>"+item.itemName+"</label>";
						str += "<div class='preview thumbnail'><img id='itemPreview"+item.itemId+"' src='/fudousan"+item.itemPreview+"'/></div><\/li>";
					
					});
					$("#itemUl").html(str);
				},
				error:function(e) {
					console.log(e);
					alert("아이템 불러오기 실패");
				}
			});
		}
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
		function changeTitle() {
			var roomTitle=$("#roomTitle").val();
			var roomId = room.roomId;	
			$.ajax({
				url:"roomTitleChange",
				type:"post",
				data:{
					roomId:roomId,
					roomTitle:roomTitle
				},
				success: function(data){
					if(data != null || data == true || data == "true") {
						nameChange(roomTitle);
						socket.emit('otherTitleChange',{
							roomId:roomId,
							roomTitle:roomTitle
						});
					} else {
						alert("방 이름 변경에 실패하였습니다.");
					}
				},
				error:function(e) {
					console.dir(e);
					alert("방 이름 변경 중 에러가 발생하였습니다.");
				}

			});
		}
		
		function nameChange(changeTitle){
			$('#roomTitle').val(changeTitle);
		}
	</script>
</head>
<body>
	<script id="template" type="notjs">
	<div class="scene"></div>
	<div class="description">Scene $</div>
	</script>	
	<div id="blocker">
		<div>
			<img src="<c:url value="/resources/image/loading.svg"/>" class="ld ld-spin"/>
			<p style="color: white;"></p>
		</div>
	</div>
<!-- email modal  -->
<%@include file="/WEB-INF/views/include/emailmodal.jsp" %>
 	
<!-- hidden value -->
<input type="hidden" value="${resultEstate.estateX}" id="lat">
<input type="hidden" value="${resultEstate.estateY}" id="lng">
<input type="hidden" value="${estateId}" id="estateId">
<input type="hidden" value="${sessionScope.memberId }" id="memberId">
		
<!-- <script src="/resources/js/emailmodal.js"></script> -->
<script type="text/javascript" src="<c:url value="/resources/js/emailmodal.js"/>"></script>
<script type="text/javascript" src="<c:url value="resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/estatedetailinit.js"/>"></script>
				
<input type="hidden" id="userId" value="${sessionScope.loginId}">
<input type="hidden" id="userName" value="${sessionScope.what_your_name}">

	<!-- 위쪽 메뉴 -->
	<div class="top-menu">
		<button type="button" id="startVideoChatBtn">화상 채팅 시작</button><br>
		<video id="localCam" autoplay="autoplay" muted="muted"></video><br>
		<video id="remoteCam" autoplay="autoplay"></video>
	</div>
	
	<div id="textureInfo" class="texture-menu">
		<div class="form-group">
			<label>텍스쳐 리스트</label>
			<div>
				<c:forEach var="texture" items="${textureList}">
					<div id="texture${texture.textureId }" class="form-group thumbnail btn col-sm-2" onclick="applyTexture(${texture.textureId})">
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
		<input type="button" value="삭제" onclick="deleteItemButton()">
		<input type="button" value="적용" onclick="itemApplyListener()">
	</div>
	
	<div class="bottom-menu">
		<div id="bottom-menu-button" class="btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span>아이템목록<span class="glyphicon glyphicon-chevron-right"></span></div>
		<div id="bottom-menu">
			<select id="itemList" name="itemList" onchange="getItemList()">
				<option value='0' selected>전체 </option>
				<c:forEach var="itemType" items="${itemTypeList }">
					<option value="${itemType.itemTypeId}">${itemType.itemTypeName}</option>
				</c:forEach>
			</select>
	
			<label>${item.itemName}</label>
		
			<label>아이템 생성</label>
			<ul id="itemUl">
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
								item${item.itemId}.itemPreview = "${item.itemPreview}";
								items.push(item${item.itemId});
						</script> 
						<label>${item.itemName}</label>
						<div class="preview thumbnail">
							<img id="itemPreview${item.itemId}" src="<c:url value="${item.itemPreview}"/>"/>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="right-menu">
		<div>
			<label>종합기능</label>
			<ul>
				<li>방이름 <input type="text" id="roomTitle" value="${room.roomTitle }"> <button type="button" onclick="changeTitle()">변경</button>   </li>
				<li><button class="btn btn-default" onclick="back()">뒤로가기</button></li>
				<li><button class="btn btn-default" onclick="forward()">앞으로가기</button></li>
				<li><button class="btn btn-default" onclick="roomReset()">초기화</button></li>
				<li><button class="btn btn-default" onclick="esc()">종료</button>
				<li><button class="btn btn-default" onclick="takeSnapShot()">스냅샷 </button>
				<li><a data-toggle="modal" href="#emailModal" class="btn btn-warning btn-lg">
					<span class="glyphicon glyphicon-envelope"></span>   E - MAIL
				</a></li>
				<li id="snapshot">
					<c:if test="${!empty room.snapshot }">
						<img class="snapshot" src="<c:url value="${room.snapshot}"/>">
					</c:if>
				</li>
				<li>높이 <input type="text" id="height"> <button type="button" onclick="changeheight()">변경</button>   </li>
			</ul>
		</div>
	</div>
	<menu>
	</menu>
	
	<script src="<c:url value="/resources/js/cookie.js"/>"></script>
	<script src="<c:url value="/resources/js/videochat.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/roomPage.js"/>"></script>
</body>
</html>
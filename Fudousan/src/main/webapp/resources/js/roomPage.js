// 카메라 이동 단위
var cameraMoveValue = 100;
// 카메라 회전 단위
var cameraRotateValue = 1;
// 카메라 상하 각도
var cameraLookAngle = 0;
// 카메라, 씬, 렌더러, 카메라 컨트롤
var camera, scene, renderer, controls;
var scenes = [];
var composer, outlinePass;
// 화면 가로 길이
var width = window.innerWidth;
// 화면 세로 길이
var height = window.innerHeight;
// 방 바닥
var roomFloor;
// 지면(사이즈)
var earthSize = 999999;
// Raycaster
var raycaster = new THREE.Raycaster();
// 마우스
var mouse = new THREE.Vector2();
// 완성된 벽 들
var walls = new THREE.Group();
// 벽 두께
var wallThickness = 10;
// 현재 화면에 존재하는 아이템들(메시 그룹)
var curRoomItems = [];
// 현재 선택 중인 아이템(메시 그룹)
var curSelected;
// 현재 선택 중인 아이템(메시 그룹)
var curSelectedOriginal;
// 현재 선택 된 아이템이 움직였는가?
var curMoving = false;
// 마우스 다운 이후로 마우스 업이 되었는가?
var isMouseUp = false;
// 정보 화면에서 아이템 정보를 변경하였는가?
var infoDataChange = false;

$(function() {
	$("#itemInfo").hide();

	$( "#ax" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, ui.value, null, null);
			$("input[name='itemRotateX']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#ay" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, null, ui.value, null);
			$("input[name='itemRotateY']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#az" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, null, null, ui.value);
			$("input[name='itemRotateZ']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#px" ).slider({
		value: 0,
		min: -100,
		max: 100,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, ui.value, null, null);
			$("input[name='itemX']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#py" ).slider({
		value: 0,
		min: -100,
		max: 100,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, null, ui.value, null);
			$("input[name='itemY']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#pz" ).slider({
		value: 0,
		min: -100,
		max: 100,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, null, null, ui.value);
			$("input[name='itemZ']").val(ui.value);
			infoDataChange = true;
		}
	});
	//초기화
	init();
	//화면 그리기
	animate();
	
	drawWall();

	$( "#blocker" ).hide();
});

function init() {
	// Loader Cache Enabled
	THREE.Cache.enabled = true;
	// 카메라 생성 및 초기화
	camera = new THREE.PerspectiveCamera(60, width / height, 10, 100000);
	camera.position.y = 10000;
	camera.lookAt(0, 0, 0);
	
	// 장면 생성
	scene = new THREE.Scene();
	// 장면 배경색
	scene.background = new THREE.Color(0xf0f0f0);
	// 장면에 AmbientLight(광역 빛) 추가
	scene.add( new THREE.AmbientLight( 0x505050 ) );

	// DirectionalLight(직선 형태의 빛) 추가
	var directionalLight = new THREE.DirectionalLight(0xffeedd);
	// 빛의 시작 점
	directionalLight.position.set(0, 0, 2);
	// 빛을 장면에 추가
	scene.add(directionalLight);

	// 렌더러
	renderer = new THREE.WebGLRenderer();
	//renderer = new THREE.WebGLRenderer( { canvas: canvas, antialias: true } );
	renderer.shadowMap.enabled = true;
	renderer.setPixelRatio( window.devicePixelRatio );
	// 렌더러 크기
	renderer.setSize(width, height);
	// 해당 렌더러를 화면에 추가하여서 사용
	document.body.appendChild( renderer.domElement );

	// controls
	controls = new THREE.OrbitControls( camera, renderer.domElement );
	//controls.addEventListener( 'change', render ); // call this only in static scenes (i.e., if there is no animation loop)
	controls.enableDamping = true; // an animation loop is required when either damping or auto-rotation are enabled
	controls.dampingFactor = 0.25;
	controls.panningMode = THREE.HorizontalPanning; // default is THREE.ScreenSpacePanning
	controls.minDistance = 100;
	controls.maxDistance = 50000;
	//controls.maxPolarAngle = Math.PI / 2;
	
	//camera.rotation.x = 90 * Math.PI / 180;

	//var roomFloorGeometry = new THREE.PlaneGeometry(roomFloorSize, roomFloorSize);
	
	roomFloor = drawFloor();
	roomFloor.rotateX(-90 * Math.PI / 180);
	scene.add(roomFloor);

	renderer.domElement.addEventListener('mousedown', this.onDocumentMouseDown, false);
	renderer.domElement.addEventListener('mousemove', this.onDocumentMouseMove, false);
	document.addEventListener('mouseup', this.onDocumentMouseUp, false);
	
	window.addEventListener('resize', this.onResize, false);
	window.addEventListener('keydown', this.onKeydown, false);
	
	
	
	var axesHelper = new THREE.AxesHelper( 1000 );
	scene.add( axesHelper );
	
	// postprocessing
	composer = new THREE.EffectComposer( renderer );
	var renderPass = new THREE.RenderPass( scene, camera );
	composer.addPass( renderPass );
	outlinePass = new THREE.OutlinePass( new THREE.Vector2( window.innerWidth, window.innerHeight ), scene, camera );
	outlinePass.edgeStrength = 3;
	outlinePass.edgeThickness = 1;
	outlinePass.visibleEdgeColor.set( 0xFFFFFF );
	composer.addPass( outlinePass );
	
	effectFXAA = new THREE.ShaderPass( THREE.FXAAShader );
	console.dir(effectFXAA);
	effectFXAA.uniforms[ 'resolution' ].value.set( 1 / window.innerWidth, 1 / window.innerHeight );
	effectFXAA.renderToScreen = true;
	composer.addPass( effectFXAA );
	
	// roomitems 의 배열의 Roomitem VO에 따라 오브젝트 추가
	$.each(roomItems, function(index, obj) {
		placeRoomItem(obj);
	});
}

function animate(time) {
	//renderer.clear();
	// 다음 프레임 지정
	requestAnimationFrame( animate );
	// 화면 회전 정보 갱신
	controls.update(); // only required if controls.enableDamping = true, or if controls.autoRotate = true

	//renderer.setViewport( 0, 0, width, height );
	//renderer.setScissor( 0, 0, width, height );
	// 화면을 렌더러에 그림
	//renderer.render( scene, camera );
	composer.render();

	/*
	scenes.forEach( function( s ) {
		// so something moves
		s.children[0].rotation.y = Date.now() * 0.001;
		// get the element that is a place holder for where we want to
		// draw the scene
		var e = s.userData.element;
		// get its position relative to the page's viewport
		var r = e.getBoundingClientRect();
		// check if it's offscreen. If so skip it
		if ( r.bottom < 0 || r.top  > renderer.domElement.clientHeight ||
			 r.right  < 0 || r.left > renderer.domElement.clientWidth ) {
			return;  // it's off screen
		}
		// set the viewport
		var width  = r.right - r.left;
		var height = r.bottom - r.top;
		var left   = r.left;
		var top    = r.top;
		//renderer.setViewport( left, top, width, height );
		//renderer.setScissor( left, top, width, height );
		var c = s.userData.camera;
		//c.aspect = width / height; // not changing in this example
		//c.updateProjectionMatrix();
		//s.userData.controls.update();
		renderer.render( s, c );
	} );*/
	
	TWEEN.update(time);
}


function onResize() {
	// 화면 가로 길이
	width = window.innerWidth;
	// 화면 세로 길이
	height = window.innerHeight;
	// 카메라 비율 재정의
	camera.aspect = width / height;
	camera.updateProjectionMatrix();
	// 렌더러 화면 크기 변경
	renderer.setSize(width, height);
	composer.setSize( width, height );
}

function onKeydown(event) {
	/*switch ( event.keyCode ) {
	case 38: // up
	case 87: // w
		camera.position.add(new THREE.Vector3(0, cameraMoveValue, 0).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.y));
		break;
	case 37: // left
	case 65: // a
		camera.position.sub(new THREE.Vector3(cameraMoveValue, 0, 0).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.y));
		break;
	case 40: // down
	case 83: // s
		camera.position.sub(new THREE.Vector3(0, cameraMoveValue, 0).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.y));
		break;
	case 39: // right
	case 68: // d
		camera.position.add(new THREE.Vector3(cameraMoveValue, 0, 0).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.y));
		break;
	case 81: // q
		camera.rotateOnAxis(new THREE.Vector3(0, 1, 0), cameraMoveValue/1000);
		break;
	case 69: // e
		camera.rotateOnAxis(new THREE.Vector3(0, 1, 0), -cameraMoveValue/1000);
		break;
	case 82: // r
		camera.position.add(new THREE.Vector3(0, 0, cameraMoveValue).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.z));
		break;
	case 70: // f
		camera.position.sub(new THREE.Vector3(0, 0, cameraMoveValue).applyAxisAngle(new THREE.Vector3(0, 0, 1), camera.rotation.z));
		break;
	case 90: // z
		cameraLookAngle -= cameraMoveValue/1000;
		camera.rotateOnAxis(new THREE.Vector3(1, 0, 0), cameraMoveValue/1000);
		break;
	case 88: // x
		cameraLookAngle += cameraMoveValue/1000;
		camera.rotateOnAxis(new THREE.Vector3(1, 0, 0), -cameraMoveValue/1000);
		break;
	}
	console.log(camera);*/
}

function onDocumentMouseDown(event) {
	
	isMouseUp = false;
	deSelect();
	
	raycaster.setFromCamera(mouse, camera);
	var intersects = raycaster.intersectObjects(curRoomItems, true);
	if (intersects.length > 0) {
		
		// 현재 배치된 모든 아이템의 매시에 클릭이 되니까, 그 메시 그룹을 가져온다.
		select(intersects[0].object.parent);
		
		// 화면 돌리기 불가
		controls.enabled = false;
	}
	
}

function onDocumentMouseMove(event) {
	// 마우스 이동 저장
	if ( !moveMouse(event) ) {
		// 제자리 그대로면 종료
		return;
	}

	if (curSelected != null && !isMouseUp && !controls.enabled) {
		// 드래그 중인 아이템이 있으면 지면에 맞게 움직인다.
		raycaster.setFromCamera(mouse, camera);
		var intersects = raycaster.intersectObjects([roomFloor]);
		if (intersects.length > 0) {
			var x = curSelected.roomItem.item.itemX;
			var y = curSelected.roomItem.item.itemY;
			var z = curSelected.roomItem.item.itemZ;
			// 원점 보정해서 움직임
			move(curSelected, intersects[0].point.x+x, intersects[0].point.y+y, intersects[0].point.z+z);
			// 움직이고 나서 움직였음을 표시한다.
			curMoving = true;
		}
	}
	
}

function onDocumentMouseUp(event) {
	isMouseUp = true;
	if(curSelected != null) {
		// 움직였으면 DB 저장
		if(curMoving) {
			curMoving = false;
			saveRoomItem(curSelected.roomItem);
			deSelect();
		}
	}
	// 컨트롤 활성화
	controls.enabled = true;
}

function moveMouse(event) {
	// Get mouse position
	var mouseX = (event.clientX / window.innerWidth) * 2 - 1;
	var mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
	
	if ( mouse.x != mouseX || mouse.y != mouseY ) {
		mouse.x = mouseX;
		mouse.y = mouseY;
	} else {
		return false;
	}
	return true;
}

/**
 * DB대로 벽을 생성한다.
 * @returns
 */
function drawWall() {
	scene.remove(walls);
	walls = new THREE.Group(); 
	for(var i = 0; i < originalWalls.length; i++) {
		var c1 = new THREE.Vector3(originalWalls[i].c1.x, originalWalls[i].c1.y, roomFloor.z);
		var c2 = new THREE.Vector3(originalWalls[i].c2.x, originalWalls[i].c2.y, roomFloor.z);
		// Cube
		var geometry = new THREE.BoxGeometry(c1.clone().sub(c2).length(), wallThickness, room.height );
		for ( var j = 0; j < geometry.faces.length; j += 2 ) {
			var hex = Math.random() * 0xffffff;
			geometry.faces[ j ].color.setHex( hex );
			geometry.faces[ j + 1 ].color.setHex( hex );
		}
		
		var material = new THREE.MeshBasicMaterial( { vertexColors: THREE.FaceColors, overdraw: 0.5 } );
		cube = new THREE.Mesh( geometry, material );

		var cubePosition= new THREE.Vector3().copy(c1).lerp(c2, 0.5);
		//cubePosition.y += room.height/2;
		cube.position.copy(cubePosition);
		
		var normal = c1.clone().sub(c2).normalize();
		var angle = Math.atan2(normal.y, normal.x);
		cube.rotateZ(angle);
		
		
		walls.add( cube );
	}
	walls.rotateX(-90*Math.PI/180);
	walls.position.y += room.height/2;
	scene.add(walls);
}

function drawFloor() {
	
	// 커넥터 추출
	var con = [];
	for(var i = 0; i < originalWalls.length; i++) {
		var c1 = new THREE.Vector2(originalWalls[i].c1.x, originalWalls[i].c1.y);
		var c2 = new THREE.Vector2(originalWalls[i].c2.x, originalWalls[i].c2.y);
		
		var flag1 = false;
		var flag2 = false;
		for(var j = 0; j < con.length; j++ ) {
			if ( c1.equals( con[j] )) flag1 = true;
			if ( c2.equals( con[j] )) flag2 = true;
		}
		
		if(!flag1) con.push(c1);
		if(!flag2) con.push(c2);
	}
	console.log(con);
	
	// 방문 기록
	var visit = [];
	// 인접 행렬 생성
	var adjMatrix = new Array(con.length);
	for(var i = 0; i < con.length; i++) {
		adjMatrix[i] = new Array(con.length);
		for(var j = 0; j < adjMatrix[i].length; j++) {
			adjMatrix[i][j] = 0;
		}
	}
	for(var i = 0; i < originalWalls.length; i++) {
		var c1 = new THREE.Vector2(originalWalls[i].c1.x, originalWalls[i].c1.y);
		var c2 = new THREE.Vector2(originalWalls[i].c2.x, originalWalls[i].c2.y);
		
		for(var j = 0; j < con.length; j++) {
			if ( con[j].equals(c1) ) {
				c1 = j;
			}
			if ( con[j].equals(c2) ) {
				c2 = j;
			}
		}
		// 대칭
		adjMatrix[c1][c2] = 1;
		adjMatrix[c2][c1] = 1;
		
	}
	console.log(adjMatrix);
	/*
	var shape = new THREE.Shape();
	// 탐색 시작
	DFS(0, adjMatrix, visit, shape, con);
	*/

	var shape = new THREE.Shape();
	//shape.autoClose = true;
	// 벽 대로 선 긋기
	/*for(var i = 0; i < originalWalls.length; i++) {
		shape.moveTo(originalWalls[i].c1.x, originalWalls[i].c1.y);
		shape.lineTo(originalWalls[i].c2.x, originalWalls[i].c2.y);
	}*/
	
	// 가장 바깥쪽 선 으로 이어서 만들기
	// 1. 시작점 (가장 왼쪽, 가장 아래)
	var startIndex = 0;
	for(var i = 1; i < con.length; i++) {
		if(con[i].x < con[startIndex].x) {
			startIndex = i;
		}
	}
	console.log("start index : " + startIndex);
	
	var pastIndex = startIndex;
	// 2. 시작점에서 연결된 지점에서 가장 왼쪽의 점으로 이동하기
	shape.moveTo(con[startIndex].x, con[startIndex].y);
	var count = 1;
	while(count <= con.length) {
		var minAngle = -1000;
		var minIndex;
		for(var i=0; i < adjMatrix[startIndex].length; i++) {
			if (adjMatrix[startIndex][i] == 1 && pastIndex != i) {
				console.log("i : " + i);
				var pastAngle = con[pastIndex].clone().sub(con[startIndex]).angle();
				var curAngle = con[i].clone().sub(con[startIndex]).angle();
				curAngle = curAngle-pastAngle;
				console.log(con[startIndex].x + ":" + con[startIndex].y + " to " + con[i].x + ":" + con[i].y + " = " + curAngle);
				if ( curAngle > minAngle ) {
					minAngle = curAngle;
					minIndex = i;
				}
			}
		}
		// 현재 점은 체크
		pastIndex = startIndex;
		shape.lineTo(con[minIndex].x, con[minIndex].y);
		if (minIndex != startIndex) {
			// 다음 점이 있을 경우,
			console.log("다음 점 으로 : " + minIndex);
			startIndex = minIndex;
			count++;
		} else {
			// 다음 점 없다.
			console.log("끝 : " + minIndex);
			break;
		}
	}
	
	
	
	var roomFloorGeometry = new THREE.PlaneGeometry( earthSize, earthSize, 32 );
	//var roomFloorGeometry = new THREE.ShapeGeometry( shape );
	var roomFloorMaterial = new THREE.MeshBasicMaterial({color:0x002200, sid:THREE.DoubleSice});
	floor = new THREE.Mesh(roomFloorGeometry, roomFloorMaterial);
	
	return floor;
}

function DFS(v, map, visit, shape, con)
{
	visit[v] = 1; // 정점 v를 방문했다고 표시
	shape.moveTo(con[v].x, con[v].y);
	for (var i = 1; i <= map.length; i++)
	{
		// 정점 v와 정점 i가 연결되었고,
		if (map[v][i] == 1)
		{
			shape.lineTo(con[i].x, con[i].y);
			//  정점 i를 방문하지 않았다면
			if (!visit[i]) {
				console.log(v+"에서 "+i+"로 이동");
				// 정점 i에서 다시 DFS를 시작한다
				DFS(i, map, visit, shape, con);
			}/* else {
				console.log(v+"에서 "+i+"로 끝");
				shape.moveTo(con[v].x, con[v].y);
			}*/
		}
	}
}

function previewItem(itemId, fileName) {
	/*console.log(itemId);
	console.log(fileName);
	// 외부 모델 로더 생성
	const loader = new THREE.TDSLoader();
	// 해당 모델의 텍스쳐 경로 설정
	loader.setPath("/fudousan/item/"+itemId+"/");
	// 모델 데이터 경로 설정 및 로딩 완료시 리스너 지정
	loader.load("/fudousan/item/"+itemId+"/"+fileName, (object) => {

		var template = document.getElementById( "template" ).text;
		// x축 기준으로 -90도 회전
		//object.rotation.x = Math.PI * -90 / 180;

		// 해당 모델을 가장 가깝게 에워싸는 육면체인 BoundingBox 생성
		var boundingBox = new THREE.Box3();
		boundingBox.setFromObject(object);

		// 바운딩 박스의 z 값을 이용하여 이동
		//object.position.z = boundingBox.max.z;
		

		var scene = new THREE.Scene();
		
		// make a list item
		var preview  = document.getElementById("itemPreview"+itemId);
		// make a list item
		var element = document.createElement( "div" );
		element.className = "list-item";
		element.innerHTML = template.replace( '$', itemId );
		// Look up the element that represents the area
		// we want to render the scene
		scene.userData.element = element.querySelector( ".scene" );
		preview.appendChild( element );
		
		var camera = new THREE.PerspectiveCamera( 50, 1, 1, 100000 );
		camera.position.z = 2;
		scene.userData.camera = camera;
		
		var controls = new THREE.OrbitControls( scene.userData.camera, scene.userData.element );
		controls.minDistance = 2;
		controls.maxDistance = 5;
		controls.enablePan = false;
		controls.enableZoom = false;
		scene.userData.controls = controls;

		scene.add( object );
		scene.add( new THREE.HemisphereLight( 0xaaaaaa, 0x444444 ) );
		

		var light = new THREE.DirectionalLight( 0xffffff, 0.5 );
		light.position.set( 1, 1, 1 );
		scene.add( light );
		
		//scenes.push( scene );
		
		// 완료 Alert 띄움
		alert("Complete");
	});*/
}

/**
 * 아이템을 DB에 추가하고 화면에 배치한다.
 * @param item Item VO 또는 RoomItem VO
 * @param onCreate 성공시 호출
 * @returns
 */
function createItem(item, onCreate) {
	var x;
	var y;
	var z;
	var itemId;
	if(item instanceof Item) {
		// 화면 가운데
		raycaster.setFromCamera( new THREE.Vector2(), camera ); 
		//raycaster.set( camera.getWorldPosition(), camera.getWorldDirection() );
		
		var intersects = raycaster.intersectObjects([roomFloor]);

		if (intersects.length > 0) {
			x = intersects[0].point.x;
			y = intersects[0].point.y;
			z = intersects[0].point.z;
			itemId = item.itemId;
		}
	} else if(item instanceof RoomItem) {
		x = item.x;
		y = item.y;
		z = item.z;
		itemId = item.item.itemId;
	} else {
		throw "아이템이 아닙니다.";
	}
	
	if (x !== undefined && y !== undefined && z !== undefined) {
		// 방 아이템 추가하고 그 아이템 가져오기
		$.ajax({
			url:"roomItem/create",
			type:"GET",
			data:{
				roomId:room.roomId,
				itemId:itemId,
				x:x,
				y:y,
				z:z,
			},
			dataType:"json",
			success:function(data) {
				if(data != null && data != "null") {
					// 받은 데이터를 roomitem vo로 변환
					var roomItem = objToRoomItem(data);
					// roomitem을 화면에 배치
					placeRoomItem(roomItem);
					
					if ( onCreate !== undefined ) {
						onCreate(roomItem);
					}
				
				} else {
					alert("아이템 배치에 실패하였습니다.");
				}
			},
			error:function(e) {
				console.log(e);
				alert("아이템 배치 중 오류가 발생하였습니다.");
			}
		});
	}
}

/**
 * 아이템을 DB와 화면에서 제거한다.
 * @param roomItem VO
 * @param onDelete 성공시 호출
 * @returns
 */
function deleteItem(roomItem, onDelete) {
	if(!(roomItem instanceof RoomItem)) {
		throw "룸 아이템이 아닙니다.";
	}
	
	$.ajax({
		url:"roomItem/delete",
		type:"GET",
		data:{
			roomItemId:roomItem.roomItemId
		},
		dataType:"json",
		success:function(data) {
			if(data != null && data != "false") {
				deplaceRoomItem(roomItem);
				if ( onDelete !== undefined ) {
					onDelete(roomItem);
				}
			
			} else {
				alert("아이템 제거에 실패하였습니다.");
			}
		},
		error:function(e) {
			console.log(e);
			alert("아이템 제거 중 오류가 발생하였습니다.");
		}
	});
}

/**
 * RoomItem VO 대로 화면에 Item 을 배치한다.
 * @param roomItem VO
 * @param onLoad 아이템 불러오기 성공시 호출되는 콜백함수
 * @param onError 아이템 불러오기 실패시 호출되는 콜백함수
 * @returns
 */
function placeRoomItem(roomItem, onLoad, onError) {
	if(!(roomItem instanceof RoomItem)) {
		throw "룸 아이템이 아닙니다.";
	}
	
	// 외부 모델 로더 생성
	const loader = new THREE.TDSLoader();
	// 해당 모델의 텍스쳐 경로 설정
	loader.setPath("/fudousan/item/"+(roomItem.item.itemId)+"/");
	// 모델 데이터 경로 설정 및 로딩 완료시 리스너 지정
	loader.load("/fudousan/item/"+(roomItem.item.itemId)+"/"+(roomItem.item.modelFileName), (object) => {
		// Group 를 확장하여 roomitem VO를 가지도록 한다.
		object.roomItem = roomItem;
		
		object.position.x = roomItem.x;
		object.position.y = roomItem.y;
		object.position.z = roomItem.z;

		/*object.rotation.x = roomItem.rotateX * Math.PI / 180;
		object.rotation.y = roomItem.rotateY * Math.PI / 180;
		object.rotation.z = roomItem.rotateZ * Math.PI / 180;*/
		object.rotateX(roomItem.rotateX * Math.PI / 180);
		object.rotateY(roomItem.rotateY * Math.PI / 180);
		object.rotateZ(roomItem.rotateZ * Math.PI / 180);
		
		object.scale.x = roomItem.item.itemScale;
		object.scale.y = roomItem.item.itemScale;
		object.scale.z = roomItem.item.itemScale;
		
		scene.add( object );

		curRoomItems.push(object);

		if ( onLoad !== undefined ) {
			onLoad();
		}
	}, undefined, onError);
}


/**
 * 해당 룸아이템을 찾아서 배치 해제한다.
 * @param roomItem
 * @returns true 또는 false
 */
function deplaceRoomItem(roomItem) {
	if(!(roomItem instanceof RoomItem)) {
		throw "룸 아이템이 아닙니다.";
	}
	
	for(var i = 0; i < curRoomItems.length; i++) {
		if ( curRoomItems[i].roomItem.roomItemId == roomItem.roomItemId ) {
			if ( curSelected == curRoomItems[i] ) deSelect();
			scene.remove(curRoomItems[i]);
			//curRoomItems = curRoomItems.splice(i, 1);
			console.dir(curRoomItems);
			return true;
		}
	}
	return false;
}


/**
 * 화면에 배치된 object을 특정 좌표로 이동
 * @param object
 * @param x
 * @param y
 * @param z
 * @returns
 */
function move(object, x, y, z) {
	
	if ( x != null ) {

		object.roomItem.x = object.position.x = x;
		
	}
	
	if ( y != null ) {

		object.roomItem.y = object.position.y = y;
		
	}
	
	if ( z != null ) {

		object.roomItem.z = object.position.z = z;
		
	}
	
}

/**
 * 화면에 배치된 object을 각 축을 기준으로 회전
 * @param object
 * @param rx 도
 * @param ry 도
 * @param rz 도
 * @returns
 */
function rotate(object, rx, ry, rz) {
	
	if ( rx != null ) {
		object.rotation.x = rx * Math.PI / 180;
		object.roomItem.rotateX = rx;
		
	}
	
	if ( ry != null ) {
		object.rotation.y = ry * Math.PI / 180;
		object.roomItem.rotateY = ry;
		
	}
	
	if ( rz != null ) {
		object.rotation.z = rz * Math.PI / 180;
		object.roomItem.rotateZ = rz;
		
	}
	
}

function select(group) {
	curSelected = group;
	
	curSelectedOriginal = group.roomItem.clone();
	
	// 선택 상태 아웃 라인 표시
	outlinePass.selectedObjects = curSelected.children;

	initInfo();
}

function deSelect() {
	if ( infoDataChange ) {
		curSelected.roomItem = curSelectedOriginal;
		applyRoomItem(curSelected);
		curSelectedOriginal = null;
	}
	
	curSelected = null;
	// 선택 상태 아웃 라인 표시
	outlinePass.selectedObjects = [];
	
	resetInfo();
}

/**
 * roomitem의 값을 저장한다.
 * @param roomItem
 * @returns
 */
function saveRoomItem(roomItem) {
	if(!(roomItem instanceof RoomItem)) {
		throw "룸 아이템이 아닙니다.";
	}
	
	var refSiteSet = roomItem.item.refSiteSet;
	roomItem.item.refSiteSet = null;
	$.ajax({
		url:"roomItem/save",
		type:"POST",
		data: JSON.stringify(roomItem),
		contentType: 'application/json; charset=utf-8',
		dataType:"json",
		success:function(data) {
			if(data != null && data != 0) {

			} else {
				alert("아이템 저장에 실패하였습니다.");
			}
		},
		error:function(e) {
			console.log(e);
			alert("아이템 저장 중 오류가 발생하였습니다.");
		}
	});
	roomItem.item.refSiteSet = refSiteSet;
}

/**
 * 좌측 X축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRX(value) {
	$("input[name='itemRotateX']").val(value);
	$( "#ax" ).slider("value", value);
}


/**
 * 좌측 Y축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRY(value) {
	$("input[name='itemRotateY']").val(value);
	$( "#ay" ).slider("value", value);
}


/**
 * 좌측 Z축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRZ(value) {
	$("input[name='itemRotateZ']").val(value);
	$( "#az" ).slider("value", value);
}

/**
 * 좌측 X축 바 설정
 * @param value
 * @returns
 */
function setInfoX(value) {
	$("input[name='itemX']").val(value);
	$( "#px" ).slider("option", "min", value-100);
	$( "#px" ).slider("option", "max", value+100);
	$( "#px" ).slider("value", value);
}

/**
 * 좌측 Y축 바 설정
 * @param value
 * @returns
 */
function setInfoY(value) {
	$("input[name='itemY']").val(value);
	$( "#py" ).slider("option", "min", value-100);
	$( "#py" ).slider("option", "max", value+100);
	$( "#py" ).slider("value", value);
}

/**
 * 좌측 Z축 바 설정
 * @param value
 * @returns
 */
function setInfoZ(value) {
	$("input[name='itemZ']").val(value);
	$( "#pz" ).slider("option", "min", value-100);
	$( "#pz" ).slider("option", "max", value+100);
	$( "#pz" ).slider("value", value);
}

/**
 * 해당 three js 객체의 roomItem의 값대로 해당 객체를 변경한다.
 * @param object
 * @returns
 */
function applyRoomItem(object) {
	object.position.x = object.roomItem.x;
	object.position.y = object.roomItem.y;
	object.position.z = object.roomItem.z;
	object.rotation.x = object.roomItem.rotateX * Math.PI / 180;
	object.rotation.y = object.roomItem.rotateY * Math.PI / 180;
	object.rotation.z = object.roomItem.rotateZ * Math.PI / 180;
}

/**
 * 아이템 정보창을 초기화(시작) 한다.
 * @returns
 */
function initInfo() {
	$("#leftItemName").html(curSelected.roomItem.item.itemName);
	$("#leftItemType").html(curSelected.roomItem.item.itemType.itemTypeName);
	$("#leftItemText").html(curSelected.roomItem.item.text);
	$("#leftItemSite").html(curSelected.roomItem.item.refSiteSet);

	setInfoX(curSelected.roomItem.x);
	setInfoY(curSelected.roomItem.y);
	setInfoZ(curSelected.roomItem.z);
	setInfoRX(curSelected.roomItem.rotateX);
	setInfoRY(curSelected.roomItem.rotateY);
	setInfoRZ(curSelected.roomItem.rotateZ);
	
	$("#itemInfo").show( "slide" );
}

/**
 * 아이템 정보창을 초기화(끝) 한다.
 * @returns
 */
function resetInfo() {
	$("#leftItemName").empty();
	$("#leftItemType").empty();
	$("#leftItemText").empty();
	$("#leftItemSite").empty();
	
	setInfoX(0);
	setInfoY(0);
	setInfoZ(0);
	setInfoRX(0);
	setInfoRY(0);
	setInfoRZ(0);
	
	infoDataChange = false;
	
	$("#itemInfo").hide( "slide" );
}

function itemApplyListener() {
	applyItemChange(curSelected.roomItem);
}

/**
 * 아이템 변경사항을 적용한다.
 * @param roomItem 
 * @returns
 */
function applyItemChange(roomItem) {
	if(!(roomItem instanceof RoomItem)) {
		throw "룸 아이템이 아닙니다.";
	}
	
	$( "#blocker" ).show();
	$.ajax({
		url:"roomItem/modify",
		type:"POST",
		data:JSON.stringify(roomItem),
		contentType: 'application/json; charset=utf-8',
		dataType:"json",
		success:function(data) {
			
			if(data != null && data != false && data != "false") {
				
				infoDataChange = false;
				
			} else {
				
				alert("아이템 변경에 실패하였습니다.");
				
			}

			$( "#blocker" ).hide();
			
		},
		error:function(e) {
			
			console.log(e);
			alert("아이템 변경 중 오류가 발생하였습니다.");

			$( "#blocker" ).hide();
			
		}
	});
}

function reset() {
	$.ajax({
		url:"roomItem/reset",
		type:"POST",
		data:{roomId:room.roomId},
		dataType:"json",
		success:function(data) {
			
			if(data != null && data != false && data != "false") {

				for( var i = curRoomItems.length - 1; i >= 0; i--) {
					scene.remove(curRoomItems[i]);
				}
				
				curRoomItems = [];
				curSelected = null;
				curSelectedOriginal = null;
				
			} else {
				
				alert("리셋에 실패하였습니다.");
				
			}

			$( "#blocker" ).hide();
			
		},
		error:function(e) {
			
			console.log(e);
			alert("리셋 중 오류가 발생하였습니다.");

			$( "#blocker" ).hide();
			
		}
	});
}

//-------------
// socket 통신
//-------------
let sendCreateItem = function(obj){
	// 현재 방 번호와 만들 아이템 번호를 전송합니다.
	socket.emit("create-item", {
		roomId: room.roomId,
		itemId: obj.itemId
	});
}

let sendStartDrag = function(obj){
	// 현재 방 번호와 이동할 아이템 이름을 전송합니다.
	socket.emit("start-drag", {
		roomId: room.roomId,
		name: obj.name
	});
}

let sendMoveItem = function(obj){
	// 현재 방 번호와 아이템의 위치 정보를 전송합니다.
	socket.emit("move-item", {
		roomId: room.roomId,
		name: obj.name,
		x: obj.position.x,
		y: obj.position.y,
		z: obj.position.z,
		rx: obj.rotation.x,
		ry: obj.rotation.y,
		rz: obj.rotation.z
	});
}

let sendDeleteItem = function(obj){
	// 현재 방 번호와 삭제할 아이템 이름을 전송합니다.
	socket.emit("delete-item", {
		roomId: room.roomId,
		name: obj.name
	});
}

socket.on("create-item", function(data){
	// 다른 사람에게 아이템 생성 신호를 받는 부분입니다.
	// 신호를 받으면 자신에게 전달 받은 아이템 번호를 이용하여
	// 화면에 추가합니다.
	
});

socket.on("start-drag", function(data){
	// 이름을 이용하여 해당하는 아이템 찾습니다.
	let object = scene.getObjectByName(data.itemId);

	// 해당 아이템이 컨트롤 중이라는 것을 색깔로 표시합니다.
	for (let i = 0; i < object.children.length; i++){
		object.children[i].material.emissive.setHex(0x7a0000);
	}
});

socket.on("move-item", function(data){
	// 이름을 이용하여 해당하는 아이템을 찾습니다.
	let object = scene.getObjectByName(data.itemId);

	// 해당 아이템의 색깔을 원래 색으로 돌립니다.
	for (let i = 0; i < object.children.length; i++){
		object.children[i].material.emissive.setHex(0);
	}

	// 애니메이션 시작 위치
	let start = {
		x: object.position.x,
		y: object.position.y,
		z: object.position.z,
		rx: object.rotation.x,
		ry: object.rotation.y,
		rz: object.rotation.z
	};

	// 애니메이션 끝 위치
	let target = {
		x: data.positionX,
		y: data.positionY,
		z: data.positionZ,
		rx: data.rx,
		ry: data.ry,
		rz: data.rz
	};
	
	// 애니메이션 설정
	let tween = new TWEEN.Tween(position).to(target, 1000);
	tween.onUpdate(function(){
		object.position.x = start.x;
		object.position.y = start.y;
		object.position.z = start.z;
		object.rotation.x = start.rx;
		object.rotation.y = start.ry;
		object.rotation.z = start.rz;
	});
	tween.easing(TWEEN.Easing.Exponential.Out);
	
	// 애니메이션 적용
	tween.start();
});

// 카메라 이동 단위
var cameraMoveValue = 100;
// 카메라 회전 단위
var cameraRotateValue = 1;
// 카메라 상하 각도
var cameraLookAngle = 0;
// 카메라, 씬, 렌더러, 카메라 컨트롤
var camera, scene, renderer, controls;
var scenes = [];
// 화면 가로 길이
var width = window.innerWidth;
// 화면 세로 길이
var height = window.innerHeight;
// 지면
var plane;
// 지면(사이즈)
var planeSize = 999999;
// Raycaster
var raycaster = new THREE.Raycaster();
// 마우스
var mouse = new THREE.Vector2();
// 완성된 벽 들
var walls = new THREE.Group();
// 벽 두께
var wallThickness = 10;
// 배치된 아이템 VO
var roomItems = []
// 현재 화면에 존재하는 아이템들
var curRoomItems = [];

/**
 * Item VO
 * @returns
 */
function Item() {
	this.fileDirectory = "";
	this.itemId = -1;
	this.itemName = "";
	this.itemType = new ItemType();
	this.modelFileName = "";
	this.siteSet = [];
	this.text = "";
	this.itemScale = 1;
}

/**
 * ItemType VO
 * @param itemTypeId
 * @param itemTypeName
 * @returns
 */
function ItemType(itemTypeId, itemTypeName) {
	this.itemTypeId = itemTypeId;
	this.itemTypeName = itemTypeName;
}

/**
 * RefSite VO
 * @param creDate
 * @param id
 * @param itemId
 * @param text
 * @param url
 * @returns
 */
function RefSite(creDate, id, itemId, text, url) {
	this.creDate = creDate;
	this.id = id;
	this.itemId = itemId;
	this.text = text;
	this.url = url;
}

function RoomItem() {
	this.color = 0;
	this.item = new Item();
	this.roomId = -1;
	this.roomItemId = -1;
	this.rotateX = 0;
	this.rotateY = 0;
	this.rotateZ = 0;
	this.x = 0;
	this.y = 0;
	this.z = 0;
}

document.addEventListener("DOMContentLoaded", function(){
	//초기화
	init();
	//화면 그리기
	animate();
	
	drawWall();
	});


function init() {
	// 카메라 생성 및 초기화
	camera = new THREE.PerspectiveCamera(60, width / height, 100, 100000);
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
	controls.maxPolarAngle = Math.PI / 2;
	
	//camera.rotation.x = 90 * Math.PI / 180;

	var planeGeometry = new THREE.PlaneGeometry(planeSize, planeSize);
	var planeMaterial = new THREE.MeshBasicMaterial({color:0x002200, sid:THREE.DoubleSice});
	plane = new THREE.Mesh(planeGeometry, planeMaterial);
	plane.rotateX(-90 * Math.PI / 180);
	scene.add(plane);

	renderer.domElement.addEventListener('mousedown', this.onDocumentMouseDown, false);
	renderer.domElement.addEventListener('mousemove', this.onDocumentMouseMove, false);
	document.addEventListener('mouseup', this.onDocumentMouseUp, false);
	
	window.addEventListener('resize', this.onResize, false);
	window.addEventListener('keydown', this.onKeydown, false);
	
	
	
	
	
}

function animate() {
	renderer.clear();
	// 다음 프레임 지정
	requestAnimationFrame( animate );
	// 화면 회전 정보 갱신
	controls.update(); // only required if controls.enableDamping = true, or if controls.autoRotate = true

	renderer.setViewport( 0, 0, width, height );
	renderer.setScissor( 0, 0, width, height );
	// 화면을 렌더러에 그림
	renderer.render( scene, camera );

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
	} );
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
}

function onDocumentMouseMove(event) {
	// 마우스 이동 저장
	moveMouse(event);
}

function onDocumentMouseUp(event) {
}

function moveMouse(event) {
	// Get mouse position
	var mouseX = (event.clientX / window.innerWidth) * 2 - 1;
	var mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
	
	mouse.x = mouseX;
	mouse.y = mouseY;
}

/**
 * DB대로 벽을 생성한다.
 * @returns
 */
function drawWall() {
	scene.remove(walls);
	walls = new THREE.Group(); 
	for(var i = 0; i < originalWalls.length; i++) {
		var c1 = new THREE.Vector3(originalWalls[i].c1.x, originalWalls[i].c1.y, plane.z);
		var c2 = new THREE.Vector3(originalWalls[i].c2.x, originalWalls[i].c2.y, plane.z);
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
	console.log(walls);
	scene.add(walls);
}

function previewItem(itemId, fileName) {
	console.log(itemId);
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
	});
}

/**
 * 아이템을 불러와서 배치한다.
 * @param item VO
 * @returns
 */
function createItem(item) {
	// 화면 가운데로 이동
	raycaster.setFromCamera( new THREE.Vector2(), camera ); 
	//raycaster.set( camera.getWorldPosition(), camera.getWorldDirection() );
	var intersects = raycaster.intersectObjects([plane]);
	if (intersects.length > 0) {
		// DB 연결
		$.ajax({
			url:"roomItem/create",
			type:"GET",
			data:{
				roomId:room.roomId,
				itemId:item.itemId,
				x:intersects[0].point.x,
				y:intersects[0].point.y,
				z:intersects[0].point.z,
			},
			dataType:"json",
			success:function(data) {
				if(data != null && data != "null") {

					var roomItem = new RoomItem();
					roomItem.color = data.color;
					roomItem.roomId = data.roomId;
					roomItem.roomItemId = data.roomItemId;
					roomItem.rotateX = data.rotateX;
					roomItem.rotateY = data.rotateY;
					roomItem.rotateZ = data.rotateZ;
					roomItem.x = data.x;
					roomItem.y = data.y;
					roomItem.z = data.z;
					var item = new Item();
					item
					roomItem.item = item;
					console.log(roomItem);
					addRoomItem(roomItem);
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
 * 아이템을 제거한다.
 * @param item
 * @returns
 */
function deleteItem(item) {
	
}

/**
 * RoomItem VO 대로 화면에 Item 을 배치한다.
 * @param roomItem
 * @returns
 */
function addRoomItem(roomItem) {
	roomItems.push(roomItem);
	
	// 외부 모델 로더 생성
	const loader = new THREE.TDSLoader();
	// 해당 모델의 텍스쳐 경로 설정
	loader.setPath("/fudousan/item/"+(roomItem.item.itemId)+"/");
	// 모델 데이터 경로 설정 및 로딩 완료시 리스너 지정
	loader.load("/fudousan/item/"+(roomItem.item.itemId)+"/"+(roomItem.item.modelFileName), (object) => {
		
		object.position.x = roomItem.x;
		object.position.y = roomItem.y;
		object.position.z = roomItem.z;

		object.rotation.x = roomItem.rotateX;
		object.rotation.y = roomItem.rotateY;
		object.rotation.z = roomItem.rotateZ;
		
		scene.add( object );
		curRoomItems.push(object);
		// 완료 Alert 띄움
		alert("Complete");
	});
}

function jsonToItem(itemJson) {
	var item = new Item();
	item.fileDirectory = itemJson.fileDirectory;
	item.itemId = itemJson.itemId;
	item.itemName = itemJson.itemName;
	item.itemType = new ItemType(itemJson.itemType.itemTypeId, itemJson.itemType.itemTypeName);
	item.modelFileName = itemJson.modelFileName;
	item.text = itemJson.text;
	item.itemScale = itemJson.itemScale;
	$.each(itemJson.refSiteSet, function(index, obj) {
		item.siteSet.push(new RefSite(obj.creDate, obj.id, obj.itemId, obj.text, obj.url));
	});
	return item;
}
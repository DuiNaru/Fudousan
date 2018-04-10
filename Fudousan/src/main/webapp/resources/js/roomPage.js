/**
 * 
 */
// 카메라 이동 단위
var cameraMoveValue = 100;
// 카메라, 씬, 렌더러, 카메라 컨트롤
var camera, scene, renderer, control;
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
	// 카메라 기본 위치를 z 방향으로 200만큼 위에 위치
	camera.position.z = 6000;

	// 카메라에 맞춰서 돌리기 컨트롤을 생성
	controls = new THREE.TrackballControls(camera);
	
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
	renderer.setPixelRatio( window.devicePixelRatio );
	// 렌더러 크기
	renderer.setSize(width, height);
	// 해당 렌더러를 화면에 추가하여서 사용
	document.body.appendChild( renderer.domElement );

	var planeGeometry = new THREE.PlaneGeometry(planeSize, planeSize);
	var planeMaterial = new THREE.MeshBasicMaterial({color:0xdddddd, sid:THREE.DoubleSice});
	plane = new THREE.Mesh(planeGeometry, planeMaterial);
	scene.add(plane);

	renderer.domElement.addEventListener('mousedown', this.onDocumentMouseDown, false);
	renderer.domElement.addEventListener('mousemove', this.onDocumentMouseMove, false);
	document.addEventListener('mouseup', this.onDocumentMouseUp, false);
	
	window.addEventListener('resize', this.onResize, false);
	window.addEventListener('keydown', this.onKeydown, false);
}

function animate() {
	// 화면 회전 정보 갱신
	controls.update();
	// 화면을 렌더러에 그림
	renderer.render( scene, camera );
	// 다음 프레임 지정
	requestAnimationFrame( animate );
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
	// 키 눌림 이벤트
	switch(event.key) {
	case 'w':
		camera.position.y += cameraMoveValue;
		break;
	case 'a':
		camera.position.x -= cameraMoveValue;
		break;
	case 's':
		camera.position.y -= cameraMoveValue;
		break;
	case 'd':
		camera.position.x += cameraMoveValue;
		break;
	case 'q':
		camera.position.z += cameraMoveValue;
		break;
	case 'e':
		camera.position.z -= cameraMoveValue;
		break;
	}
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
		var cubeVector = new THREE.Vector3().copy(c1).lerp(c2, 0.5);
		cubeVector.z += room.height/2;
		cube.position.copy(cubeVector);
		
		var angle = new THREE.Vector3(1,0,0).angleTo(c1.clone().sub(c2).normalize());
		cube.rotateZ(angle);
		walls.add( cube );
	}
	console.log(walls);
	scene.add(walls);
}
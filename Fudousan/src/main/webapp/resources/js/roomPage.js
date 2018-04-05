/**
 * 3D 모델링 편집 화면 스크립트
 */
// 카메라, 씬, 렌더러
var camera, scene, renderer;
// 카메라 높이(z)
var cameraZ = 6000;
// 화면 가로 길이
var width = window.innerWidth;
// 화면 세로 길이
var height = window.innerHeight;
// 그림판(도면)
var plane;
// 그림판(사이즈)
var planeSize = 999999;
// Raycaster
var raycaster = new THREE.Raycaster();
// 마우스
var mouse = new THREE.Vector2();
// 벽 시작 지점
var startPoint;
// 벽 끝 지점
var endPoint;
// 현재 그리는 중인가?
var isDrawing = false;
// 그리기 선
var drawingLine;
// 완성된 벽 들
var walls = [];
// 완성된 점 들
var dots = [];
// 현재 그려진 벽
var sceneLines = [];
// 현재 그려진 점
var sceneDots = [];
// 단위 길이
var vectorPerLength = 100;
// 점 스냅 가중치
var pointSnapAdv = 1;
// 보조 선
var supportLines = [];
// 배경 보조선
var backgroundLines;

//초기화
init();
//화면 그리기
animate();

function init() {
	// 카메라 생성 및 초기화
	camera = new THREE.PerspectiveCamera(60, width / height, 0.1, 100000);
	// 카메라 기본 위치를 z 방향으로 200만큼 위에 위치
	camera.position.z = cameraZ;

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
	renderer.setSize( window.innerWidth, window.innerHeight );
	// 해당 렌더러를 화면에 추가하여서 사용
	document.body.appendChild( renderer.domElement );

	var planeGeometry = new THREE.PlaneGeometry(planeSize, planeSize);
	var planeMaterial = new THREE.MeshBasicMaterial({color:0xffffff, sid:THREE.DoubleSice});
	plane = new THREE.Mesh(planeGeometry, planeMaterial);
	scene.add(plane);
	
	drawBackgroundLines();

	document.addEventListener('mousedown', this.onDocumentMouseDown, false);
	document.addEventListener('mousemove', this.onDocumentMouseMove, false);
	document.addEventListener('mouseup', this.onDocumentMouseUp, false);
}

function drawBackgroundLines() {
	var cameraToPlane = new THREE.Vector3().copy(camera.position);
	var z = 0;
	var y = 0;
	var x = 0;
	for(var i = 0; i < Math.tan((90-camera.fov/2) / Math.PI * 180)*cameraToPlane.length() && i < planeSize; i += vectorPerLength) {
		var material = new THREE.LineBasicMaterial({color:0xdddddd});
		
		var geometry = new THREE.Geometry();
		geometry.vertices.push(new THREE.Vector3(x-planeSize,y+i,z));
		geometry.vertices.push(new THREE.Vector3(x+planeSize,y+i,z));
		var line = new THREE.Line(geometry, material);

		scene.add(line);

		geometry = new THREE.Geometry();
		geometry.vertices.push(new THREE.Vector3(x-planeSize,y-i,z));
		geometry.vertices.push(new THREE.Vector3(x+planeSize,y-i,z));
		line = new THREE.Line(geometry, material);
		
		scene.add(line);
		
		geometry = new THREE.Geometry();
		geometry.vertices.push(new THREE.Vector3(x+i,y-planeSize,z));
		geometry.vertices.push(new THREE.Vector3(x+i,y+planeSize,z));
		line = new THREE.Line(geometry, material);
		
		scene.add(line);
		
		geometry = new THREE.Geometry();
		geometry.vertices.push(new THREE.Vector3(x-i,y-planeSize,z));
		geometry.vertices.push(new THREE.Vector3(x-i,y+planeSize,z));
		line = new THREE.Line(geometry, material);
		
		scene.add(line);
	}
}

function animate() {
	// 화면을 렌더러에 그림
	renderer.render( scene, camera );
	// 다음 프레임 지정
	requestAnimationFrame( animate );
}

function onDocumentMouseDown(event) {
	moveMouse(event);
	
	raycaster.setFromCamera(mouse, camera);
	var intersects = raycaster.intersectObjects([plane]);

	if (intersects.length > 0) {
		isDrawing = true;
		
		// 마우스 끝 지점 생성
		endPoint = new THREE.Mesh(new THREE.CircleGeometry(50, 32), new THREE.MeshBasicMaterial({color:0x000000}));
		endPoint.position.copy(snapVector3(intersects[0].point, event.shiftKey, event.ctrlKey));
		
		drawingLine = new THREE.Line(new THREE.Geometry(), new THREE.LineBasicMaterial({color:0x000000}));
		scene.add(drawingLine);
	}
}

function onDocumentMouseMove(event) {
	moveMouse(event);

	raycaster.setFromCamera(mouse, camera);
	var intersects = raycaster.intersectObjects([plane]);

	if (intersects.length > 0) {
		if (isDrawing) {
			// 선 그리기 및 끝점
			endPoint.position.copy(snapVector3(intersects[0].point, event.shiftKey, event.ctrlKey));
			scene.add(endPoint);
			// 그리기 선
			scene.remove(drawingLine);
			var geometry = new THREE.Geometry();
			geometry.vertices.push(startPoint.position);
			geometry.vertices.push(endPoint.position);
			drawingLine = new THREE.Line(geometry, new THREE.LineBasicMaterial({color:0x333333}));
			scene.add(drawingLine);
		} else {
			// 마우스 시작 지점 생성
			if(startPoint !=null) scene.remove(startPoint);
			startPoint = new THREE.Mesh(new THREE.CircleGeometry(50, 32), new THREE.MeshBasicMaterial({color:0x000000}));
			startPoint.position.copy(snapVector3(intersects[0].point, event.shiftKey, event.ctrlKey));
			scene.add(startPoint);
		}
	}
}

function onDocumentMouseUp(event) {
	moveMouse(event);

	if (event.altKey) {
		raycaster.setFromCamera(mouse, camera);
		var intersects = raycaster.intersectObjects([plane]);
		if (intersects.length > 0) {
			var nearWall = findNearWall(intersects[0].point, 1);
			console.log(nearWall);
			walls.splice(nearWall, 1);
			redraw();
		}
	}
	console.log(isDrawing);
	console.log(walls);
	
	if (isDrawing) {
		// 현재 위치에 대한 점이 존재하는가?
		// START
		var start = -1;
		var end = -1;
		for(var d = 0; d < dots.length; d++) {
			if (new THREE.Vector3().copy(dots[d]).sub(startPoint).length() < vectorPerLength*pointSnapAdv) {
				start = d;
			}
			if (new THREE.Vector3().copy(dots[d]).sub(endPoint).length() < vectorPerLength*pointSnapAdv) {
				end = d;
			}
		}
		if(start == -1) {
			dots.push(startPoint.position);
			start = dots.length-1;
		}
		if(end == -1) {
			dots.push(endPoint.position);
			end = dots.length-1;
		}
		// END
		
		// 검사 전 점들의 갯수
		var beforeDots = dots.length;
		// 새로 추가된 벽 갯수
		var newWalls = 0;
		// 기존에 겹치는 지점이 있는지 검사
		for(var i = 0; i < walls.length-newWalls; i++) {
			var intersectPoint = getIntersectPoint(dots[walls[i].startPoint], dots[walls[i].endPoint], dots[start], dots[end]);
			if(intersectPoint != null) {
				dots.push(intersectPoint);
				// 겹치는 벽이 존재할 경우 쪼개기
				walls.push({
					startPoint:walls[i].startPoint,
					endPoint:dots.length-1
					});
				walls.push({
					startPoint:walls[i].endPoint,
					endPoint:dots.length-1
					});

				walls.splice(i, 1);
				
				i--;
				newWalls += 2;
			}
		}
		// 새로 추가하는 선을 쪼개기 위한 정렬
		var array = [start, end];
		for(var i = beforeDots; i < dots.length; i++) {
			array.push(i);
		}
		for(var i = 0; i < array.length; i++) {
			for(var j = i+1; j < array.length; j++) {
				if(dots[array[i]].x < dots[array[j]].x) {
					var t = array[i];
					array[i] = array[j];
					array[j] = t;
				}
			}
		}

		// 정렬된 순서대로 시작부터 끝까지 벽 추가
		for(var i = 0; i < array.length-1; i++) {
			walls.push({startPoint:array[i], endPoint:array[i+1]});
		}
		
		
		isDrawing = false;
		scene.remove(startPoint);
		scene.remove(endPoint);
		scene.remove(drawingLine);
		
		redraw();
	}
	
	raycaster.setFromCamera(mouse, camera);
	var intersects = raycaster.intersectObjects([plane]);

	if (intersects.length > 0) {
	}
}

function redraw() {

	// 예전 벽 삭제
	for(var i = 0; i < sceneLines.length; i++) {
		scene.remove(sceneLines[i]);
	}
	sceneLines = [];
	// 예전 점 삭제
	for(var i = 0; i < sceneDots.length; i++) {
		scene.remove(sceneDots[i]);
	}
	sceneDots = [];
	// 화면에 벽 그리기
	for(var i = 0; i < walls.length; i++) {
		var wallLineGeometry = new THREE.Geometry();
		
		var start = new THREE.Vector3();
		start.x = dots[walls[i].startPoint].x;
		start.y = dots[walls[i].startPoint].y;
		start.z = plane.position.z;
		
		var end = new THREE.Vector3();
		end.x = dots[walls[i].endPoint].x;
		end.y = dots[walls[i].endPoint].y;
		end.z = plane.position.z;
		
		wallLineGeometry.vertices.push(start);
		wallLineGeometry.vertices.push(end);
		sceneLines.push(new THREE.Line(wallLineGeometry, new THREE.LineBasicMaterial({color:0x0000ff})));
	}
	// 갱신된 벽 추가
	for(var i = 0; i < sceneLines.length; i++) {
		scene.add(sceneLines[i]);
	}
	
	// 화면에 점 그리기
	for(var i = 0; i < dots.length; i++) {
		var geometry = new THREE.CircleGeometry( 50, 32 );
		var material = new THREE.MeshBasicMaterial( { color: 0xffff00 } );
		var circle = new THREE.Mesh( geometry, material );
		circle.position.copy(dots[i]);
		sceneDots.push(circle);
	}
	// 갱신된 점 추가
	for(var i = 0; i < sceneDots.length; i++) {
		scene.add(sceneDots[i]);
	}
}

function moveMouse(event) {
	// Get mouse position
	var mouseX = (event.clientX / window.innerWidth) * 2 - 1;
	var mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
	
	mouse.x = mouseX;
	mouse.y = mouseY;
}

function snapVector3(vector3, shiftKey, ctrlKey, altKey) {
	
	if(walls.length > 0) {
		var v3 = findNearWall(vector3, 0);
		if(v3 != null) vector3 = v3;
	}
	
	if(shiftKey == null || shiftKey == false) {
		// 쉬프트 키가 눌리지 않았으면 스냅 하지 않는다.
		return vector3;
	}
	
	var v3 = new THREE.Vector3().copy(vector3);
	v3.x = Math.round(vector3.x / vectorPerLength) * vectorPerLength;
	v3.y = Math.round(vector3.y / vectorPerLength) * vectorPerLength;
	
	if(ctrlKey == null || ctrlKey == false) {
		// 컨트롤 키가 눌리지 않았으면, 처음 위치값 만큼 보정해준다.
		v3.x += startPoint.position.x%vectorPerLength;
		v3.y += startPoint.position.y%vectorPerLength;
	}
	
	return v3;
}

function findNearWall(vector3, returnType) {
	
	var minLength;
	var minIndex;
	var minPoint;
	var minWall;

	// AB의 선과 C의 점과의 가장 가까운 위치 및 거리
	// http://gpgstudy.com/forum/viewtopic.php?t=22736
	for(var i = 0; i < walls.length; i++) {
		// 점 스냅 우선순위
		// 현재 점 근처인가?
		if (new THREE.Vector3().copy(vector3).sub(dots[walls[i].startPoint]).length() < vectorPerLength*pointSnapAdv) {
			return dots[walls[i].startPoint];
		}
		if (new THREE.Vector3().copy(vector3).sub(dots[walls[i].endPoint]).length() < vectorPerLength*pointSnapAdv) {
			return dots[walls[i].endPoint];
		}
		
		// 각 벽 부터 거리 계산하여 최소 거리의 벽 계산
		// 우선 A->B
		var ab = new THREE.Vector3().subVectors(dots[walls[i].endPoint], dots[walls[i].startPoint]);
		// A->B 길이 저장
		var abLength = ab.length();
		// 단위 벡터 로 변환
		ab.normalize();
		// A->C
		var ac = new THREE.Vector3().subVectors(vector3, dots[walls[i].startPoint]);
		// dot product(투영된 벡터의 길이)
		var dp = ab.dot(ac);
		// 가장 가까운 점
		var d = new THREE.Vector3().copy(dots[walls[i].startPoint]).add(ab.multiplyScalar(dp));
		// 길이
		var l = new THREE.Vector3().copy(d).sub(vector3).length();
		// 선분안에 들어가는가?
		var da = new THREE.Vector3().copy(d).sub(dots[walls[i].startPoint]);
		var db = new THREE.Vector3().copy(d).sub(dots[walls[i].endPoint]);
		var dadbLength = da.length() + db.length();
		if(dadbLength > abLength - 0.00001 && dadbLength < abLength + 0.00001){
			// 제일 짧은가?
			if (minPoint == null || l < minLength) {
				minLength = l;
				minIndex = i;
				minPoint = d;
				minWall = walls[i];
			}
		}
	}
	// 일정 거리 안인가?
	if (minPoint != null && new THREE.Vector3().copy(minPoint).sub(vector3).length() < vectorPerLength) {
		switch(returnType) {
		case 0:
			return minPoint;
		case 1:
			return minIndex;
		}
	} 

	// 보조선 처리
	if (supportLines != null) {
		for (var i = 0; i < supportLines.length; i++) {
			scene.remove(supportLines[i]);
		}
		supportLines = [];
	}
	
	var nearDots = [];
	
	for(var i = 0; i < walls.length; i++) {
		// 우선 A->B
		var ab = new THREE.Vector3().subVectors(dots[walls[i].endPoint], dots[walls[i].startPoint]);
		// A->B 길이 저장
		var abLength = ab.length();
		// 단위 벡터 로 변환
		ab.normalize();
		// A->C
		var ac = new THREE.Vector3().subVectors(vector3, dots[walls[i].startPoint]);
		// dot product(투영된 벡터의 길이)
		var dp = ab.dot(ac);
		// 가장 가까운 점
		var d = new THREE.Vector3().copy(dots[walls[i].startPoint]).add(ab.multiplyScalar(dp));
		// 길이
		var l = new THREE.Vector3().copy(d).sub(vector3).length();
		
		if (l < vectorPerLength) {
			nearDots.push(d);
			var lineGeometry = new THREE.Geometry();
			// AC
			//var ac = new THREE.Vector3().subVectors(d, dots[walls[i].startPoint]);
			// BC
			//var bc = new THREE.Vector3().subVectors(d, dots[walls[i].endPoint]);
			
			//if(ac.length() < bc.length()) {
				lineGeometry.vertices.push(dots[walls[i].startPoint]);
			//} else {
				lineGeometry.vertices.push(dots[walls[i].endPoint]);
			//}
			lineGeometry.vertices.push(d);
			var lineMaterial = new THREE.LineDashedMaterial({
				color: 0xbb00bb,
				dashSize: 1,
				gapSize: 0.5,
			});
			var supportLine = new THREE.Line(lineGeometry, lineMaterial);
			supportLines.push(supportLine);
		}
	}
	for(var i=0; i < supportLines.length; i++) {
		scene.add(supportLines[i]);
	}
	
	if (nearDots.length > 0) {
		for(var i=0; i< nearDots.length; i++) {
			switch(returnType) {
			case 0:
				return nearDots[i];
			}
		}
	}
	
	return null;
}

function getIntersectPoint(AP1, AP2, BP1, BP2) {
	if(AP1 == BP1 || AP1 == BP2 || AP2 == BP1 || AP2 == BP2) return null;
	// http://www.gisdeveloper.co.kr/?p=89
	var t;
	var s; 
	var under = (BP2.y-BP1.y)*(AP2.x-AP1.x)-(BP2.x-BP1.x)*(AP2.y-AP1.y);
	if(under==0) return null;
	
	var _t = (BP2.x-BP1.x)*(AP1.y-BP1.y) - (BP2.y-BP1.y)*(AP1.x-BP1.x);
	var _s = (AP2.x-AP1.x)*(AP1.y-BP1.y) - (AP2.y-AP1.y)*(AP1.x-BP1.x); 
	
	t = _t/under;
	s = _s/under; 
	
	if(t<=0.01 || t>=0.99 || s<=0.01 || s>=0.99) return null;
	if(_t==0 && _s==0) return null; 
	
	var IP = new THREE.Vector3();
	IP.x = AP1.x + t * (AP2.x-AP1.x);
	IP.y = AP1.y + t * (AP2.y-AP1.y);
	IP.z = AP1.z;
	
	return IP;
}

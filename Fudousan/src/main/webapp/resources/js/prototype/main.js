var controls;
var camera, scene, renderer;
var width = window.innerWidth;
var height = window.innerHeight;
var plane, selection;
var offset = new THREE.Vector3();
var mouse = new THREE.Vector2();
var connection_try = 0; //동시변경 확인을 위한 접속횟수체크 변수
var whoAmI = ''; // 사용자가 누군지 판단하는 변수

//의자
var chair;
var isSelected;
//드래그 될 오브젝트 들을 저장하는 배열
var objects = [];
//Raycaster
var raycaster = new THREE.Raycaster();
//마우스
var mouse = new THREE.Vector2();
//초기화
init();
//화면 그림
animate();

function init() {
	// 카메라 생성 및 초기화
	camera = new THREE.PerspectiveCamera(60, width / height, 0.1, 100000);
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
	renderer.setSize( window.innerWidth, window.innerHeight );
	// 해당 렌더러를 화면에 추가하여서 사용
	document.getElementById("threejsShow").appendChild( renderer.domElement );

	// 외부 모델 로더 생성
	const loader = new THREE.TDSLoader();
	// 해당 모델의 텍스쳐 경로 설정
	loader.setPath("/fudousan/resources/model/testchair/");
	// 모델 데이터 경로 설정 및 로딩 완료시 리스너 지정
	loader.load("/fudousan/resources/model/testchair/Armchair.3ds", (object) => {
		// x축 기준으로 -90도 회전
		object.rotation.x = Math.PI * -90 / 180;

		// 해당 모델을 가장 가깝게 에워싸는 육면체인 BoundingBox 생성
		var boundingBox = new THREE.Box3();
		boundingBox.setFromObject(object);

		// 바운딩 박스의 z 값을 이용하여 이동
		object.position.z = boundingBox.max.z;
		// 화면에 추가
		scene.add(object);
		// 완료 Alert 띄움
		alert("Complete");

		objects.push(object);	// 해당 object는 Groups 객체로써 DragControls와 호환 X
		chair = object;
	});

	// 큐브 형태(가로 500, 세로 500, 높이 500)
	var cubeGeometry = new THREE.CubeGeometry(500, 500, 500);
	// 큐브 재질
	var cubeMaterial = new THREE.MeshLambertMaterial({ color: 0x1ec876 });
	// 큐브 메시(객체)
	var cube = new THREE.Mesh(cubeGeometry, cubeMaterial);
	// 큐브 y축 45도 회전
	cube.rotation.y = Math.PI * 45 / 180;
	// 장면에 큐브 추가
	//scene.add(cube);
	
	
	
	// 큐브를 배열에 저장
	objects.push(cube);
	// DragControls 생성(objects의 메시들을 camera를 기준으로 드래그)
	var dragControls = new THREE.DragControls( objects, camera, renderer.domElement );
	// 드래그 시작
	dragControls.addEventListener( 'dragstart', function ( event ) {
		// 화면 회전 불가
		controls.enabled = false; 
	} );
	// 드래그 종료
	dragControls.addEventListener( 'dragend', function ( event ) {
		// 화면 회전 가능
		controls.enabled = true;
	} );

	//GUI 상의 기능들 구현하기
	  var options = {
			  velx: 0,
			  vely: 0,
			  camera: {
				speed: 0.0001
			  },
			  stop: function() {
				console.log('stop');
			  },
			  reset: function() {
				console.log('reset');
			  },
			  blueColor : function(){
				  socket.emit('bluePlane');
			  },
			  greenColor : function(){
				  socket.emit('greenPlane');
			  },
			  redColor : function(){
				  console.log('red');
			  },
			  의자추가 : function(){
				  console.log('의자가 생성됩니다.')
					// 외부 모델 로더 생성
					const loader = new THREE.TDSLoader();
					// 해당 모델의 텍스쳐 경로 설정
					loader.setPath("/fudousan/resources/model/testchair/");
					// 모델 데이터 경로 설정 및 로딩 완료시 리스너 지정
					loader.load("/fudousan/resources/model/testchair/Armchair.3ds", (object) => {
						// x축 기준으로 -90도 회전
						object.rotation.x = Math.PI * -90 / 180;

						// 해당 모델을 가장 가깝게 에워싸는 육면체인 BoundingBox 생성
						var boundingBox = new THREE.Box3();
						boundingBox.setFromObject(object);

						// 바운딩 박스의 z 값을 이용하여 이동
						object.position.z = boundingBox.max.z;
						// 화면에 추가
						scene.add(object);
						// 완료 Alert 띄움
						alert("Complete");

						objects.push(object);	// 해당 object는 Groups 객체로써 DragControls와 호환 X
						chair = object;
					});
			  },
			  뒤로가기 : function(){
				  console.log('뒤로가기를 눌렀습니다.');
				 socket.emit('array_back');
			  },
			  앞으로가기 : function(){
				  console.log('앞으로가기 눌렀습니다.');
			  },
			  저장 : function(){
				  console.log('저장하기 눌렀습니다.');
			  },
			  초기화 : function(){
				  console.log('초기화 눌렀습니다.');
			  },
			  종료 : function(){
				  console.log('종료눌렀습니다');
			  },
			  아이템제거하기 : function(){
				  console.log('이제 클릭하면 제거됨');
			  },
			  
			  };
	//GUI 추가하기 
	  	  var gui = new dat.GUI({ resizable : false }); 
			gui.add(options, 'stop');
			gui.add(options, 'reset');
			var service = gui.addFolder('추가기능');
			service.add(options, '뒤로가기');
			service.add(options, '앞으로가기');
			service.add(options, '저장');
			service.add(options, '초기화');
			service.add(options, '종료');
			service.open();
			var changeCeiling  = gui.addFolder('바닥컬러교체');
			changeCeiling.add(options, 'blueColor');
			changeCeiling.add(options, 'greenColor');
			changeCeiling.open();
			var AddOItem  = gui.addFolder('아이템 추가하기');
			AddOItem.add(options, '의자추가');
			AddOItem.open();
			gui.add(options, '아이템제거하기');
			
			
	//socket 통신 부분
	socket.on('whoAreYou',function(data){
		whoAmI = data;
	});
	
	socket.on('goback', function(data){
		var abc = data;
		switch(abc){
		case 'bluePlane' : console.log(abc); //뒤로가기로 파란바닥 생성이 왔으니까 파란바닥을 생성해야한다.
			socket.emit('bluePlane', 'goback');
			break;
		case 'greenPlane' : console.log(abc); //뒤로가기로 녹색바닥 생성이 왔으니까  녹색바닥을 생성해야한다.
			socket.emit('greenPlane','goback'); 
			break;
		default : break;
		};
	
	});
	
	//바닥색을 blue로 바꾸는 메소드
	socket.on('ServiceCall_bluePlane', function(data){
		blue_floor();
		var abc = data
		console.log(abc);
		if(whoAmI == 'selecter' && data != 'goback'){ // 누른사람이면 selecet && 뒤로가기로 실행하는거면  저장안함
			socket.emit('goArray1', "bluePlane"); // 배열1에 실행된거 기록하기
		}
	});
	
	//바닥을 green으로 바꾸는 메소드
	socket.on('ServiceCall_greenPlane', function(data){
			
			green_floor();
			var test = data;
			if(whoAmI == 'selecter' && test != 'goback'){
				socket.emit('goArray1', "greenPlane");
			}
	});
	
	function green_floor(){
		scene.remove(plane);
		var planeGeometry = new THREE.PlaneGeometry(5000, 6000);
		var planeMaterial = new THREE.MeshBasicMaterial({color:0x42f474, sid:THREE.DoubleSice});
		plane = new THREE.Mesh(planeGeometry, planeMaterial);
		scene.add(plane);
		saveTimeChange();
	};
	
	function blue_floor(){
		scene.remove(plane);
		var planeGeometry = new THREE.PlaneGeometry(5000, 6000);
		var planeMaterial = new THREE.MeshBasicMaterial({color:0x425ff4, sid:THREE.DoubleSice});
		plane = new THREE.Mesh(planeGeometry, planeMaterial);
		scene.add(plane);
		saveTimeChange();
	};
	
	
	
	
	socket.on('interaction', function(data){
		 alert(data); 
	});
	socket.on('successChangeMessage', function(data){
		console.log(whoAmI);
		if(whoAmI == 'selecter'){
			alert('상대방도 선택사항이 적용되었습니다.')
			whoAmI = "";
		}else{
			alert('상대방이 무언가를 바꾸었습니다.');
			whoAmI = "";
		}
	});
	

	
	//둘다 텍스쳐 로딩이 완료됬는지 확인하기 위한 메소드 
	function saveTimeChange(){
		if(whoAmI == 'selecter'){
			var sendSign = '클릭자';
		}else{
			var sendSign = '피클릭자';
		}
		console.log('sendSign : '+sendSign);
		socket.emit('interaction', sendSign);
		
	}
	
	
	var planeGeometry = new THREE.PlaneGeometry(5000, 6000);
	var planeMaterial = new THREE.MeshBasicMaterial({color:0xffff00, sid:THREE.DoubleSice});
	plane = new THREE.Mesh(planeGeometry, planeMaterial);
	scene.add(plane);


	document.getElementById("threejsShow").addEventListener('mousedown', this.onDocumentMouseDown, false);
	document.getElementById("threejsShow").addEventListener('mousemove', this.onDocumentMouseMove, false);
	document.getElementById("threejsShow").addEventListener('mouseup', this.onDocumentMouseUp, false);

}




function animate() {
	// 화면 회전 정보 갱신
	controls.update();
	// 화면을 렌더러에 그림
	renderer.render( scene, camera );
	// 다음 프레임 지정
	requestAnimationFrame( animate );
}


function onDocumentMouseDown(event) {
	if (chair != null) {
		// Get mouse position
		var mouseX = (event.clientX / window.innerWidth) * 2 - 1;
		var mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
		
		mouse.x = mouseX;
		mouse.y = mouseY;
		
		raycaster.setFromCamera(mouse, camera);
		var intersects = raycaster.intersectObjects(chair.children);

		if (intersects.length > 0) {
			isSelected = true;
		}
	}
}

function onDocumentMouseMove(event) {
	// Get mouse position
	var mouseX = (event.clientX / window.innerWidth) * 2 - 1;
	var mouseY = -(event.clientY / window.innerHeight) * 2 + 1;
	
	mouse.x = mouseX;
	mouse.y = mouseY;

	raycaster.setFromCamera(mouse, camera);
	var intersects = raycaster.intersectObjects(chair.children);
	
	if (intersects.length > 0) {

		if (isSelected) {
			raycaster.setFromCamera(mouse, camera);
			
			var intersects = raycaster.intersectObjects([plane]);
			console.log('intersects  :' + intersects);
			for ( var i = 0; i < intersects.length; i++ ) {
				chair.position.copy(intersects[i].point);
			}
		}
	}
}

function onDocumentMouseUp(event) {
	isSelected = false;
	controls.enabled = true;
	console.log('chair : '+chair);
	
}


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Anhaemin Server Test</title>
 	<link rel="stylesheet" href="/fudousan/resources/js/prototype/style.css">
    <script src="/fudousan/resources/js/three.js"></script>
	<script src="/fudousan/resources/js/TDSLoader.js"></script>
	<script src="/fudousan/resources/js/TrackballControls.js"></script>
	<script src="/fudousan/resources/js/DragControls.js"></script>
    <style type="text/css">
    	#threejsShow {
    		position:absolute;
    		z-index: 0;
    	}
    	#myButton {
    		position:absolute;
    		z-index: 1;
    	}
    </style>
</head>
<body>
<div id="myButton">
<input id="sendMsg"/><button id="chatBtn">챗고!</button>
	<button id="Btn_object" type="button">객체 소환</button>
	<button id="Btn_blist" type="button">array1 보기</button>
	<button id="Btn_blist2" type="button">array2 보기</button>
	<button id="Btn_backArray1" type="button">뒤로가기</button>
	<button id="Btn_clear" type="button">array 1초기화</button>
	<button id="Btn_blistRecovery" type="button">앞으로가기</button><br>
	<button id="Btn_realSelect" type="button">리얼셀렉트버튼</button>
	<button id="Btn_addGeometry" type="button">지오메트리 추가</button>
    <ul id="msg"></ul>
</div>
<div id="threejsShow">

</div>
<script src="/fudousan/resources/js/prototype/main.js"></script>
    <input type="hidden" value="88" id="itemId" name="itemId">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="resources/js/socket.io.js"></script>
	  <script>
	  
		var socket = io('http://localhost:8000');
		var chatBtn = document.querySelector('#chatBtn');
		var Btn_object = document.querySelector('#Btn_object');
		var Btn_blist = document.querySelector('#Btn_blist');
		var Btn_blist2 = document.querySelector('#Btn_blist2');
		var Btn_blistRecovery = document.querySelector('#Btn_blistRecovery');
		var Btn_backarray1 = document.querySelector('#Btn_backArray1');
		var Btn_clear = document.querySelector('#Btn_clear');
		var Btn_realSelect = document.querySelector('#Btn_realSelect');
		var Btn_addGeometry = document.querySelector('#Btn_addGeometry');
		
	//add 영역
		Btn_addGeometry.addEventListener('click', function(event){
			socket.emit('addGeometry' , null);
				
		});
	//지오매트리 영역	
		chatBtn.addEventListener("click", function(event) {
			socket.emit('chat message', $('#sendMsg').val());
		});
		
		Btn_object.addEventListener("click", function(event) {
			socket.emit('abc', {name : 'anhaemin'});
		});
		
		Btn_blist.addEventListener("click", function(event) {
			socket.emit('call list');
		});
		
		Btn_blist2.addEventListener("click", function(event) {
			socket.emit('call list2');
		});
		
		Btn_backArray1.addEventListener('click', function(event){
			socket.emit('back_array');
		});
		Btn_clear.addEventListener('click', function(event){
			socket.emit('clear_array1');
		})
		
		Btn_blistRecovery.addEventListener('click', function(event){
			socket.emit('Array1_Recovery');
		});
		
		Btn_realSelect.addEventListener('click', function(event){
			socket.emit('realSelect');
		});
		
		socket.on('chat message', function(msg){
			$('#msg').append($('<li>').text(msg));
		});
		
		socket.on('addGeo', function(){
			console.log('addGeo - Start');
			
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
				alert("add");
				var objects = [];
				objects.push(object);	// 해당 object는 Groups 객체로써 DragControls와 호환 X
				chair = object;
			});

			animate();
		});
		
		
	</script>
	
	
</body>
</html>
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
	<script src="/fudousan/resources/js/dat.gui.js"></script>
	<script src="/fudousan/resources/js/stats.js"></script>
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
	<button id="Btn_addGeometry" type="button">바닥색 변경</button>
    <ul id="msg"></ul>
</div>
<div id="threejsShow">

</div>
<script src="/fudousan/resources/js/prototype/main.js"></script>
    <input type="hidden" value="88" id="itemId" name="itemId">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="resources/js/socket.io.js"></script>
	  <script>
	  
	  
		var socket = io('http://localhost:7000');
		var chatBtn = document.querySelector('#chatBtn');
		var Btn_object = document.querySelector('#Btn_object');
		var Btn_blist = document.querySelector('#Btn_blist');
		var Btn_blist2 = document.querySelector('#Btn_blist2');
		var Btn_blistRecovery = document.querySelector('#Btn_blistRecovery');
		var Btn_backarray1 = document.querySelector('#Btn_backArray1');
		var Btn_clear = document.querySelector('#Btn_clear');
		var Btn_realSelect = document.querySelector('#Btn_realSelect');
		var Btn_addGeometry = document.querySelector('#Btn_addGeometry');
		var cocoa_count = 0;

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
		
		//바닥 색 바꾸기
		Btn_addGeometry.addEventListener('click', function(event){
			socket.emit('planeChange');
		});
		
		socket.on('cocoa', function(){
			console.log('cocoa - Start');
			console.time('cocoa_time');
			scene.remove(plane);
			var planeGeometry = new THREE.PlaneGeometry(5000, 6000);
			var planeMaterial = new THREE.MeshBasicMaterial({color:0xb5f441, sid:THREE.DoubleSice});
			plane = new THREE.Mesh(planeGeometry, planeMaterial);
			scene.add(plane);
			
			cocoa_count += 1;
			var arrayOkSign = ['퍼스트','세컨드'];
			if(cocoa_count == 1){
				var sendSign = arrayOkSign[0];
			}else{
				var sendSign = arrayOkSign[1];
			}
			socket.emit('planeChangeOk', sendSign);
			console.timeEnd('cocoa_time');
			
			
			console.log('cocoa - End');
		});
		
		socket.on('planeChangeOkMassage', function(data){
			 alert(data); 
			cocoa_count = 0;
		});
		
	</script>
	
	
</body>
</html>
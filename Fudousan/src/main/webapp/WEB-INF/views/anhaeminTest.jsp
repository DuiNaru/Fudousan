<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Anhaemin Server Test</title>
</head>
<body>
	<input id="sendMsg"/><button id="chatBtn">챗고!</button>
	<button id="Btn_object" type="button">객체 소환</button>
	<button id="Btn_blist" type="button">array1 보기</button>
	<button id="Btn_blist2" type="button">array2 보기</button>
	<button id="Btn_backArray1" type="button">뒤로가기</button>
	<button id="Btn_clear" type="button">array 1초기화</button>
	<button id="Btn_blistRecovery" type="button">앞으로가기</button>
    <ul id="msg"></ul>

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

		chatBtn.addEventListener("click", function(event) {
			socket.emit('chat message', $('#sendMsg').val());
		});
		
		Btn_object.addEventListener("click", function(event) {
			socket.emit('abc', {name : 'anhaemin'});
		});
		
		Btn_blist.addEventListener("click", function(event) {
			socket.emit('call list', null);
		});
		
		Btn_blist2.addEventListener("click", function(event) {
			socket.emit('call list2', null);
		});
		
		Btn_backArray1.addEventListener('click', function(event){
			socket.emit('back_array' , null);
		});
		Btn_clear.addEventListener('click', function(event){
			socket.emit('clear_array1', null);
		})
		
		Btn_blistRecovery.addEventListener('click', function(event){
			socket.emit('Array1_Recovery', null);
		});
		
		socket.on('chat message', function(msg){
			$('#msg').append($('<li>').text(msg));
		});
	</script>
</body>
</html>
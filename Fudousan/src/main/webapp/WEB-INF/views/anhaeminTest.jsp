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
	<button id="Btn_blist" type="button">객체 리스트 보기</button>
    <ul id="msg"></ul>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="resources/js/socket.io.js"></script>
	  <script>
		var socket = io('http://localhost:8000');

		var chatBtn = document.querySelector('#chatBtn');
		var Btn_object = document.querySelector('#Btn_object');
		var Btn_blist = document.querySelector('#Btn_blist');

		chatBtn.addEventListener("click", function(event) {
			socket.emit('chat message', $('#sendMsg').val());
		});
		
		Btn_object.addEventListener("click", function(event) {
			socket.emit('abc', {name : 'anhaemin' , age : 26 , level : 10});
		});
		
		Btn_blist.addEventListener("click", function(event) {
			socket.emit('call list', null);
		});
		
		socket.on('chat message', function(msg){
			$('#msg').append($('<li>').text(msg));
		});
	</script>
</body>
</html>
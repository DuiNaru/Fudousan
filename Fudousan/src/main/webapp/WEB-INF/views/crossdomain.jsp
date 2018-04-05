<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cross Domain Test</title>
</head>
<body>
	<button type="button" id="btn">send</button>

	<script src="resources/js/socket.io.js"></script>
	<script type="text/javascript">
		const serverURL = 'http://sunnyserver.dlinkddns.com:3000';
		const socket = io(serverURL);

		var btn = document.getElementById('btn');

		btn.onclick = function(){
			socket.emit('sendMsg', {msg: "haha"});
		};
	</script>
</body>
</html>
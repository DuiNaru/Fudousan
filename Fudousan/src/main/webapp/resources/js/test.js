var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var cors = require('cors');
var room = ""; //방번호
var roomo = {};
var queue = []; //서버는 각 방들의 array들을 담아줄것이다.
var firstData = [];
var t = "";
var users = [];
app.use(cors());

app.get('/', function(req, res) {
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket) {
  console.log('a user connected');

	socket.on('disconnect', function(){
		
		for (var i = 0; i < users.length; i++){
			var user = users[i];
			
			if (user.socketId === socket.id){
					users.splice(i, 1);		
					console.dir(users);break;
			}
		}
		
		console.log('user disconnected');
	});

	
	
	
	socket.on('array_back' , function(data){
		console.log('뒤로가기');
		if(roomo.roomArray1.length != 0){
			var arrayBackResult = roomo.roomArray1.pop();
			
			var a = JSON.parse(arrayBackResult);
			a.direction = 'back';
			var arrayBackResult = JSON.stringify(a);
			
			roomo.roomArray2.push(arrayBackResult);
			
			
		}else{
			console.log('roomArray1 비어있습니다.');
		}
		
		var room = "room" + data.roomId; //문자열화 해준것
		
		socket.emit('commandPass',arrayBackResult);

	});
	
		socket.on('arrayBackCancel', function(data){
		console.log('앞으로가기');
		if(roomo.roomArray2.length != 0){
			var array2Last = roomo.roomArray2.pop();
		/*roomo.roomArray1.push(array2Last); //배열1에 .. 배열2에서 가져온거 넣음*/
			/*var ar_result = roomo.roomArray1[roomo.roomArray1.length-1];*/
			var b = JSON.parse(array2Last);
			b.direction = 'forward';
			
			
			var arrayBackCancelResult = JSON.stringify(b);
			
			var room = "room" + data.roomId; //문자열화 해준것
			socket.emit('commandPass',arrayBackCancelResult);
			
		
		}else{
			console.log('roomArray2 비어있습니다.');
		}
		
		
	});
	
	socket.on('othersideAdd',function(data){
				socket.broadcast.to(room).emit('othersideAdd2',data); 
				socket.emit('gangsin',data);
			});
	socket.on('othersideDel',function(data){
				socket.broadcast.to(room).emit('othersideDel2',data); 
				//나를 제외한 룸의 모든 사람이여 이 메세지를 받들라
			});
	
	
	socket.on('showmethe',function(){
		console.dir(roomo.roomArray1);
		console.log('roomArray1 length : '+roomo.roomArray1.length);
		console.dir(roomo.roomArray2);
		console.log('roomArray2 length : '+roomo.roomArray2.length);
	});	
	
	socket.on('getoutOfRoom',function(){
		socket.broadcast.to(room).emit('imOut');
		
	});
	
	socket.on('clearArray', function(){
		console.log('배열 초기화');
		if(firstData != null){
			roomArray1 = [];
			roomArray2 = [];
			console.dir(roomArray1);
			console.dir(roomArray2);
			socket.broadcast.to(room).emit('clearOther'); 
		}else{
			console.log('아무런 데이터가 없다.')
		}
		
	});
	
	socket.on('urlPass',function(data){
		
		socket.broadcast.to(room).emit('urlOther',data); 
	});
	
	socket.on('rotateItem',function(data){
		socket.broadcast.to(room).emit('rotateOther',data); 
	});
	
	socket.on('room_join',function(data){
	
		roomo.roomNumber = rooma(data.roomId);
		roomo.roomArray1 = [];
		roomo.roomArray2 = [];
		socket.join(roomo.roomNumber);
		
		room = roomo.roomNumber;
		
		var user = {};
		user.userName = data.userName;
		user.socketId = socket.id;
		users.push(user);
			console.dir(users);	
	
		
	});
	
	
	socket.on('delItem',function(data){
		console.dir(data);
		var a = JSON.parse(data);
		roomo.roomArray1.push(data);
		socket.broadcast.to(room).emit('youto',data);
	});
	
	socket.on('addItem',function(data){
		console.dir(data); //넘어온 아이템 객체의 정보
		
		var a = JSON.parse(data);
			roomo.roomArray1.push(data); //배열에 명령을 넣는다.
		
			socket.broadcast.to(room).emit('youto',data); //누르지 않은사람도 추가
			
	
		io.emit('lookSamePage',data); //크롬으로 개발자도구로 data날아온것보기
	});
	
	
	socket.on('Array1Push', function(data){
		console.dir(data);
		roomo.roomArray1.push(data);
	  });
	
	
	socket.on('youtoWhat',function(data){
		if(data == 'success'){
			console.log('성공');
			socket.broadcast.to(room).emit('commandSuccess','success');
		}
		else if(data == 'fail'){
			console.log('실패');
			var arrayLastResult = roomo.roomArray1.pop();
			
			var a = JSON.parse(arrayLastResult);
			a.youtoWhat = 'fail';
			var arrayLastResult = JSON.stringify(a);
			
			socket.broadcast.to(room).emit('commandPass',arrayLastResult);
		}
	});
	
	
	
});




function rooma(roomId){
	return "room"+roomId;
}



http.listen(8000, function() {
  console.log('Http server started with :8000');
});
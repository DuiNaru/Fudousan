var socket = io('http://localhost:8000');
 
 $(function(){
	 var userId = document.getElementById('userId').value;
	 var userName = document.getElementById('userName').value;
	 var user = {
			 userId : userId,
			 userName : userName
	 }
	 var userJOSN = JSON.stringify(user) // Id와 Name을 합쳐서 제이슨 객체로 보내주자.
	 console.log(userJOSN);
	 
	 socket.emit('room_join', room.roomId);
	 socket.emit('connection_id',userJOSN);
 });

 
 function goback(){
	console.log('뒤로가기'); 
	socket.emit('array_back');
 };
 
 function gofront(){
	 console.log('앞으로가기');
	 socket.emit('arrayBackCancel');
 }
 function save(){
	 console.log('저장하기');
	 console.log('저장하기 눌렀습니다.');
 }
 function reset(){
	 console.log('초기화하기');
	 var clearYes = confirm('진짜 초기화 하시겠습니까?');
	  if(clearYes){
		  socket.emit('clearArray');
	  };
 }
 function esc(){
	 console.log('종료하기');
 }
 function checkArray(){
	 socket.emit('goArray1');
 }
 function AddItem(roomitem){
	console.dir(roomitem);
	 socket.emit('addItem',JSON.stringify(roomitem));
 }
 
 socket.on('takeMyOrder')
 


function saveTimeChange(){
		if(whoAmI == 'selecter'){
			var sendSign = '클릭자';
		}else{
			var sendSign = '피클릭자';
		}
		console.log('sendSign : '+sendSign);
		socket.emit('interaction', sendSign);
	}


socket.on('whoAreYou',function(data){ //클릭한사람은 data로 'selecter'를 받음
	whoAmI = data;
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

socket.on('lookSamePage',function(data){
	var product = objToRoomItem(JSON.parse(data));
	console.dir(product);
	console.log(data);
});


/*socket.on('ServiceCall_greenPlane', function(data){
	
	green_floor();
	var test = data;
	if(whoAmI == 'selecter' && test != 'goback'){
		socket.emit('goArray1', "greenPlane");
	}
});*/



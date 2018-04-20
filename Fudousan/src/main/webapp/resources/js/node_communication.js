var socket = io('http://localhost:8000');
var justOne = 0;
var whoAmI = 'x';
function Command(){
	this.name = "";
	this.roomItem = null;
	this.onDo = null;
	this.onRedo = null;
}





 $(function(){
	 var userId = document.getElementById('userId').value;
	 var userName = document.getElementById('userName').value;
	 var user = {
			 userId : userId,
			 userName : userName,
			 roomId: room.roomId,
	 }
	 
	 socket.emit('room_join', user);
 });

socket.on('commandPass',function(data){
	if(data != 'success'){
	var catch_command = JSON.parse(data);
	var cName = catch_command.name;
	var cTarget = objToRoomItem(catch_command.roomItem);
	console.log(cTarget);
	var direc = catch_command.direction;
	var youtoWhat = catch_command.youtoWhat;
	}
	if(data == 'success'){  //상대방 추가 성공했으면
		console.log('상대방도 성공적으로 추가되었습니다.');
	}
	if(cName =='add' && youtoWhat=='fail'){  //추가된거 상대방 실패하면 본인도 삭제한다.
		deplaceRoomItem(cTarget);
	}
	
	if(cName=='add' && direc=='back'){
		//추가된 아이템을 back해서 삭제됨
		deleteItem(cTarget,function(){
			/*deplaceRoomItem(cTarget); // 파라메터 받은 대상의 것을 삭제시킨다.
*/		});
	}
	if(cName=='add' && direc=='forward'){
		//삭제되었던 아이템을 forward해서 추가됨
			createItem(cTarget.item,function(roomitem){ // 2배열에서 보관해던거 꺼내서 생성함 (데이터베이스상)
				cTarget.roomItemId = roomitem.roomItemId;
				cTarget.addForward = true;
				cTarget.isForawrd = 'notFirst';
				
				AddItemForward(cTarget); // 1배열에 주는것
				
				whoAmI = 'x';
				
				socket.emit('forXman',JSON.stringify(cTarget));
			});
	}// else if 끝
}); //commandPass의 끝
 
socket.on('forXman2',function(data){
	var xMan = objToRoomItem(JSON.parse(data));
	console.log('넘겨준 최후의 것');
	console.log(xMan);
	console.log('넘겨준 최후의 것');
	
	placeRoomItem(xMan);
});

//AddItem에서는 객체정보가 파라메터로 넘어가서 커맨더 만들어서 이름으로 커맨더 타입 지정하고 객체정보도 같이 보내서 서버가 밭게함
function AddItem(roomitem){
	var a = new Command();
	a.name = "add";
	a.roomItem = roomitem;
	a.isForward = 'first';
	console.dir(a);
	 socket.emit('addItem',JSON.stringify(a));
}

function AddItemForward(roomitem){
	var a = new Command();
	a.name ="add";
	a.roomItem = roomitem;
	socket.emit('addItemForward',JSON.stringify(a));
}



socket.on('youto',function(data){
	console.log(data);
	var catch_command = JSON.parse(data);
	var cName = catch_command.name;
	var cTarget = objToRoomItem(catch_command.roomItem);
	
	if(cName=='add'){
		placeRoomItem(cTarget, function() {
			console.log('상대방이 정보를 변경함');
			socket.emit('youtoWhat','success');
		}, function(){
			console.log('상대방이 정보를 변경실패');
			socket.emit('youtoWhat','fail');
		}); 
	}
});
 
 socket.on('commandSuccess',function(data){
	console.log('상대방도 적용 되었습니다');
 });
 
 
 function goback(){
	console.log('뒤로가기'); 
	socket.emit('array_back', {
		roomId: room.roomId
	});
 };
 
 function gofront(){
	 console.log('앞으로가기');
	 socket.emit('arrayBackCancel',{
			roomId: room.roomId
		});
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
	 socket.emit('showmethe');
 }
 


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

//크롬에서 개발자 도구로 콘솔에서 보기
socket.on('lookSamePage',function(data){
	var product = JSON.parse(data);
	var abc = objToRoomItem(product.roomItem);
	/*console.log(abc);*/
});





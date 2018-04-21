var socket = io('http://localhost:8000');
var justOne = 0;
var whoAmI = 'x';
var Array1 = [];
var Array2 = [];
var gangsin = null;

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
			socket.emit('othersideDel',JSON.stringify(cTarget));
			/*deplaceRoomItem(cTarget); // 파라메터 받은 대상의 것을 삭제시킨다.
*/		});
	}
	if(cName=='add' && direc=='forward'){
		//삭제되었던 아이템을 forward해서 추가됨
			createItem(cTarget,function(roomitem){ // 2배열에서 보관해던거 꺼내서 생성함 (데이터베이스상)
				cTarget.roomItemId = roomitem.roomItemId;
				cTarget.addForward = true;
				cTarget.isForawrd = 'notFirst';
				
				
				AddItemForward(cTarget); // 1배열에 주는것
				
				whoAmI = 'x';
				
				socket.emit('othersideAdd',JSON.stringify(cTarget));
			});
	}
	if(cName=='delete' && direc=='back'){
		//뒤로가기로 삭제되었던걸 다시 만들어야한다. 
		console.log(cTarget.roomItemId); //35
		createItem(cTarget,function(roomitem){ 
			cTarget.roomItemId = roomitem.roomItemId; //36
			console.log(cTarget.roomItemId + '와 와 와'); //1788
			socket.emit('othersideAdd',JSON.stringify(cTarget));
			
			var k0 = JSON.stringify(roomitem)
			Array1.push(k0);
		});
	}
	
	if(cName=='delete' && direc=='forward'){
		//앞으로가기하면 다시 삭제되고 사라져야한다. 
		// 69라인에 있는거 가져와라 
	
		console.log('★★★★★★★★★★★★★'); 
		console.log(gangsin);
		console.log('★★★★★★★★★★★★★'); 
		
		
		var dragon = objToRoomItem(gangsin);
			deleteItem(dragon,function(roomitem){
				dragon.roomItemId = roomitem.roomItemId;
				console.log(dragon.roomItemId); 
				DeleteItemForward(dragon); //1배열에 주는것 - 삭제버전
				socket.emit('othersideDel',JSON.stringify(dragon));
			});
	}
}); //commandPass의 끝

socket.on('gangsin',function(data){
	var a = JSON.parse(data)
	gangsin = a;
});


socket.on('othersideDel2',function(data){
	var otherDel = objToRoomItem(JSON.parse(data));
	console.log(otherDel);
	deplaceRoomItem(otherDel);
});

socket.on('othersideAdd2',function(data){
	var otherAdd = objToRoomItem(JSON.parse(data));
	console.log(otherAdd);

	placeRoomItem(otherAdd);
});

//AddItem에서는 객체정보가 파라메터로 넘어가서 커맨더 만들어서 이름으로 커맨더 타입 지정하고 객체정보도 같이 보내서 서버가 밭게함
function AddItem(roomitem){
	var a = new Command();
	a.name = "add";
	a.roomItem = roomitem;
	a.isForward = 'first';
	Array1.push(JSON.stringify(a));
	socket.emit('addItem',JSON.stringify(a));
}

function AddItemForward(roomitem){
	var a = new Command();
	a.name ="add";
	a.roomItem = roomitem;
	socket.emit('Array1Push',JSON.stringify(a));
}

function DeleteItemForward(roomitem){
	var a = new Command();
	a.name = "delete";
	a.roomItem = roomitem;
	socket.emit('Array1Push',JSON.stringify(a));
}

function delItem(roomitem){
	var a = new Command();
	a.name = "delete";
	a.roomItem = roomitem;
	Array1.push(JSON.stringify(a));
	socket.emit('delItem',JSON.stringify(a));
}

socket.on('youto',function(data){
	console.log(data);
	var catch_command = JSON.parse(data);
	var cName = catch_command.name;
	var cTarget = objToRoomItem(catch_command.roomItem);
	
	if(cName=='add'){
		placeRoomItem(cTarget, function() {
			console.log('상대방이 생성함');
			socket.emit('youtoWhat','success');
		}, function(){
			console.log('상대방이 생성 실패');
			socket.emit('youtoWhat','fail');
		}); 
	}
	
	if(cName=='delete'){
		deplaceRoomItem(cTarget, function() {
			console.log('상대방이 삭제함');
			socket.emit('youtoWhat','success');
		}, function(){
			console.log('상대방이 삭제 실패');
			socket.emit('youtoWhat','fail');
		});
	}
	
});
 
 socket.on('commandSuccess',function(data){
	console.log('상대방도 적용 되었습니다');
 });
 
 socket.on('clearOther',function(){
	clearRoom(); 
 });
 
 socket.on('urlOther',function(data){
	 var url = data;
	 refreshSnapshot(url);
 })
 
 
 function twinSnap(url){
	 socket.emit('urlPass',url);
 }
 
 function goback(){
	console.log('뒤로가기'); 
		if(Array1.length != 0){
			var a0 = Array1.pop();
			var a1 = JSON.parse(a0);
			a1.direction = 'back';
			var a2 = JSON.stringify(a1);
			Array2.push(a2);
		}else{
			console.log('Array1 비어있습니다.');
		}
	socket.emit('array_back', {
		roomId: room.roomId
	});
 };
 
 function gofront(){
	 console.log('앞으로가기');
	 
	 if(Array2.length != 0){
			var a0 = Array2.pop();
			var a1 = JSON.parse(a0);
			a1.direction = 'forward';
			var a2 = JSON.stringify(a1);
			Array1.push(a2)
		}else{
			console.log('roomArray2 비어있습니다.');
		}
	 
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
	 var escYes = confirm("정말로 종료하시겠습니까?");
	 if(escYes){
		 socket.emit('getoutOfRoom');
		 location.href="/fudousan/";
	 }
	 console.log('종료하기');
 }
 
 socket.on('imOut',function(){
	alert('상대방이 접속을 종료하였습니다.'); 
 });
 
 
 function checkArray(){
	 console.dir(Array1);
	 console.log(Array1.length);
	 console.dir(Array2);
	 console.log(Array2.length);
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

function rorotate(roomitem){
	console.log('111');
	socket.emit('rotateItem',roomitem);
}

socket.on('rotateOther',function(data){
	console.log('333');
	rotateRoomItem(data);
});



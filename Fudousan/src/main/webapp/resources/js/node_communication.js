var socket = io('http://localhost:8000');


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


//CommandCallBack 정의

// 모든 onCreate하면 실행된다.
CommandCallBack.onCreate = function(roomItem){
	console.log('onCreate');
	// 상대에게 create됐음을 알린다.
	nodeCommand.transmitCreate(roomItem);
}

// 모든 onDelete하면 실행된다.
CommandCallBack.onDelete = function(roomItem) {
	console.log('onDelete');
	// 상대에게 delete됬음을 알린다.
	nodeCommand.transmitDelete(roomItem);
}

// 모든 onMove하면 실행된다.
CommandCallBack.onMove = function(roomItem){
	console.log('onMove');
	//상대에게 Move 됬음을 알린다.
	nodeCommand.transmitMove(roomItem);
}

// 모든 onItemChange하면 실행된다.
CommandCallBack.onItemChange = function(roomItem){
	console.log('onItemChange');
	nodeCommand.transmitItemChange(roomItem);
}

// 모든 onModeLoad하면 실행된다
CommandCallBack.onModeLoad = function(roomItem){
	console.log('onModeLoad');
	nodeCommand.transModeLoad(roomItem);
}

// 모든 onModeError하면 실행된다
CommandCallBack.onModeError = function(roomItem){
	console.log('onModeError');
	nodeCommand.transModeError(roomItem);
}

// 모든 onSelect하면 실행된다.
CommandCallBack.onSelect = function(roomItem){
	console.log('onSelect');
	nodeCommand.transmitSelect(roomItem);
}

//모든 OnDeselect하면 실행된다.
CommandCallBack.onDeselect = function(roomItem){
	console.log('onDeselect');
	nodeCommand.transmitDeselect(roomItem);
}

//모든 onReset하면 실행된다.
CommandCallBack.onReset = function(roomItem){
	console.log('onReset');
	nodeCommand.transmitReset(roomItem);
}

//모든 onReset하면 실행된다.
CommandCallBack.onSnapShot = function(roomItem){
	console.log('onSnapShot');
	nodeCommand.transmitSnapShot(roomItem);
}

//모든 onForward하면 실행된다.
CommandCallBack.onForward = function(roomItem){
	console.log('onForward');
	nodeCommand.transmitForward(roomItem);
}

//모든 onBack하면 실행된다.
CommandCallBack.onBack = function(){
	console.log('onBack');
	nodeCommand.transmitBack();
}





var nodeCommand = {
		
	//CommandCallBack.onCreate (생성)
	transmitCreate : function(roomItem) {
		var roomItemObeject = JSON.stringify(roomItem);
		socket.emit('addItem',roomItemObeject);
	},
	receiveCreate : function(roomItemObeject) {
		var roomItem = objToRoomItem(JSON.parse(roomItemObeject));
		NewCommand.place(roomItem);
	},
	
	//CommandCallBack.onDelete (삭제)
	transmitDelete : function(roomItem) {
		var roomItemObeject = JSON.stringify(roomItem);
		socket.emit('delItem',roomItemObeject);
	},
	receiveDelete : function(roomItemObeject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObeject));
		NewCommand.deplace(roomItem);
	},
	
	//CommandCallback.onMove (이동)
	transmitMove : function(roomItem){
		var roomItemObeject = JSON.stringify(roomItem);
		socket.emit('moveItem',roomItemObeject);
	},
	receiveMove : function(roomItemObeject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObeject));
		NewCommand.moveLocal(roomItem);
	},
	
	//CommandCallback.onItemChange (아이템변경)
	transmitItemChange : function(roomItem){
		var roomItemObeject = JSON.stringify(roomItem);
		socket.emit('changeItem',roomItemObeject);
	},
	receiveChange :  function(roomItemObject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObject));
		NewCommand.itemChangeLocal(roomItem);
	},
	
	//CommandCallBack.onModeLoad (모델로드)
	transModeLoad : function(roomItem){
		var roomItemObject = JSON.stringify(roomItem);
		socket.emit('modeLoad',roomItemObject);
	},
	receiveModeLoad : function(roomItemObject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObject));
		alert('상대방이 로드가 끝났습니다.');
	},
	
	//CommandCallBack.onModeError (모델에러)
	transModeError : function(roomItem){
		var roomItemObject = JSON.stringify(roomItem);
		socket.emit('modeError',roomItemObject);
	},
	receiveModeError : function(roomItemObject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObject));
		alert('상대방이 로드를 실패하였습니다.');
	},
	
	//CommandCallback.onSelect (아이템 선택)
	transmitSelect : function(rooomItem){
		var roomObject = JSON.stringify(roomItem);
		socket.emit('selectItem',roomObject);
	},
	receiveSelectItem : function(roomItemObject){
		var roomItem = objToRoomItem(JSON.parse(rooomItemObject));
		NewCommand.selectLocal(roomItem);
	},
	 
	//CommandCallBack.onDeselect (아이템 선택 해제)
	transmitSelect : function(roomItem){
		var roomObject = JSON.stringify(roomItem);
		socket.emit('deselectItem',roomObject);
	},
	receiveDeselectItem : function(roomItemObject){
		var roomItem = objToRoomItem(JSON.parse(roomItemObject));
		NewCommand.deselectLocal(roomItem);
	},
	
	//CommandCallBack.onReset (룸 리셋)
	transmitReset : function(){
		socket.emit('roomReset');
	},
	receiveReset : function(){
		//화면이 꺠끗해집니다.
		roomResetLocal(); 
	},
	
	//CommandCallBack.onSnapShot (스냅샷)
	transmitSnapShot : function(url){
		socket.emit('SnapShot',url);
	},
	receiveSnapShot : function(url){
		refreshSnapshot(url);
	},
	
	//CommandCallBack.onForward (앞으로)
	transmitForward : function(roomItem){
		var roomObject = JSON.stringify(roomItem);
		socket.emit('forward',roomObject);
	},
	receiveForward : function(receiveForward){
		forward();
	},
	
	//CommandCallBack.onBack (뒤로)
	transmitBack : function(){
		socket.emit('back');
	},
	receiveBack : function(){
		back();
	}
	
	
	
}








//A가 변경을하면 서버가 받아서 그걸 B에게 전달해주는 것
socket.on('othersideAdd',function(roomItemObeject){
	nodeCommand.receiveCreate(roomItemObeject);
});

socket.on('othersideDelete',function(roomItemObeject){
	nodeCommand.receiveDelete(roomItemObeject);
});

socket.on('othersideMove',function(roomItemObject){
	nodeCommand.receiveMove(roomItemObject);
})

socket.on('othersideChange',function(roomItemObject){
	nodeCommand.receiveChange(roomItemObject);
});

socket.on('othersideModeLoad',function(roomItemObject){
	nodeCommand.receiveModeLoad(roomItemObject);
});

socket.on('othersideModeError',function(roomItemObject){
	nodeCommand.receiveModeError(roomItemObject);
});

socket.on('othersideSelectItem',function(roomItemObject){
	nodeCommand.receiveSelectItem(roomItemObject);
});

socket.on('othersideDeselectItem',function(roomItemObject){
	nodeCommand.receiveDeselectItem(roomItemObject);
});

socket.on('othersideReset',function(){
	nodeCommand.receiveReset();
});

socket.on('otherSnapShot',function(url){
	nodeCommand.receiveSnapShot(url);
});

socket.on('otherForward',function(roomItemObject){
	nodeCommand.receiveForward(roomItemObject);
});

socket.on('back',function(){
	nodeCommand.receiveBack();
});



//종료하기 function esc 




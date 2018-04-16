//GUI 상의 기능들 구현하기
	  var options = {
			  velx: 0,
			  vely: 0,
			  camera: {
				speed: 0.0001
			  },
			  뒤로가기 : function(){
				  console.log('뒤로가기를 눌렀습니다.');
				 socket.emit('array_back');
			  },
			  앞으로가기 : function(){
				  console.log('앞으로가기 눌렀습니다.');
				  socket.emit('arrayBackCancel');
			  },
			  저장 : function(){
				  console.log('저장하기 눌렀습니다.');
			  },
			  초기화 : function(){
				  console.log('초기화 눌렀습니다.');
				  var clearYes = confirm('진짜 초기화 하실?');
				  if(clearYes){
					  socket.emit('clearArray');
				  };
			  },
			  종료 : function(){
				  console.log('종료눌렀습니다');
			  	}
			  };
	//GUI 추가하기 
	  	  var gui = new dat.GUI(); 
			var service = gui.addFolder('추가기능');
			service.add(options, '뒤로가기');
			service.add(options, '앞으로가기');
			service.add(options, '저장');
			service.add(options, '초기화');
			service.add(options, '종료');
			service.open();
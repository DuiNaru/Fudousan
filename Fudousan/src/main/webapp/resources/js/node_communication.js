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
});


/*socket.on('ServiceCall_greenPlane', function(data){
	
	green_floor();
	var test = data;
	if(whoAmI == 'selecter' && test != 'goback'){
		socket.emit('goArray1', "greenPlane");
	}
});*/
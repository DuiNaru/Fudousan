const startBtn = document.getElementById("startVideoChatBtn");
startBtn.onclick = pushStartBtn;

let localCam = document.getElementById("localCam");
let remoteCam = document.getElementById("remoteCam");

let localStream = null;
let myPeerConnection;

let pushStartBtn = function(){
	if (startBtn.value === "화상 채팅 시작"){
		call();
	}
	else {
		hangup();
	}
};

let call = function(){
	console.log("--> call");
	
	startBtn.innerHTML = "화상 채팅 종료";
	
	navigator.mediaDevices.getUserMedia({video: true, audio: true}).then(function(stream){
		localStream = stream;
		localCam.width = 400;
		localCam.height = 300;
		localCam.srcObject = localStream;
	}).then(function(){
		socket.emit("call", {
			roomId: room.roomId
		});
	}).catch(function(e){
		alert("getUserMedia() error: " + e.name);
	});
};

let showCallWindow = function(){
	let div = document.createElement("div");
	div.style.position = "absolute";
	div.style.top = "30px";
	div.style.left = "0px";
	div.style.width = "300px";
	let html = "상대방의 수락을 기다리고 있습니다.<br><button type='button' id='cancelCall'>취소</button>";
	div.innerHTML = html;
};

socket.on("call", function(){
	let count = 30;
	
	let flag = confirm("상대방이 화상 채팅을 신청했습니다.");
});

let hangup = function(){
	console.log("--> hang up");
	
	startBtn.innerHTML = "화상 채팅 시작";
	
	closeCall();
};

let closeCall = function(){
	console.log("--> close call");
	
	if (myPeerConnection){
		myPeerConnection.onaddstream = null;
		myPeerConnection.onremovestream = null;
		myPeerConnection.onnicecandidate = null;

		remoteCam.srcObject = null;

		myPeerConnection.close();
		myPeerConnection = null;
	}
	
	localStream.srcObject = null;
};

let createPeerConnection = function(){
	console.log("--> create peer connection");

	let rpc = new RTCPeerConnection();

	// Set up event handlers for the ICE negotiation process.
	rpc.onicecandidate = handleICECandidateEvent;
	rpc.onaddstream = handleAddStreamEvent;
	rpc.onnremovestream = handleRemoveStreamEvent;

	return rpc;
}

let handleICECandidateEvent = function(event){
	console.log("--> handle ice candidate event");

	if (event.candidate){
		socket.emit("new-ice-candidate", {
			roomId: room.roomId,
			candidate: event.candidate
		});
	}
}

let handleAddStreamEvent = function(event){
	console.log("--> handle add stream event");

	remoteCam.width = 400;
	remoteCam.height = 300;
	remoteCam.srcObject = event.stream;
	startBtn.innerHTML = "화상 채팅 종료";
}

let handleRemoveStreamEvent = function(event){
	console.log("--> handle remove stream event");

	closeCall();
}

let handleICEConnectionStateChangeEvent = function(event){
	console.log("--> handle ice connection state change event");

	switch (myPeerConnection.iceConnectionState){
		case "closed":
		case "failed":
		case "disconnect":
			hangup();
			break;
	}
}

let handleSignalingStateChangeEvent = function(event){
	console.log("--> handle signaling state change event");

	switch (myPeerConnection.signalingState){
		case "closed":
			hangup();
			break;
	}
}
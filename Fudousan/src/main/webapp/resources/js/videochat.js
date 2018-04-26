let script = document.createElement("script");
script.src = "/fudousan/resources/js/cookie.js";
document.body.appendChild(script);

const startBtn = document.getElementById("startVideoChatBtn");
startBtn.onclick = pushStartBtn;

let localCam = document.getElementById("localCam");
let remoteCam = document.getElementById("remoteCam");

let localStream = null;
let myPeerConnection;

let langSet = {
	ko: {
		0: "화상 채팅 시작",
		1: "화상 채팅 종료",
		2: "상대방의 수락을 기다리고 있습니다.",
		3: "취소",
		4: "상대방이 화상 채팅을 신청했습니다.",
		5: "상대방이 없습니다.",
		6: "상대방이 화상 채팅을 거절했습니다."
	},
	jp: {
		
	},
	en: {
		
	}
};

let lang = getCookie();

if (lang === ""){
	lang = "ko";
}

function pushStartBtn(){
	if (startBtn.value === "화상 채팅 시작"){
		call();
	}
	else {
		hangup();
		
		socket.emit("hangup", {
			roomId: room.roomId
		});
	}
};

function call(){
	console.log("--> call");
	
	startBtn.innerHTML = "화상 채팅 종료";
	
	navigator.mediaDevices.getUserMedia({video: true, audio: true}).then(function(stream){
		localStream = stream;
		localCam.width = 400;
		localCam.height = 300;
		localCam.srcObject = localStream;
	}).then(function(){
		socket.emit("call", {roomId: room.roomId});
		
		showCallWindow();
	}).catch(function(e){
		alert("getUserMedia() error: " + e.name);
	});
};

function showCallWindow(){
	let div = document.createElement("div");
	div.id = "callingDiv";
	div.style.position = "absolute";
	div.style.top = "30px";
	div.style.left = "0px";
	div.style.width = "300px";
	div.style.color = "rgb(255, 255, 255)";
    div.style.padding = "10px";
    div.style.background = "rgba(0, 0, 0, 0.5)";
    
	let html = "상대방의 수락을 기다리고 있습니다.<br><button type='button' id='cancelCallBtn'>취소</button>";
	div.innerHTML = html;
	
	document.body.appendChild(div);
	
    let cancelCallBtn = document.getElementById("cancelCallBtn");
    cancelCallBtn.style.marginTop = "10px";
    cancelCallBtn.onclick = function(){
    	removeDiv("callingDiv");
    	
    	socket.emit("cancel-call", {roomId: room.roomId});
    };
    
    let btnDiv = document.getElementById("btnDiv");
    btnDiv.style.textAlign = "right";
};

function removeDiv(id){
	let div = document.getElementById(id);
	div.remove();
}

socket.on("call", function(){
	startBtn.disabled = true;
	
	receiveCallWindow();
});

socket.on("cancel-call", function(){
	let receiveCallDiv = document.getElementById("receiveCallDiv");
	while (receiveCallDiv.firstChild){
		receiveCallDiv.removeChild(receiveCallDiv.firstChild);
	}
	
	let html = "상대방이 화상 채팅 연결을 취소하였습니다.";
	receiveCallDiv.innerHTML = html;
	
	setTimeOut(function(){
		removeDiv("receiveCallDiv");
	}, 3000);
});

socket.on("not-found-target", function(){
	removeDiv("callingDiv");
	
	alert("상대방이 없습니다.");
});

function receiveCallWindow(){
	let div = document.createElement("div");
	div.id = "receiveCallDiv";
	div.style.position = "absolute";
	div.style.top = "30px";
	div.style.left = "0px";
	div.style.width = "300px";
	div.style.color = "rgb(255, 255, 255)";
    div.style.padding = "10px";
    div.style.background = "rgba(0, 0, 0, 0.5)";
    
	let html  = "상대방이 화상 채팅을 신청했습니다.<br>";
		html += "<button type='button' id='acceptCallBtn'>수락</button>";
		html += "<button type='button' id='refuseCallBtn'>취소</button>";
	div.innerHTML = html;
	
	document.body.appendChild(div);
	
	let acceptCallBtn = document.getElementById("acceptCallBtn");
	acceptCallBtn.onclick = function(){
		removeDiv("receiveCallDiv");
		
		socket.emit("answer-call", {
			roomId: room.roomId,
			answer: true
		});
		
		startBtn.innerHTML = "화상 채팅 종료";
		startBtn.disabled = false;
	};
	let refuseCallBtn = document.getElementById("refuseCallBtn");
	refuseCallBtn.onclick = function(){
		removeDiv("receiveCallDiv");
		
		socket.emit("answer-call", {
			roomId: room.roomId,
			answer: false
		});
		
		startBtn.disabled = false;
	};
}

socket.on("answer-call", function(answer){
	if (answer == "true"){
		sendVideoOffer();
	}
	else {
		removeDiv("callingDiv");
		
		alert("상대방이 화상 채팅을 거절했습니다.");
	}
});

function sendVideoOffer(){
	myPeerConnection = createPeerConnection();

	if (localStream == null){
		navigator.mediaDevices.getUserMedia({video: true, audio: true}).then(function (stream){
			localStream = stream;
			localCam.width = 400;
			localCam.height = 300;
			localCam.srcObject = localStream;
			myPeerConnection.addStream(localStream);
		});
	}
	else {
		myPeerConnection.addStream(localStream);
	}

	myPeerConnection.createOffer().then(function(offer){
		return myPeerConnection.setLocalDescription(offer);
	}).then(function(){
		console.log("--> send video offer");
		socket.emit("video-offer", {
			roomId: room.roomId,
			sdp: myPeerConnection.localDescription
		});
	}).catch(function(err){
		console.log(err);
	});
}

socket.on("video-offer", function(sdp){
	console.log("--> receive video-offer");

	myPeerConnection = createPeerConnection();

	let desc = new RTCSessionDescription(sdp);

	myPeerConnection.setRemoteDescription(desc).then(function(){
		if (localStream == null){
			return navigator.mediaDevices.getUserMedia({video: true, audio: true});
		}
		else {
			return localStream;
		}
	}).then(function(stream){
			localCam.width = 400;
			localCam.height = 300;
			localCam.srcObject = stream;
			myPeerConnection.addStream(stream);
	}).then(function(){
		console.log("--> create answer");
		return myPeerConnection.createAnswer();
	}).then(function(answer){
		console.log("--> set local description");
		return myPeerConnection.setLocalDescription(answer);
	}).then(function(){
		console.log("--> send video-answer");
		socket.emit("video-answer", {
			roomId: room.roomId,
			sdp: myPeerConnection.localDescription
		});
	}).catch(function(err){
		console.log(err);
	})
});

socket.on("video-answer", function(sdp){
	console.log("--> receive video-answer");

	let desc = new RTCSessionDescription(sdp);
	myPeerConnection.setRemoteDescription(desc);
});

socket.on("new-ice-candidate", function(candidate){
	console.log("--> receive new-ice-candidate");

	myPeerConnection.addIceCandidate(new RTCIceCandidate(candidate));
});

socket.on("hangup", function(){
	console.log("--> receive hang up");
	
	closeCall();
});

function hangup(){
	console.log("--> hang up");
	
	startBtn.innerHTML = "화상 채팅 시작";
	
	closeCall();
};

function closeCall(){
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

function createPeerConnection(){
	console.log("--> create peer connection");

	let rpc = new RTCPeerConnection();

	// Set up event handlers for the ICE negotiation process.
	rpc.onicecandidate = handleICECandidateEvent;
	rpc.onaddstream = handleAddStreamEvent;
	rpc.onnremovestream = handleRemoveStreamEvent;

	return rpc;
}

function handleICECandidateEvent(event){
	console.log("--> handle ice candidate event");

	if (event.candidate){
		socket.emit("new-ice-candidate", {
			roomId: room.roomId,
			candidate: event.candidate
		});
	}
}

function handleAddStreamEvent(event){
	console.log("--> handle add stream event");

	remoteCam.width = 400;
	remoteCam.height = 300;
	remoteCam.srcObject = event.stream;
	startBtn.innerHTML = "화상 채팅 종료";
}

function handleRemoveStreamEvent(event){
	console.log("--> handle remove stream event");

	closeCall();
}

function handleICEConnectionStateChangeEvent(event){
	console.log("--> handle ice connection state change event");

	switch (myPeerConnection.iceConnectionState){
		case "closed":
		case "failed":
		case "disconnect":
			hangup();
			break;
	}
}

function handleSignalingStateChangeEvent(event){
	console.log("--> handle signaling state change event");

	switch (myPeerConnection.signalingState){
		case "closed":
			hangup();
			break;
	}
}
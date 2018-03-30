<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/jquery-3.3.1.js"></script>
<script>
function roomSearch(){
	var roomSearch = document.getElementById("roomSearch").value; //방검색
	var memberId = document.getElementById("memberId").value; //사용자아이디
	if(roomSearch == ''){
		alert("검색할 방의 이름을 입력해주세요");
		$('#roomSearch').focus();
		return false;
	}
	location.href ="searchMyRoom?roomSearch="+roomSearch+"&memberId="+memberId;
}

function favoriteSearch(){
	var favoSearch = document.getElementById("favoSearch").value; //방검색
	var memberId = document.getElementById("memberId").value; //사용자아이디
	if(favoSearch == ''){
		alert("검색할 찜한 방의 이름을 입력해주세요");
		$('#favoSearch').focus();
		return false;
	}
	location.href ="searchFavorite?favoSearch="+favoSearch+"&memberId="+memberId;
}

function sayonara(){
	var realsayo = confirm("정말로 의뢰를 거절하시겠소?");
	if(realsayo){
		var client = document.getElementById("client").value;
		var accepter = document.getElementById("accepter").value;
		location.href = "cancelAdviceTrue?customer="+client+"&interior="+accepter;
	}
	return false;
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 페이지</title>
</head>
<body>
<c:if test="${tfresult eq true }">
	<script>
		alert("인테리어 업자의 도움요청을 거절하였습니다.");
	</script>
</c:if>

	<table>
		<div class="header">
		</div>
		
		<div id=customerMaemulCheck>
			<tr>
				<td><h3>3D 작성 매물 확인</h3>
				<input type="hidden" id="memberId" name="memberId" value=1></td>
			</tr>
			<tr>
				<th>
					<input type="text" id ="roomSearch" name="roomSearch"><input type="button" onclick="roomSearch()" value="검색">
				</th>
			</tr>
			<tr>
				<c:forEach var="room" items="${rlist}">
			 		<td>${room.snapshot} ${room.map}
			 		    <input type="button" value="꾸미기" onclick="ggumigi(${room.estateId})">
			 		</td>
				</c:forEach>
			</tr>
		</div>
		
		<div id=showSelection>
			<tr>
				<td><h3>찜한 매물 확인</h3><br></td>
			</tr>
			<tr>
				<th><input type="text" name="favoSearch" id="favoSearch"><input type="button" onclick="favoriteSearch()" value="검색"></th><br>
			</tr>
			<tr>
				 <c:forEach var="favorite" items="${flist}">
			 		<td>${favorite.memberId}${favorite.creDate}<input type="button" value="팝업정보" onclick="popupInfoMaemul(${favorite.estate})">
			 		</td>
				</c:forEach>
			</tr>
		</div>
	
		<div id="showHelper">
			<tr>
				<td><h3>내가 인테리어 업자에게 보낸 요청</h3></td>
			</tr>
			<tr>
				<c:forEach var="helper" items="${alist}">
			 		<td>${helper.requestedMemeberId}님에게 도움을 요청하셨습니다.</td>
				</c:forEach>
			</tr>
			<tr>
				<td><h3>인테리어 업자가 보낸 요청 목록</h3></td>
			</tr>
			<tr>
				<c:forEach var="helpRes" items="${rclist}">
			 		<td>
			 			${helpRes.requestedMemeberId}님이 ${helpRes.requestMemberId }님의 요청을 승락하셨습니다. 
						<input type="button" value="거절" id="cancel" name="cancel" onclick="sayonara()">
						<input type="hidden" value="${helpRes.requestMemberId }" id="client" name="client">
						<input type="hidden" value="${helpRes.requestedMemeberId }" id="accepter" name="accepter">
			 		</td>
				</c:forEach>
			</tr>
		</div>
		
		<div class="footer">
		</div>
	</table>
</body>
</html>
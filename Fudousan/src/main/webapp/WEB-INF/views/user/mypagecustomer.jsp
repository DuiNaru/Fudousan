<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
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
		location.href = "cancelAdvicedivue?customer="+client+"&interior="+accepter;
	}
	return false;
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 페이지</title>
<body class="container">
<c:if test="${tfresult eq true }">
	<script>
		alert("인테리어 업자의 도움요청을 거절하였습니다.");
	</script>
</c:if>
	<header class="col-sm-12">헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-4">
			<label class="col-sm-12">3D 작성 매물 확인</label>
			<input type="text" id ="roomSearch" name="roomSearch"><input type="button" onclick="roomSearch()" value="검색">
			<input type="hidden" id="memberId" name="memberId" value=1>
			<c:forEach var="room" items="${rlist}">
				<div class="col-sm-12 form-group">
					<label><c:out value="${room.snapshot} ${room.map}"/></label>
			 		<input type="button" value="꾸미기" onclick="ggumigi(${room.estate.estateId})">
				</div>
			</c:forEach>
		</div>
		
		
		<div class="col-sm-4">
			<label class="col-sm-12">찜한 매물 보기</label>
			<input type="text" name="favoSearch" id="favoSearch"><input type="button" onclick="favoriteSearch()" value="검색">
			<c:forEach var="favorite" items="${flist}">
				<div class="col-sm-12 form-group">
					<label><c:out value="${favorite.memberId}${favorite.creDate}${favorite.estate.estateName }"/></label>
					<input type="button" value="팝업정보" onclick="popupInfoMaemul(${favorite.estate})">
				</div>
			</c:forEach>
		</div>
		
		
		<div class="col-sm-4">
			<label class="col-sm-12">내가 인테리어 업자에게 도움요청</label>
			<c:forEach var="helper" items="${alist}">
				<label><c:out value="${helper.requestedMemeberId}님에게 도움을 요청하셨습니다."/></label>
			</c:forEach>
			
			<label class="col-sm-12">인테리어 업자가 보낸 요청 목록</label>
			<c:forEach var="helpRes" items="${rclist}">
			 		<div class="col-sm-12 form-group">
			 			<label><c:out value="${helpRes.requestedMemeberId}님이 ${helpRes.requestMemberId }님의 요청을 승락하셨습니다. "/></label>
						<input type="button" value="거절" id="cancel" name="cancel" onclick="sayonara()">
						<input type="hidden" value="${helpRes.requestMemberId }" id="client" name="client">
						<input type="hidden" value="${helpRes.requestedMemeberId }" id="accepter" name="accepter">
			 		</div>
			</c:forEach>
		</div>
	</div> <!-- 전체 12칸 짜리div -->
	<footer class="col-sm-12">푸터</footer>
</body>
</html>
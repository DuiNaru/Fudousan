<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/jquery-3.3.1.js"></script>
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
	if(roomSearch == ''){
		alert("검색할 방의 이름을 입력해주세요");
		$('#roomSearch').focus();
		return false;
	}
	location.href ="searchFavorite?favoSearch="+favoSearch+"&memberId="+memberId;
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 페이지</title>
</head>
<body>
	<table>
		<div class="header">
		</div>
		
		<div id=customerMaemulCheck>
			<tr>
				<td><h3>3D 작성 매물 확인</h3></td>
				<th><input type="text" id ="roomSearch" name="roomSearch">
				<input type="hidden" id="memberId" name="memberId" value="abc"></th>
				<th><input type="button" onclick="roomSearch()" value="검색"></th>
				<br>
				
			</tr>
			<tr>
				<c:forEach var="room" items="${rlist}">
			 		<td>
			 			${room.estateId}
			 		    <input type="button" value="꾸미기" onclick="ggumigi(${room.estateId})">
			 			
			 		</td>
				</c:forEach>
			</tr>
		</div>
		
		<div id=showSelection>
			<tr>
				<td><h3>찜한 매물 확인</h3><br></td>
				<th><input type="text" name="favoSearch" id="favoSearch"></th><th><input type="button" onclick="favoriteSearch()" value="검색"></th><br>
			</tr>
			<tr>
				<c:forEach var="favorite" items="${flist}">
			 		<td>${favorite.estate}<input type="button" value="팝업정보" onclick="popupInfoMaemul(${favorite.estate})">
			 		</td>
				</c:forEach>
			</tr>
		</div>
	
		<div id="showHelper">
			<tr>
				<td><h3>내가 인테리어 업자에게 보낸 요청</h3><br></td>
				<c:forEach var="helper" items="${helperList}">
			 		<td>${helper.name}님에게 ${helper.pname } </td>
				</c:forEach>
			</tr>
			<tr>
				<td><h3>인테리어 업자가 보낸 요청 목록</h3><br></td>
				<c:forEach var="helpRes" items="${helpResList}">
			 		<td>${helpRes.name}님이 ${user.name }님의 요청을 ${helpRes.answer } </td>
				</c:forEach>
			</tr>
		</div>
		
		<div class="footer">
		</div>
	</table>
</body>
</html>
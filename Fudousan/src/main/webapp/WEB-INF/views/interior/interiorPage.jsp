<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>インタリアページ</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript">
	function unConfirm(index, requestMemberId, roomId) {
		$.ajax({
			url:"../unconfirm?requestMemberId="+requestMemberId+"&roomId="+roomId,
			type:"GET",
			success:function(data) {
				if(data) {
					$("#req"+index).remove();
				} else {
					alert("삭제에 실패하였습니다.");
				}
			},
			error:function(e) {
				console.log(e);
				alert("삭제 중 오류가 발생하였습니다.");
			}
		});
	}
	
	$(function () {
		$("input[name^=public]:radio").change(function (){
			var roomId = $(this).attr("roomId");
			var value = $(this).val();
			$.ajax({
				url:"../changeRoomPublic?roomId="+roomId+"&roomPublic="+value,
				type:"GET",
				success:function(data) {
					if(data == -1) {
						alert("공개여부 변경에 실패하였습니다.");
						$("input[name=public"+roomId+"]").filter("[value="+(1-value)+"]").check();
					}
				},
				error:function(e) {
					console.log(e);
					alert("공개여부 변경 중 오류가 발생하였습니다.");
					$("input[name=public"+roomId+"]").filter("[value="+(1-value)+"]").check();
				}
			});
		});
		
	});
</script>
</head>
<body class="container">
	<header class="col-sm-12">헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-12">
			<h1>사용자 요청 리스트</h1>
			<c:forEach var="advice" varStatus="status" items="${adviceList}">
				<div id="req${status.index}" class="col-sm-12">
					<label>${advice.room.estate.estateId } : ${advice.room.estate.estateName }</label>
					<div>
						<button class="btn btn-default">인테리어 시작</button>
						<input class="btn btn-danger" type="button" value="취소" onclick="unConfirm(${status.index}, ${advice.requestMemberId}, ${advice.room.roomId})">
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-12">
			<h1>3D 작성 매물 확인</h1>
			<c:forEach var="room" varStatus="status" items="${realRoomList}">
				<div id="room${status.index}" class="col-sm-12">
					<label>${room.estate.estateId } : ${room.estate.estateName }</label>
					<input class="btn btn-default" type="button" value="꾸미기">
					<label class="radio-inline"><input name="public${room.roomId}" type="radio" value="1" roomId="${room.roomId}"<c:if test="${room.roomPublic == 1}"> checked="checked"</c:if>>공개</label>
					<label class="radio-inline"><input name="public${room.roomId}" type="radio" value="0" roomId="${room.roomId}"<c:if test="${room.roomPublic == 0}"> checked="checked"</c:if>>비공개</label>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-12">
			<h1>내가 만든 리스트</h1>
			<c:forEach var="virtual" varStatus="status" items="${notRealRoomList}">
				<div id="virtual${status.index}" class="col-sm-12">
					<label>${virtual.roomId} : ${virtual.snapshot}</label>
					<div>
						<div>
					<input class="btn btn-default" type="button" value="꾸미기">
					<input class="btn btn-default" type="button" value="수정">
					<input class="btn btn-default" type="button" value="삭제">
						</div>
						<div>
							<label class="radio-inline"><input name="public${virtual.roomId}" type="radio" value="1" roomId="${virtual.roomId}"<c:if test="${virtual.roomPublic == 1}"> checked="checked"</c:if>>공개</label>
							<label class="radio-inline"><input name="public${virtual.roomId}" type="radio" value="0" roomId="${virtual.roomId}"<c:if test="${virtual.roomPublic == 0}"> checked="checked"</c:if>>비공개</label>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<footer class="col-sm-12">푸터</footer>
</body>
</html>
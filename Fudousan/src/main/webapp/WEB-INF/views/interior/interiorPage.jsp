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
		</div>
		<div class="col-sm-12">
		</div>
	</div>
	<footer class="col-sm-12">푸터</footer>
</body>
</html>
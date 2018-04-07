<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理者ページ</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript">
	function confirm(agencyId) {
		location.href="./confirm?agencyId="+agencyId;
	}
	function deleteItem(itemId) {
		$.ajax({
			url:"../item/deleteItem?itemId="+itemId,
			type:"GET",
			success:function(data) {
				if(data || data == "true") {
					$("#item"+itemId).remove();
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
	function searchItem() {
		$.ajax({
			url:"../item/searchItem?itemName="+$("#itemName").val(),
			type:"GET",
			dataType:"JSON",
			success:function(obj) {
				$("#itemList").empty();
				$(obj).each(function(index, data) {
					var html = "";
					html += '<div id="item${item.itemId}" class="col-sm-offset-1 col-sm-10">';
					html += '<div class="col-sm-12">';
					html += '	<label class="col-sm-6">'+data.itemName+'</label>';
					html += '	<div class="col-sm-6">';
					html += '		<a class="btn btn-default" href="../item/itemModifyPage?itemId='+data.itemId+'">修正</a>';
					html += '		<input class="btn btn-default" type="button" onclick="deleteItem('+data.itemId+')" value="削除">';
					html += '	</div>';
					html += '</div>';
					$("#itemList").append(html);
				});
			},
			error:function(e) {
				console.log(e);
			}
		});
		
		return false;
	}
</script>
</head>
<body class="container">
	<header class="col-sm-12">헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-8">
			<label class="col-sm-12">申し込み中不動産屋リスト</label>
			<c:forEach var="agency" items="${agencylist }">
				<div class="col-sm-12 form-group">
					<label><c:out value="${agency.name }"/></label>
					<button class="btn btn-default" onclick="confirm(${agency.agencyId})">承認</button>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-4">
			<label>アイテム情報管理</label>
			<div class="col-sm-12 form-group">
				<form class="form-inline" method="GET" onsubmit="return searchItem()">
					<input class="form-control" id="itemName" name="itemName" type="text" placeholder="アイテム名">
					<input class="btn btn-default" type="submit" value="検索">
				</form>
			</div>
			<div id="itemList" class="col-sm-12">
				<c:forEach var="item" items="${itemList }">
					<div id="item${item.itemId}" class="col-sm-offset-1 col-sm-10">
						<div class="col-sm-12">
							<label class="col-sm-6">${item.itemName }</label>
							<div class="col-sm-6">
								<a class="btn btn-default" href="../item/itemModifyPage?itemId=${item.itemId}">修正</a>
								<input class="btn btn-default" type="button" onclick="deleteItem(${item.itemId})" value="削除">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-12">
				<a class="btn btn-default" href="../item/itemAddPage">アイテム登録</a>
			</div>
		</div>
	</div>
	<footer class="col-sm-12">푸터</footer>
</body>
</html>
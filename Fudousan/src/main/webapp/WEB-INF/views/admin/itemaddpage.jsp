<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>アイテム追加パージ</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript">
	function addsitecolumn() {
		var column = "<label>アドレス</label><input class='form-control' name='sites' type='text'></input>";
		$("#sitelist").append(column);
	}
	
	function formreset() {
		if (confirm("リセットなさいますか。")) {
			$("#sitelist").empty();
			return true;
		}
		return false;
	}
	
	function formsubmit() {
		if ($("#name").val() == null || $("#name").val() == "") {
			$("#name").focus();
			return false;
		}
		if ($("#type").val() == null || $("#type").val() == "") {
			$("#type").focus();
			return false;
		}
		if ($("#model").val() == null || $("#model").val() == "") {
			$("#model").focus();
			return false;
		}
		if ($("#files").val() == null || $("#files").val() == "") {
			$("#files").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body class="container">
	<header>헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-offset-3 col-sm-6">
			<form id="itemform" action="additem" method="post" onreset="formreset()" onsubmit="return formsubmit()" enctype="multipart/form-data">
				<div class="form-group">
					<label>アイテム名</label>
					<input id="name" name="itemName" class="form-control" type="text" required="required">
				</div>
				<div class="form-group">
					<label>アイテム説明</label>
					<input id="text" name="text" class="form-control" type="text">
				</div>
				<div class="form-group">
					<label>アイテムタイプ</label>
					<select id="type" name="itemTypeId" class="form-control" required="required">
						<option value="1">test</option>
					</select>
				</div>
				<div class="form-group">
					<label>3Dモデルファイル名</label>
					<input id="model" name="modelFileName" class="form-control" type="text" required="required">
				</div>
				<div class="form-group">
					<label>ファイルディレクトリ</label>
					<input id="files" name="files" class="form-control" webkitdirectory directory type="file" required="required">
				</div>
				<div class="form-group">
					<label>関連サイト</label>
					<div id="sitelist">
					</div>
					<input class="btn btn-default" type="button" onClick="addsitecolumn()" value="サイト追加">
				</div>
				<div class="form-group">
					<input class="col-sm-6 btn btn-default" type="submit" value="アップロード">
					<input class="col-sm-6 btn btn-default" type="reset" value="リセット">
				</div>
			</form>
		</div>
	</div>
	<footer>푸터</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>アイテム追加パージ</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
</head>
<body class="container">
	<header>헤더</header>
	<div class="col-sm-12">
		<div class="col-sm-offset-3 col-sm-6">
			<form action="" method="post">
				<div class="form-group">
					<label>アイテム名</label>
					<input name="itemName" class="form-control" type="text">
				</div>
				<div class="form-group">
					<label>アイテム説明</label>
					<input name="text" class="form-control" type="text">
				</div>
				<div class="form-group">
					<label>アイテムタイプ</label>
					<select name="itemType" class="form-control">
						<option value="0">test</option>
					</select>
				</div>
				<div class="form-group">
					<label>3Dモデルファイル名</label>
					<input name="modelFileName" class="form-control" type="text">
				</div>
				<div class="form-group">
					<label>ファイルディレクトリ</label>
					<input name="files" class="form-control" webkitdirectory directory type="file">
				</div>
				<div class="form-group">
					<label>関連サイト</label>
					<button class></button>
				</div>
				<div class="form-group">
					<input type="submit" value="アップロード">
					<input type="reset" value="リセット">
				</div>
			</form>
		</div>
	</div>
	<footer>푸터</footer>
</body>
</html>
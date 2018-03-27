<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agency Join</title>
</head>
<body>

<div class="container">
		<div class="header">
			<h1>HEADER</h1>
			<div id="join">
			<form action="">
				<h1>エージェント登録</h1>
				<%@include file="include/membercontent.jsp" %>
				<table>
					<tr>
						<td>エージェント名</td>
						<td><input type="text"></td>			
					</tr>
					<tr>
						<td>営業鑑札番号</td>
						<td><input type="text"></td>			
					</tr>
					<tr>
						<td>住所（都道府県名）</td>
						<td><input type="text"></td>			
					</tr>
					<tr>
						<td>住所（市区町村名）</td>
						<td><input type="text"></td>			
					</tr>
					<tr>
						<td>住所（地区名）</td>
						<td><input type="text"></td>			
					</tr>
					<tr>
						<td>住所（詳細）</td>
						<td><input type="text"></td>			
					</tr>
				</table>
			</form>
		</div>
		<div class="footer">
			<h1>FOOTER</h1>
		</div>
	</div>
</div>
</body>
</html>
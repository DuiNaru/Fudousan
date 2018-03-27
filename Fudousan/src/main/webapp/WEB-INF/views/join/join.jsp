<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
</head>
<body>
<div class="container">
		<div class="header">
			<h1>HEADER</h1>
		</div>
	
		<!-- 회원가입(사용자) -->
		<div id="join">
			<form action="">
				<table>
					<tr>
						<td>メール</td>
						<td><input type="text" placeholder="email"></td>
					</tr>
					<tr>
						<td>パスワード</td>
						<td><input type="password" placeholder="password"></td>
					</tr>	
					<tr>
						<td>電話番後</td>
						<td><input type="text" placeholder="phone"></td>
					</tr>
					<tr>
						<td>プロフィール写真</td>
						<td><input type="file"></td>
					</tr>
					<tr>
						<td>デザイナー有無</td>
						<td>
							<input type="radio" name="designer" value="yes">
							<input type="radio" name="designer" value="no">
						</td>
					</tr>
				
				</table>
				
			</form>
		</div>
		
		<div class="footer">
			<h1>FOOTER</h1>
		</div>
		
</div>
</body>
</html>
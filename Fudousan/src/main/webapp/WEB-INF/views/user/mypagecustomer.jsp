<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/jquery-3.3.1.js"></script>
<script> 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 페이지</title>
</head>
<body>
	<table>
		<tr></tr>
		<tr>
			<td><h3>3D 작성 매물 확인</h3></td>
			<th><input type="text" name="pro_type_search"></th><th><input type="button" onclick="product_search()" value="검색"></th><br>
		</tr>
		<tr>
			<c:forEach var="maemul" items="${maemul_list}">
		 		<td>${maemul.name}<input type="button" value="꾸미기" onclick="ggumigi(${maemul.num})"></td>
			</c:forEach>
		</tr>
		<div>
			<tr>
				<td><h3>찜한 매물 확인</h3><br></td>
				<th><input type="text" name="pro_type_search"></th><th><input type="button" onclick="product_search()" value="검색"></th><br>
			</tr>
			<tr>
				<c:forEach var="maemul" items="${maemul_list}">
			 		<td>${maemul.picture}<input type="button" value="팝업정보" onclick="popupInfoMaemul(${maemul.num})"></td>
				</c:forEach>
			</tr>
		</div>
	
		<div>
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
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="jquery-3.3.1.js"></script>
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
			<td><h3>매물</h3><input type="button" value="꾸미기" onclick="ggumigi()"></td>
		</tr>
	</table>
</body>
</html>
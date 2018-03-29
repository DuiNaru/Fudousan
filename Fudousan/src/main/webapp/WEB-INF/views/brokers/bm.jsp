<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리 페이지</title>
<script>
function estateId_delete(){
	if(confirm("정말로 삭제할 건가요?") == true){
		document.form.submit();
	}else{
		return ;
	}
}

function snapshot_delete(){
	if(confirm("정말로 삭제할 건가요 ?") ==true){
		document.form.submit();
	}else{
		return;
	}
}


</script>


</head>
<body>



 <!-- 헤더 영역 -->

<hr>
<h3> 매물 관리 </h3>


<img alt="" src="">
<input type="radio" name="cr_page">공개 
<input type="radio" name="cr_page">비공개
<input type="button" value="삭제" onclick="estateId_delete"> 
<!-- 매물 수정으로 이동 -->
<input type="button" value="수정" onclick="location.href='/brokers/bc.jsp'">
<!-- 매물 작성으로 이동 -->

<input type="button" value="매물 작성" onclick="location.href='/brokers/br.jsp'"/>
<hr>

<h3> 매물 3D 모델링 관리</h3>
<!-- 모델링 스냅 샷 자리  -->
<input type="button" value="작성">
<input type="button" value="삭제" onclick="snapshot_delete"> <input type="button" value="수정">


<!-- footer 영역 -->



</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<title>메일 보내기</title>
</head>
<body>
<div class="container">
  <h4>메일 보내기</h4>
  <form action="helpCall" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
    
    
    

    
    
    
    
      <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" class="form-control" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" value="띵동!! fodousan 입니다." class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
    <input name="content" cols="120" rows="12" style="width:100%; resize:none" value="${sessionScope.loginEmail}님이 인테리어 요청 메시지를 보냈습니다. "  class="form-control">
    
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
</body>
</html> 
		


	

	
	
		






</table>




</body>
</html>
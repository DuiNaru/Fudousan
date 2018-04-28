<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

 
 <!--  member update form  -->
 
 <article class="container">
        <div class="page-header">
          <h1>회원정보수정 <small>basic update form</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="modifyMember" method="post" enctype="multipart/form-data">
          
            <div class="form-group">
              <label for="InputName">name</label>
              <input type="text" class="form-control" id="InputName" placeholder="이름" name="memberName" value="${member.memberName }">
            </div>
            
            <div class="form-group">
              <label for="InputPassword1">password</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호" name="password">
            </div>
            
            <div class="form-group">
              <label for="InputPassword2">confirm password</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            
            <div class="form-group">
              <label for="InputEmail">email</label>
              <input type="email" class="form-control" id="InputEmail" placeholder="email" name="email" value="${member.email }">
            </div>
            
            <div class="form-group">
              <label for="InputText">phone</label>
              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요" name="phone" value="${member.phone }">
            </div>
			<div class="input-group">
			     <label for="InputText">Member Introduce</label>
			    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요" name="text" >${member.text }</textarea>     
			</div>
		
			<div class="form-group">
			    <label for="InputPhoto">photo</label>
		    	<img alt="이미지 없음" src="${member.picture }">
				<div class="input-group input-file" name="Fichier1">
					<span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button">선택</button>
		    		</span>
		    		<input type="text" class="form-control" placeholder='파일을 업로드해주세요' name="picture" value="${member.picture }"/>
		    		<span class="input-group-btn">
		       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
		    		</span>
				</div>
			</div>

            <div class="form-group">
               <label for="InputDesigner">디자이너 이십니까?</label>
               <div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="designer" id="option1" autocomplete="off" value="1" checked> Yes
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="designer" id="option2" autocomplete="off" value="0"> No
				  </label>
				</div>
            </div>
        
         
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">회원정보 수정 취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
</article>
 
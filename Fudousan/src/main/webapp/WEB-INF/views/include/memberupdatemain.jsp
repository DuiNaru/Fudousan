<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

 
 <!--  member update form  -->
 
 <article class="container">
        <div class="page-header">
          <h1 data-lang="84">회원정보수정 <small>basic update form</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="modifyMember" method="post" enctype="multipart/form-data" onsubmit="return formsubmit()" >
          
            <div class="form-group">
              <label for="InputName" data-lang="8" >name</label>
              <input type="text" class="form-control" id="InputName" placeholder="이름" data-lang="8" name="memberName" value="${member.memberName }">
            </div>
            
            <div class="form-group">
              <label for="InputPassword1" data-lang="3">password</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호" data-lang="3" name="password">
            </div>
            
            <div class="form-group">
              <label for="InputPassword2" data-lang="9">confirm password</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" data-lang="9">
              <p class="help-block" data-lang="10">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            
            <div class="form-group">
              <label for="InputEmail" data-lang="2">email</label>
              <input type="email" class="form-control" id="InputEmail" readonly="readonly" placeholder="email" data-lang="2" name="email" value="${member.email }">
            </div>
            
            <div class="form-group">
              <label for="InputText" data-lang="11">phone</label>
              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요" data-lang="11" name="phone" value="${member.phone }">
            </div>
			<div class="input-group">
			     <label for="InputText" data-lang="13">Member Introduce</label>
			     <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요" data-lang="13" name="text" >${member.text }</textarea>     
			</div>
		
			<div class="form-group">
			    <label for="InputPhoto" data-lang="15">photo</label>
			    <div>
			    	<c:if test="${member.picture} != null">
			    		<img class="col-sm-12" src="/fudousan${member.picture}" id="uploadPictures">
					</c:if>
				</div>
				<div class="input-group input-file" name="file">
					<span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button" data-lang="16">선택</button>
		    		</span>
		    		<input type="text" class="form-control" placeholder='파일을 업로드해주세요' data-lang="17" name="picture" value="${member.picture }"/>
		    
				</div>
			</div>

            <div class="form-group">
               <label for="InputDesigner" data-lang="19">디자이너 이십니까?</label>
               <div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="designer" id="option1" autocomplete="off" value="1" checked><span data-lang="104">Yes</span> 
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="designer" id="option2" autocomplete="off" value="0"><span data-lang="105">No</span>
				  </label>
				</div>
            </div>
        
         
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info" data-lang="84">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>
            
            </div>
          </form>
        </div>
</article>
 
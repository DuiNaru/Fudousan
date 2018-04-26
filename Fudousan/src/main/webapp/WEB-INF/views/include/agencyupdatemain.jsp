<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
 <!--  agency update form  -->
 
 <article class="container">
        <div class="page-header">
          <h1>공인중개업자 회원정보 수정 <small>Agency basic update form</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="modifyAgency" method="post"  enctype="multipart/form-data">
             <div class="form-group">
	              <label for="InputName">name</label>
	              <input type="text" class="form-control" id="InputName" placeholder="이름" name="memberName">
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
	              <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소" name="email" value="${sessionScope.loginEmail}" disabled="disabled">
	            </div>
	            <div class="form-group">
	              <label for="InputText">phone</label>
	              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요" name="phone">
	            </div>
	            
				<div class="input-group">
				     <label for="InputText">Member Introduce</label>
				    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요" name="text"></textarea>     
				</div>
			
				<div class="form-group">
				    <label for="InputPhoto">photo</label>
					<div class="input-group input-file" name="Fichier1">
						<span class="input-group-btn">
			        		<button class="btn btn-default btn-choose" type="button">선택</button>
			    		</span>
			    		<input type="text" class="form-control" placeholder='파일을 업로드해주세요'  name="picture" />
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
         
           	<!-- agency join menu  -->
         
			 <div class="form-group">
              <label for="InputText">agency name</label>
              <input type="text" class="form-control" id="agencyname" placeholder="중개소 이름을 입력해 주세요" name="name">
            </div>
            
             <div class="form-group">
              <label for="InputText">biznum</label>
              <input type="text" class="form-control" id="agencybiznum" placeholder="사업 번호를 입력해 주세요" name="biznum">
            </div>
            
			<div class="form-group">
				<label for="InputText">Address Main</label>
	            <select class="selectpicker" data-live-search="true" name="main">
				  <option value='0' selected>-- 選択 --</option>
				  <!-- 홋카이도 -->
				  <option value='北海道'>北海道</option>
				  <!-- 아오모리현 -->
				  <option value='青森県'>青森県</option>
				  <!-- 이와테현 -->
				  <option value='岩手県'>岩手県</option>
				  <!-- 미야기현 -->
				  <option value='宮城県'>宮城県</option>
				  <!-- 아키타현 -->
				  <option value='秋田県'>秋田県</option>
				   <!-- 야가마타현 -->
				  <option value='山形県'>山形県</option>
				  <!-- 후쿠시마현-->
				  <option value='福島県'>福島県</option>
				  <!-- 이바라키현 -->
				  <option value='茨城県'>茨城県</option>
				  <!-- 토치 기현 -->
				  <option value='栃木県'>栃木県</option>
				  <!-- 군마현 -->
				  <option value='群馬県'>群馬県</option>
				  <!-- 사이타마 현 -->
				  <option value='埼玉県'>埼玉県</option>
				  <!-- 치바현 -->
				  <option value='千葉県'>千葉県</option>
				 <!--  도쿄도 -->
				  <option value='東京都'>東京都</option>
				  <!-- 가나가와 현 -->
				  <option value='神奈川県'>神奈川県</option>
				  <!-- 니가타 현 -->
				  <option value='新潟県'>新潟県</option>
				  <!-- 도야마 현 -->
				  <option value='富山県'>富山県</option>
				  <!-- 이시카와 현 -->
				  <option value='石川県'>石川県</option>
				  <!-- 후쿠이 현 -->
				  <option value='福井県'>福井県</option>
				  <!-- 야마나시 현 -->
				  <option value='山梨県'>山梨県</option>
				  <!-- 나가노 현 -->
				  <option value='長野県'>長野県</option>
				  <!-- 기후현 -->
				  <option value='岐阜県'>岐阜県</option>
				  <!-- 스지오카현 -->
				  <option value='静岡県'>静岡県</option>
				  <!-- 아이치현 -->
				  <option value='愛知県'>愛知県</option>
				  <!-- 미에현 -->
				  <option value='三重県'>三重県</option>
				  <!-- 시가현 -->
				  <option value='滋賀県'>滋賀県</option>
				  <!-- 교토부 -->
				  <option value='京都府'>京都府</option>
				  <!-- 오사카부 -->
				  <option value='大阪府'>大阪府</option>
				  <!-- 효고현 -->
				  <option value='兵庫県'>兵庫県</option>
				  <!-- 나라현 -->
				  <option value='奈良県'>奈良県</option>
				  <!-- 와카야마현 -->
				  <option value='和歌山県'>和歌山県</option>
				  <!-- 돗토리현 -->
				  <option value='鳥取県'>鳥取県</option>
				  <!-- 시마네현 -->
				  <option value='島根県'>島根県</option>
				  <!-- 오카야마현 -->
				  <option value='岡山県'>岡山県</option>
				  <!-- 히로시마현 -->
				  <option value='広島県'>広島県</option>
				  <!-- 야마구치현 -->
				  <option value='山口県'>山口県</option>
				  <!-- 도쿠시마현 -->
				  <option value='徳島県'>徳島県</option>
				  <!-- 가가와현 -->
				  <option value='香川県'>香川県</option>
				  <!-- 에히메현 -->
				  <option value='愛媛県'>愛媛県</option>
				  <!-- 고치현 -->
				  <option value='高知県'>高知県</option>
				  <!-- 후쿠오카현 -->
				  <option value='福岡県'>福岡県</option>
				  <!-- 사가현 -->
				  <option value='佐賀県'>佐賀県</option>
				  <!-- 나가사키현 -->
				  <option value='長崎県'>長崎県</option>
				  <!-- 구마모토현 -->
				  <option value='熊本県'>熊本県</option>
				  <!-- 오이타현 -->
				  <option value='大分県'>大分県</option>
				  <!-- 미야자키현 -->
				  <option value='宮崎県'>宮崎県</option>
				  <!-- 가고시마현 -->
				  <option value='鹿児島県'>鹿児島県</option>
				  <!-- 오키나와 -->
				  <option value='沖縄県'>沖縄県</option>
				</select>
            </div>
            
             <div class="form-group">
              <label for="InputText">Address middle</label>
              <input type="text" class="form-control" id="agencyaddressmiddle" placeholder="주소(市区町村名)를 입력해 주세요" name="addressMiddle">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address small</label>
              <input type="text" class="form-control" id="agencyaddresssmail" placeholder="주소(地区名)를입력해 주세요"  name="addressSmall">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address sub</label>
              <input type="text" class="form-control" id="agencyaddresssub" placeholder="주소(詳細)를 입력해 주세요"  name="addressSub">
            </div>
            
			<div class="input-group">
			     <label for="InputText">Agency Introduce</label>
			    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="중개소 소개를 입력해 주세요"  name="text"></textarea>       
			</div>
         
 			<br>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">회원정보 수정 취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
            
          </form>
        </div>
</article>
 
 


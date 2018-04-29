<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	              <input type="text" class="form-control" id="InputName" placeholder="이름" name="memberName" value="${agency.member.memberName}" required="required">
	            </div>
	            <div class="form-group">
	              <label for="InputPassword1">password</label>
	              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호" name="password" required="required">
	            </div>
	            <div class="form-group">
	              <label for="InputPassword2">confirm password</label>
	              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" required="required">
	              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
	            </div>
	            <div class="form-group">
	              <label for="InputEmail">email</label>
	              <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소" name="email" value="${sessionScope.loginEmail}" disabled="disabled" required="required">
	            </div>
	            <div class="form-group">
	              <label for="InputText">phone</label>
	              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요" name="phone" value="${agency.member.phone}">
	            </div>
	            
				<div class="input-group">
				     <label for="InputText">Member Introduce</label>
				    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요" name="membertext">${agency.member.text}</textarea>     
				</div>
			
				<div class="form-group">
				    <label for="InputPhoto">photo</label>
				    <c:if test="${!empty agency.member.picture}">
				    	<img class="col-sm-12" src="${agency.member.picture}">
				    </c:if>
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
					  <label class="btn btn-secondary<c:if test="${agency.member.designer == 1}"> active</c:if>">
					    <input type="radio" name="designer" id="option1" autocomplete="off" value="1"<c:if test="${agency.member.designer == 1}"> checked="checked"</c:if>> Yes
					  </label>
					  <label class="btn btn-secondary<c:if test="${agency.member.designer == 0}"> active</c:if>">
					    <input type="radio" name="designer" id="option2" autocomplete="off" value="0"<c:if test="${agency.member.designer == 0}"> checked="checked"</c:if>> No
					  </label>
					</div>
	            </div>
         
           	<!-- agency join menu  -->
         
			 <div class="form-group">
              <label for="InputText">agency name</label>
              <input type="text" class="form-control" id="agencyname" placeholder="중개소 이름을 입력해 주세요" name="name" value="${agency.name}">
            </div>
            
             <div class="form-group">
              <label for="InputText">biznum</label>
              <input type="text" class="form-control" id="agencybiznum" placeholder="사업 번호를 입력해 주세요" name="biznum" value="${agency.biznum}">
            </div>
            
			<div class="form-group">
				<label for="InputText">Address Main</label>
	            <select class="selectpicker" data-live-search="true" name="main">
				  <option value='0'<c:if test="${empty agency.addressMain}"> selected="selected"</c:if>>-- 選択 --</option>
				  <!-- 홋카이도 -->
				  <option value='北海道'<c:if test="${agency.addressMain == '北海道'}"> selected="selected"</c:if>>北海道</option>
				  <!-- 아오모리현 -->
				  <option value='青森県'<c:if test="${agency.addressMain == '青森県'}"> selected="selected"</c:if>>青森県</option>
				  <!-- 이와테현 -->
				  <option value='岩手県'<c:if test="${agency.addressMain == '岩手県'}"> selected="selected"</c:if>>岩手県</option>
				  <!-- 미야기현 -->
				  <option value='宮城県'<c:if test="${agency.addressMain == '宮城県'}"> selected="selected"</c:if>>宮城県</option>
				  <!-- 아키타현 -->
				  <option value='秋田県'<c:if test="${agency.addressMain == '秋田県'}"> selected="selected"</c:if>>秋田県</option>
				   <!-- 야가마타현 -->
				  <option value='山形県'<c:if test="${agency.addressMain == '山形県'}"> selected="selected"</c:if>>山形県</option>
				  <!-- 후쿠시마현-->
				  <option value='福島県'<c:if test="${agency.addressMain == '福島県'}"> selected="selected"</c:if>>福島県</option>
				  <!-- 이바라키현 -->
				  <option value='茨城県'<c:if test="${agency.addressMain == '茨城県'}"> selected="selected"</c:if>>茨城県</option>
				  <!-- 토치 기현 -->
				  <option value='栃木県'<c:if test="${agency.addressMain == '栃木県'}"> selected="selected"</c:if>>栃木県</option>
				  <!-- 군마현 -->
				  <option value='群馬県'<c:if test="${agency.addressMain == '群馬県'}"> selected="selected"</c:if>>群馬県</option>
				  <!-- 사이타마 현 -->
				  <option value='埼玉県'<c:if test="${agency.addressMain == '埼玉県'}"> selected="selected"</c:if>>埼玉県</option>
				  <!-- 치바현 -->
				  <option value='千葉県'<c:if test="${agency.addressMain == '千葉県'}"> selected="selected"</c:if>>千葉県</option>
				 <!--  도쿄도 -->
				  <option value='東京都'<c:if test="${agency.addressMain == '東京都'}"> selected="selected"</c:if>>東京都</option>
				  <!-- 가나가와 현 -->
				  <option value='神奈川県'<c:if test="${agency.addressMain == '神奈川県'}"> selected="selected"</c:if>>神奈川県</option>
				  <!-- 니가타 현 -->
				  <option value='新潟県'<c:if test="${agency.addressMain == '新潟県'}"> selected="selected"</c:if>>新潟県</option>
				  <!-- 도야마 현 -->
				  <option value='富山県'<c:if test="${agency.addressMain == '富山県'}"> selected="selected"</c:if>>富山県</option>
				  <!-- 이시카와 현 -->
				  <option value='石川県'<c:if test="${agency.addressMain == '石川県'}"> selected="selected"</c:if>>石川県</option>
				  <!-- 후쿠이 현 -->
				  <option value='福井県'<c:if test="${agency.addressMain == '福井県'}"> selected="selected"</c:if>>福井県</option>
				  <!-- 야마나시 현 -->
				  <option value='山梨県'<c:if test="${agency.addressMain == '山梨県'}"> selected="selected"</c:if>>山梨県</option>
				  <!-- 나가노 현 -->
				  <option value='長野県'<c:if test="${agency.addressMain == '長野県'}"> selected="selected"</c:if>>長野県</option>
				  <!-- 기후현 -->
				  <option value='岐阜県'<c:if test="${agency.addressMain == '岐阜県'}"> selected="selected"</c:if>>岐阜県</option>
				  <!-- 스지오카현 -->
				  <option value='静岡県'<c:if test="${agency.addressMain == '静岡県'}"> selected="selected"</c:if>>静岡県</option>
				  <!-- 아이치현 -->
				  <option value='愛知県'<c:if test="${agency.addressMain == '愛知県'}"> selected="selected"</c:if>>愛知県</option>
				  <!-- 미에현 -->
				  <option value='三重県'<c:if test="${agency.addressMain == '三重県'}"> selected="selected"</c:if>>三重県</option>
				  <!-- 시가현 -->
				  <option value='滋賀県'<c:if test="${agency.addressMain == '滋賀県'}"> selected="selected"</c:if>>滋賀県</option>
				  <!-- 교토부 -->
				  <option value='京都府'<c:if test="${agency.addressMain == '京都府'}"> selected="selected"</c:if>>京都府</option>
				  <!-- 오사카부 -->
				  <option value='大阪府'<c:if test="${agency.addressMain == '大阪府'}"> selected="selected"</c:if>>大阪府</option>
				  <!-- 효고현 -->
				  <option value='兵庫県'<c:if test="${agency.addressMain == '兵庫県'}"> selected="selected"</c:if>>兵庫県</option>
				  <!-- 나라현 -->
				  <option value='奈良県'<c:if test="${agency.addressMain == '奈良県'}"> selected="selected"</c:if>>奈良県</option>
				  <!-- 와카야마현 -->
				  <option value='和歌山県'<c:if test="${agency.addressMain == '和歌山県'}"> selected="selected"</c:if>>和歌山県</option>
				  <!-- 돗토리현 -->
				  <option value='鳥取県'<c:if test="${agency.addressMain == '鳥取県'}"> selected="selected"</c:if>>鳥取県</option>
				  <!-- 시마네현 -->
				  <option value='島根県'<c:if test="${agency.addressMain == '島根県'}"> selected="selected"</c:if>>島根県</option>
				  <!-- 오카야마현 -->
				  <option value='岡山県'<c:if test="${agency.addressMain == '岡山県'}"> selected="selected"</c:if>>岡山県</option>
				  <!-- 히로시마현 -->
				  <option value='広島県'<c:if test="${agency.addressMain == '広島県'}"> selected="selected"</c:if>>広島県</option>
				  <!-- 야마구치현 -->
				  <option value='山口県'<c:if test="${agency.addressMain == '山口県'}"> selected="selected"</c:if>>山口県</option>
				  <!-- 도쿠시마현 -->
				  <option value='徳島県'<c:if test="${agency.addressMain == '徳島県'}"> selected="selected"</c:if>>徳島県</option>
				  <!-- 가가와현 -->
				  <option value='香川県'<c:if test="${agency.addressMain == '香川県'}"> selected="selected"</c:if>>香川県</option>
				  <!-- 에히메현 -->
				  <option value='愛媛県'<c:if test="${agency.addressMain == '愛媛県'}"> selected="selected"</c:if>>愛媛県</option>
				  <!-- 고치현 -->
				  <option value='高知県'<c:if test="${agency.addressMain == '高知県'}"> selected="selected"</c:if>>高知県</option>
				  <!-- 후쿠오카현 -->
				  <option value='福岡県'<c:if test="${agency.addressMain == '福岡県'}"> selected="selected"</c:if>>福岡県</option>
				  <!-- 사가현 -->
				  <option value='佐賀県'<c:if test="${agency.addressMain == '佐賀県'}"> selected="selected"</c:if>>佐賀県</option>
				  <!-- 나가사키현 -->
				  <option value='長崎県'<c:if test="${agency.addressMain == '長崎県'}"> selected="selected"</c:if>>長崎県</option>
				  <!-- 구마모토현 -->
				  <option value='熊本県'<c:if test="${agency.addressMain == '熊本県'}"> selected="selected"</c:if>>熊本県</option>
				  <!-- 오이타현 -->
				  <option value='大分県'<c:if test="${agency.addressMain == '大分県'}"> selected="selected"</c:if>>大分県</option>
				  <!-- 미야자키현 -->
				  <option value='宮崎県'<c:if test="${agency.addressMain == '宮崎県'}"> selected="selected"</c:if>>宮崎県</option>
				  <!-- 가고시마현 -->
				  <option value='鹿児島県'<c:if test="${agency.addressMain == '鹿児島県'}"> selected="selected"</c:if>>鹿児島県</option>
				  <!-- 오키나와 -->
				  <option value='沖縄県'<c:if test="${agency.addressMain == '沖縄県'}"> selected="selected"</c:if>>沖縄県</option>
				</select>
            </div>
            
             <div class="form-group">
              <label for="InputText">Address middle</label>
              <input type="text" class="form-control" id="agencyaddressmiddle" placeholder="주소(市区町村名)를 입력해 주세요" name="addressMiddle" value="${agency.addressMiddle}">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address small</label>
              <input type="text" class="form-control" id="agencyaddresssmail" placeholder="주소(地区名)를입력해 주세요"  name="addressSmall" value="${agency.addressSmall}">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address sub</label>
              <input type="text" class="form-control" id="agencyaddresssub" placeholder="주소(詳細)를 입력해 주세요"  name="addressSub" value="${agency.addressSub}">
            </div>
            
			<div class="input-group">
			     <label for="InputText">Agency Introduce</label>
			    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="중개소 소개를 입력해 주세요"  name="agencytext">${agency.text}</textarea>       
			</div>
         
 			<br>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning">회원정보 수정 취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
            
          </form>
        </div>
</article>
 
 



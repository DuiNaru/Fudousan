<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공인중개사 입력</title>

    <!-- 부트스트랩 -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	
	
	 <!-- font awesome -->
    
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    
    <!-- Custom style -->
    <link rel="stylesheet" href="../resources/css/style.css" media="screen" title="no title" charset="utf-8">
	
	
	
	<!-- style -->
	<style type="text/css">
	  /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 91%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
     
       
      }
   
	</style>
  </head>
  <body>
  
  <!-- 로그인 모달 시작 -->
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
				</div>
				
				<div class="modal-body">
					Email <input type="text" id="memberEmail" name="memberID">
					Password <input type="password" id="password" name="password">
					<button type="button" id="loginBtn">Login</button>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
   <!-- Header -->
		 <nav class="navbar navbar-default" style="margin: auto 0"> 
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="../fudousan" style="margin-bottom: 10px;">
		      	<img alt="Fudousan" src="resources/image/logo2.png">
		      </a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		     
		    
		      <ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
		       <c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal">Login</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Join <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="join/join">Customer Join</a></li>
							<li class="divider"></li>
							<li><a href="join/agencyjoin">Agency Join</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${sessionScope.loginEmail != null}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/bw">Logout</a></li>
				</c:if>
		    
		        
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		 </nav> 
   
 
 <!--  join form  -->
 
 <article class="container">
        <div class="page-header">
          <h1> 物件登録<small>매물등록</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form">
            <div class="form-group">
              <label for="inputType">取引タイプ(거래종류)</label>
              <!-- <input type="text" class="form-control" id="InputName" placeholder="이름"> -->
            <select name='거래종류' class="form-control">
  			<option value='' selected>-- 選択 --</option>
  			<option value='1'>アパート</option>
  			<option value='2'>マンション</option>
			</select>
            </div>
            <div class="form-group">
              <label for="inputRegion">지역이름(地域名)</label>
             <select name='지역이름' class="form-control">
  <option value='' selected>-- 選択 --</option>
  <!-- 홋카이도 -->
  <option value='01'>北海道</option>
  <!-- 아오모리현 -->
  <option value='02'>青森県</option>
  <!-- 이와테현 -->
  <option value='03'>岩手県</option>
  <!-- 미야기현 -->
  <option value='04'>宮城県</option>
  <!-- 아키타현 -->
  <option value='05'>秋田県</option>
   <!-- 야가마타현 -->
  <option value='06'>山形県</option>
  <!-- 후쿠시마현-->
  <option value='07'>福島県</option>
  <!-- 이바라키현 -->
  <option value='08'>茨城県</option>
  <!-- 토치 기현 -->
  <option value='09'>栃木県</option>
  <!-- 군마현 -->
  <option value='10'>群馬県</option>
  <!-- 사이타마 현 -->
  <option value='11'>埼玉県</option>
  <!-- 치바현 -->
  <option value='12'>千葉県</option>
 <!--  도쿄도 -->
  <option value='13'>東京都</option>
  <!-- 가나가와 현 -->
  <option value='14'>神奈川県</option>
  <!-- 니가타 현 -->
  <option value='15'>新潟県</option>
  <!-- 도야마 현 -->
  <option value='16'>新潟県</option>
  <!-- 이시카와 현 -->
  <option value='17'>石川県</option>
  <!-- 후쿠이 현 -->
  <option value='18'>福井県</option>
  <!-- 야마나시 현 -->
  <option value='19'>山梨県</option>
  <!-- 나가노 현 -->
  <option value='20'>長野県</option>
  <!-- 기후현 -->
  <option value='21'>岐阜県</option>
  <!-- 스지오카현 -->
  <option value='22'>静岡県</option>
  <!-- 아이치현 -->
  <option value='23'>愛知県</option>
  <!-- 미에현 -->
  <option value='24'>三重県</option>
  <!-- 시가현 -->
  <option value='25'>滋賀県</option>
  <!-- 교토부 -->
  <option value='26'>京都府</option>
  <!-- 오사카부 -->
  <option value='27'>大阪府</option>
  <!-- 효고현 -->
  <option value='28'>兵庫県</option>
  <!-- 나라현 -->
  <option value='29'>奈良県</option>
  <!-- 와카야마현 -->
  <option value='30'>和歌山県</option>
  <!-- 돗토리현 -->
  <option value='31'>鳥取県</option>
  <!-- 시마네현 -->
  <option value='32'>島根県</option>
  <!-- 오카야마현 -->
  <option value='33'>岡山県</option>
  <!-- 히로시마현 -->
  <option value='34'>広島県</option>
  <!-- 야마구치현 -->
  <option value='35'>山口県</option>
  <!-- 도쿠시마현 -->
  <option value='36'>徳島県</option>
  <!-- 가가와현 -->
  <option value='37'>香川県</option>
  <!-- 에히메현 -->
  <option value='38'>愛媛県</option>
  <!-- 고치현 -->
  <option value='39'>高知県</option>
  <!-- 후쿠오카현 -->
  <option value='40'>福岡県</option>
  <!-- 사가현 -->
  <option value='41'>佐賀県</option>
  <!-- 나가사키현 -->
  <option value='42'>長崎県</option>
  <!-- 구마모토현 -->
  <option value='43'>熊本県</option>
  <!-- 오이타현 -->
  <option value='44'>大分県</option>
  <!-- 미야자키현 -->
  <option value='45'>宮崎県</option>
  <!-- 가고시마현 -->
  <option value='46'>鹿児島県</option>
  <!-- 오키나와 -->
  <option value='47'>沖縄県</option>
</select>
             
            </div>
            <div class="form-group">
              <label for="inputPrefecture">都道府県</label>
              <input type="text" class="form-control" id="inputPrefecture" placeholder=" 도시 이름 (도도부현)">
           
            </div>
            <div class="form-group">
              <label for="inputMunicipality">市区町村</label>
              <input type="text" class="form-control" id="inputMunicipality" placeholder="도시 이름 (시구정촌)">
            </div>
            <div class="form-group">
              <label for="inputDistrictName">地球人</label>
              <input type="text" class="form-control" id="inputDistrictName" placeholder="지역 이름  (지구 명)">
            </div>
            
            <div class="form-group">
              <label for="inputNearestStation"> 最寄駅</label>
              <input type="text" class="form-control" id="inputNearestStation" placeholder="전제일 가까운 역 : 명칭 ">
            </div>
         
		<div class="form-group">
              <label for="inputTimeToNearestStation"> 最寄駅の距離（分）</label>
              <input type="text" class="form-control" id="inputTimeToNearestStation" placeholder="제일 가까운역 거리(분)">
            </div>
            
            <div class="form-group">
              <label for="inputTradePrice"> 取引価格（総額）</label>
              <input type="text" class="form-control" id="inputTradePrice" placeholder="거래 가격(총액)">
            </div>
            
            <div class="form-group">
              <label for="inputPricePerUnit"> 坪単価</label>
              <input type="text" class="form-control" id="inputPricePerUnit" placeholder="평단가">
            </div>
              <!-- -- -->
            <div class="form-group">
              <label for="inputFloorPlan"> 構造</label>
              <input type="text" class="form-control" id="inputFloorPlan" placeholder="구조 ">
            </div>
            
            <div class="form-group">
              <label for="inputArea"> 面積（平方メートル</label>
              <input type="text" class="form-control" id="inputArea" placeholder="면적(평방 미터)">
            </div>
            
            <div class="form-group">
              <label for="inputUnitPrice"> 取引価格（平方メートル単価）</label>
              <input type="text" class="form-control" id="inputUnitPrice" placeholder="거래 가격(평방 미터 단가 )">
            </div>
            
            <div class="form-group">
              <label for="inputLandShape">土地の形状 </label>
              <input type="text" class="form-control" id="inputLandShape" placeholder="토지의 형상">
            </div>
            
           <div class="form-group">
              <label for="inputTotalFloorArea">延べ面積（㎡） </label>
              <input type="text" class="form-control" id="inputTotalFloorArea" placeholder="연면적 (㎡) ">
            </div>
            
            <div class="form-group">
              <label for="inputBuildingYear">設した年 </label>
              <input type="text" class="form-control" id="inputBuildingYear" placeholder="건축 년도 ">
            </div>
            
            <div class="form-group">
              <label for="inputStructure">建物の構造 </label>
              <input type="text" class="form-control" id="inputStructure" placeholder="건물의 구조 ">
            </div>
            
            <div class="form-group">
              <label for="inputUse">用途</label>
              <input type="text" class="form-control" id="inputUse" placeholder="용도">
            </div>
        
        <div class="form-group">
              <label for="inputCoverageRatio">建ぺい率（％）</label>
              <input type="text" class="form-control" id="inputCoverageRatio" placeholder="건폐율 (%)">
            </div>
            
            <div class="form-group">
              <label for="inputFloorAreaRatio">容積率（％）</label>
              <input type="text" class="form-control" id="inputFloorAreaRatio" placeholder="용적률 (%)">
            </div>
        

           
            
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">登録完了<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning" onclick="delUrl">初期化<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
</article>
 
 





 
 
 
 
 
 
 
 
 <!-- script -->

    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlZMVBrvQGWP2QTDvf5ur7HrtEC3xlOf0 &callback=initMap">
    </script>
   

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
    
    
<script type="text/javascript">
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});
</script>






    
    
  </body>
</html>

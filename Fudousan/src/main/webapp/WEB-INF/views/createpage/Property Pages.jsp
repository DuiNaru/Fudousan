<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


 <!-- 헤더 영역 -->
 
 
 <form action="">
<!-- 거래종류 입력 -->
<select name='거래종류입력' size='7'>
  <option value='' selected>-- 選択 --</option>
  <option value='1'>アパート</option>
  <option value='2'>マンション</option>
</select>


<!-- 지역 이름 입력 -->	
<select name='지역이름' size='7'>
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
  <option value='09'>栃木県</option>
  <option value='10'>群馬県</option>
  <option value='11'>埼玉県</option>
  <option value='12'>千葉県</option>
  <option value='13'>東京都</option>
  <option value='14'>神奈川県</option>
  <option value='15'>新潟県</option>
  <option value='16'>新潟県</option>
  <option value='17'>石川県</option>
  <option value='18'>福井県</option>
  <option value='19'>山梨県</option>
  <option value='20'>長野県</option>
  <option value='21'>岐阜県</option>
  <option value='22'>静岡県</option>
  <option value='23'>愛知県</option>
  <option value='24'>三重県</option>
  <option value='25'>滋賀県</option>
  <option value='26'>京都府</option>
  <option value='27'>大阪府</option>
  <option value='28'>兵庫県</option>
  <option value='29'>奈良県</option>
  <option value='30'>和歌山県</option>
  <option value='31'>鳥取県</option>
  <option value='32'>島根県</option>
  <option value='33'>岡山県</option>
  <option value='34'>広島県</option>
  <option value='35'>広島県</option>
  <option value='36'>徳島県</option>
  <option value='37'>香川県</option>
  <option value='38'>愛媛県</option>
  <option value='39'>高知県</option>
  <option value='40'>福岡県</option>
  <option value='41'>佐賀県</option>
  <option value='42'>長崎県</option>
  <option value='43'>熊本県</option>
  <option value='44'>大分県</option>
  <option value='45'>宮崎県</option>
  <option value='46'>鹿児島県</option>
  <option value='47'>鹿児島県</option>
</select>

 <!-- 도시 이름 입력(도도부현) -->
都道府県<input type="text">
<!--  도시  이름 입력(시구정촌) -->
 市区町村<input type="text">
 <!-- 지역 이름 입력(지구 명) -->
 地球人<input type="text">
 <!-- 제일 가까운 역 : 명칭 입력 -->
 最寄駅<input type="text">
 <!-- 제일 가까운역 거리(분) -->
 最寄駅の距離（分）<input type="text">
<!-- 거래 가격(총액) -->
取引価格（総額） <input type="text">
<!--  평 단가 -->
 坪単価<input type="text">
 <!-- 구조 -->
 構造<input type="text">
<!--  면적(평방 미터) -->
面積（平方メートル） <input type="text">
 <!-- 거래 가격(평방 미터 단가 ) -->
 取引価格（平方メートル単価）<input type="text">
<!--  토지의 형상 -->
 土地の形状<input type="text">
<!--  폭 -->
幅<input type="text">
<!-- 연면적 (㎡) -->
延べ面積（㎡）<input type="text">
<!-- 건축 년도 -->
建設した年<input type="text">
<!-- 건물의 구조 -->
建物の構造<input type="text">
<!-- 용도 입력 -->
用途入力<input type="text">
<!-- 향후 이용 목적 -->
今後の利用目的<input type="text">
<!-- 전면 도로 : 방위 -->
前面道路：方位<input type="text">
<!-- 전면 도로 : 종류 -->
前面道路：種類<input type="text">
<!-- 전면 도로 : 폭(m) -->
前面道路：幅員（ｍ）<input type="text">
<!-- 도시 계획 -->
都市計画<input type="text">
<!-- 건폐율 (%) -->
建ぺい率（％）<input type="text">
<!-- 용적률 (%) -->
容積率（％）<input type="text">
<!-- 거래 상황 -->
取引の事情等<input type="text">

<input type="submit" value="등록">
<input type="reset" value="초기화">
</form>


</body>
</html>
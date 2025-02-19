<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%
     model.foodDetailData(request);
%>
<%--
     Cookie => 301page 
     HTTP 프로토콜은 새로운 페이지가 실행되면 지존의 입력된 모든 정보가 사라진다
     ----------- 로그인 => 새로운 페이지로 이동 (로그인 정보는 사라진다)
     ----------- 지속성(유지성)이 없다 
                 -----------------정보가 계속 유지할 수 있게 
                                  만든 라이브러리 : Session/Cookie
                                                --------------
                                                | 장바구니 , 예약정보
       => 상태의 지속성 (Cookie / Session)
          --- 데이터의 변경 상황 
          React / Vue => state관리 프로그램 (데이터 상태프로그램) 
       => 데이터를 유지하기 위한 메모리 저장 공간 
          브라우저 (클라이언트)
       => 사용법 
          1. 저장 
             new Cookie(키 , 값)
                       (String key,String value)
                       =>  Map방식으로 사용한다 
                       =>  key를 중복할 수 없다 (중복된 키는 저장이 안된다)
             ## response 
                => 한개 JSP에서 한가지 일만 수행 
                   -------    -------
                               HTML 전송   => 2
                               Cookie 전송 => 1
                               => 여러번 전송이 가능 
               
          2. 읽기 : Cookie[] cookies=request.getCookies()
                   @CookieValue => Spring (로드존슨)
                       | Annotation 
          3. 삭제 :
                    setMaxAge(0)
          4. 저장기간 지정
                    setMaxAge(초단위)  = 60*60*24 => default:30분
          5. 저장된 데이터 읽기
             => 키 읽기 => getName()
             => 값 읽기 => getValue()
          6. 저장 경로 설정 
              setPath("/")
          7. 저장할 수 있는 데이터 : String만 가능
          8. port가 다르면 서버에서 Cookie를 다를 수 없다 
          
             React     Spring-Boot 
                       | => 80port / 8080port
               |       | => 포트 허용 
            3000port
            => 자바스크립트 쿠키를 이용한다
               -------------
                react-cookie 
          9. 자동 로그인 => 스프링 (remember-me)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72fa81817487692b6dc093004af97650&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: opx auto;
  width: 960px;
}
</style>
</head>
<body>
 <div class="container">
  <div class="row">
    <table class="table">
      <tr>
        <td width=30% class="text-center" rowspan="8">
         <img src="http://www.menupan.com${vo.getPoster() }" style="width: 300px;height: 350px">
        </td>
        <td colspan="2">
          <h3><${vo.getName()}&nbsp;<span style="color:orange;">${vo.getScore()}</span></h3>
        </td>
      </tr>
        
      <tr>
        <th width=20% style="color:gray">음식종류</th>
        <td width=50%>${vo.getType()}</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">주소</th>
        <td width=50%>${vo.getAddress() }</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">전화</th>
        <td width=50%>${vo.getPhone() }</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">가격대</th>
        <td width=50%>${vo.getPrice() }</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">영업시간</th>
        <td width=50%>${vo.getTime() }</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">주차</th>
        <td width=50%>${vo.getParking() }</td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">테마</th>
        <td width=50%>${vo.getTheme() }</td>
      </tr>
    </table>
    <table class="table">
     <tr>
      <td>${vo.getContent()}</td>
     </tr>
     <tr>
      <td class="text-right">
        <a href="list.jsp" class="btn btn-xs btn-success">목록</a>
      </td>
     </tr>
    </table>
  </div>
  <div style="height: 10px"></div>
  <div class="row">
   <div id="map" style="width:100%;height:350px;"></div>
  </div>
 <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${vo.getAddress()}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.getName()}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>
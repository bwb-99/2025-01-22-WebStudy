<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"%>
<%--
      브라우저 내장객체
      ------------
               window (브라우저 외부관리) => 메뉴바 , 상태바..
                 | => open /close : 팝업 => shadowbox, whitebox
       ------------------------------
       |	    |          |       |
    document   location   screen   history
    --------   --------   ------   -------
    								 |사이트 이동 => 정보
    						|위치, 화면 크기
      |   		  | 화면이동 => href
     body / form..(태그관리)
     
     => write / querySelector()
   내장 객체
   ------- String / Number / Date / Array
   		   ------------------------------ Java
   => Jquery 기초 : AJAX
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: opx auto;
  width: 500px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
 <div class="container">
  <div class="row"> <%-- 우편번호 검색 가운데 --%>
   <h3 class="text-center">우편번호 검색</h3>
   <div class="row">
    <table class="table">
     <tr>
      <td>
       <input type=text namer=dong class="input-sm" placeholder="동/읍/면 입력">
       <input type=button class="btn btn-sm btn-danger" value="검색">
      </td>
     </tr>
    </table>
    <c:forEach test="${count!=0 }">
    <talbe class="table user-table">
    <thead>
      <tr>
        <th width= 15% class="text-center">우편번호</th>
        <th width= 80% class="text-center">주소</th>
      </tr>
      </thead>
      <tbody>
       <c:forEach var="vo" items="${list }">
      
       </c:forEach>
      </tbody>
    </talbe>
   </div>
 </div>
</body>
</html>
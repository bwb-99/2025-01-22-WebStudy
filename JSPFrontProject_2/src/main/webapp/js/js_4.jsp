<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/"></script>
<script type="text/javascript"></script>
$(function(){ //window.onload
		$('#btn').click(funtion(){
			let kor=$('#kor').val();
			let eng=$('#eng').val();
			let math=$('#math').val();
			
			let total=Number(kor)+Number(eng)+Number(math)
			$('#total').val(total)
		})
})
</script>
</head>
<body>
  국어:<input tpye=text id=kor size=20><br>
  영어:<input tpye=text id=eng size=20><br>
  수학:<input tpye=text id=math size=20><br>
  <input type=botton id=btn value="계산">
  <input type=text id=total size=20>
</body>
</html>
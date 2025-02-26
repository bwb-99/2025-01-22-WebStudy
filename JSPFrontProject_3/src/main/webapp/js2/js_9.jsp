<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function()
{
	dispaly()
}
// 함수 오버라이딩
function dispaly()
{
	alert("function display Call...")
}
function display(){
	alert("let display=() Call")
}
fuction display()
{
	alert("let display=function() Call")	
}
</script>
</head>
<body>

</body>
</html>
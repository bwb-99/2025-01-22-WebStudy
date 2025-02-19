<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  width: 700px;
}
</style>
</head>
<body>
	<div class="container">
	  <div class="row">
	<h3 class="text-center">MVC를 이용한 게시판</h3>
    <table class="table">
	<tr>
	 <td><a href="insert.do" class="btn btn-sm btn-primars"></td>
	 </tr>
	</table>
	 <table class="table">
	  <tr>
	    <td width=10% class="text-center">${vo.no }</td>
	    <td width=20% class="text-center">${vo.no }</td>
	    <td width=15% class="text-center">${vo.name }</td>
	    <td width=20% class="text-center">${vo.regdate }</td>
	    <td width=10% class="text-center">${vo.hit }</td>
	  </tr>
</body>
</html>
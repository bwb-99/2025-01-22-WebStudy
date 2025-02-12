<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String jsp="home.jsp";
	
	//jsp="header.jsp";
	RequestDispatcher rd=request.getRequestDispatcher("home.jpg")
    rd.include(requset, response);
%>
<!DOCTYPE html>
<html>
<head>
<title>Gravity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<%-- HEADER --%>
<%--
<%
	pageContext.include("header.jsp");
%>
--%>
<%-- <jsp:include page="header.jsp"></jsp:include> --%> <%-- 동적 --%>
<%@ include file="header.jsp" %> <%-- 정적 --%>
<%--
<%
	pageContext.include("home.jsp");
%>
--%>
<%-- <jsp:include page="home.jsp"></jsp:include> --%> <%-- 동적 --%>
<jsp:include page="<%=jsp %>"></jsp:include><%-- 돟적 위 변수 수정시 변경 가능 --%>
<%--
<%
	pageContext.include("footer.jsp");
%>
--%>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%> <%-- 동적 --%>
<%@ include file="footer.jsp" %> <%-- 정적 --%>

<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<!-- JAVASCRIPTS --> 
<script src="../layout/scripts/jquery.min.js"></script> 
<script src="../layout/scripts/jquery.backtotop.js"></script> 
<script src="../layout/scripts/jquery.mobilemenu.js"></script> 
<script src="../layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>
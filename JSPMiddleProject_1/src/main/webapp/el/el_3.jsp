<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
		// => 자바파일에서 전송
		List<String> names=new ArrayList<String>();
		names.add("홍길동");
		names.add("박문수");
		names.add("심청이");
		names.add("이순신");
		names.add("강감찬");
		names.add("을지문덕");
		
		//${} => request/session에 저장
		request.setAttribute("list",names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>일반 자바 for-each</h1>
  <ul>
  <%
     int i;
     for(String name:names)
     {
  %>
      <li><%=i+1%>.<%=name %></li>
  <%
  		i++;
     }
  %>
  </ul>
  <h3>&lt;c:forEach&gt; 구문</h3>
  <ul>
    <c:Each var="name" items="${list }" varStatus="s">
      <li>${s.index+1}.${name}</li>
    </c:Each>
  </ul>
</body>
</html>
<%@ page contentType = "text/html; charset=EUC-KR" %>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page isErrorPage = "true" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
error 타입: 
<%= exception.getClass().getName() %>

<br>
error 내용: 
<%= exception.getMessage() %>

</body>
</html>   
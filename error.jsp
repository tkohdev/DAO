<%@ page contentType = "text/html; charset=EUC-KR" %>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page isErrorPage = "true" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
error Ÿ��: 
<%= exception.getClass().getName() %>

<br>
error ����: 
<%= exception.getMessage() %>

</body>
</html>   
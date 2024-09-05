<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="com.uto.login.*"%>  
<%@ page import="com.uto.pool.*"%>
<%@ page import="java.sql.*"%>  
<%
	int check = 0;
	String agency       = (String)session.getAttribute("agency");
	String agent_id     = (String)session.getAttribute("agent_id");
	String cust_num     = (String)session.getAttribute("cust_num");
	String ip 			= request.getRemoteAddr().trim();
	String go_chk = "Y";  //���
	
	Connection pconn = null;
	 
	try
	{
		pconn = DsCon.getConnection();
		
		//�α׾ƿ� ������ DB�� INSERT
		LoginManagerBiz log = new LoginManagerBiz();
		check = log.Set_Login_out(pconn, agency, agent_id, cust_num, "O", "1", ip);
		if(check == 0) throw new Exception("logout ����");
		
		session.invalidate();
//		session.removeAttribute(agent_id);

	}
	catch(Exception e)
	{
		System.out.println(e + "_logout.jsp");
		
	}
	finally
	{
		if (pconn!=null) pconn.close();
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function init(){
		var frm = document.myform;
		var go_chk = "<%=go_chk%>";
	
		if(go_chk == "Y"){

			window.opener.location.replace('/HCINFO/intranet.jsp?YOU=YOU');
            window.open("about:blank","_self").close();

		}else{
			
			alert("�α׾ƿ��� �����Ͽ����ϴ�.\n�����ڿ��� ������ �ּ���.");

            window.opener.location.reload();
            window.open("about:blank","_self").close();
            
		}
	}
</script>
</head>
<body onload="init();">
<form name="myform" method="post">
<input type="hidden" name="LOAD" value="Y">
</form>
</body>
</html>
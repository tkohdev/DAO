<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="com.uto.login.*"%>  
<%@ page import="com.uto.pool.*"%>
<%@ page import="com.uto.util.StringUtil"%>
<%@ page import="java.sql.*"%>  
<%
    int check = 0;
	String agency       = (String)session.getAttribute("agency");
	String agent_id     = StringUtil.nchk(request.getParameter("agent_id"));
	String cust_num 	= StringUtil.nchk(request.getParameter("cust_num"));
	String ip 			= request.getRemoteAddr().trim();
	String addr 		= StringUtil.nchk((String)session.getAttribute("macAddr"));
	
	Connection pconn = null;
	 
	try
	{
		pconn = DsCon.getConnection();
		
		LoginManagerBiz log = new LoginManagerBiz();
		
		if(!agent_id.equals("") && !agent_id.equals(null))
		{			
			System.out.println(agent_id);
			//�α׾ƿ� ������ DB�� INSERT
			check = log.Set_Login_out(pconn, agency, agent_id, cust_num, "O", "1", ip);
			if(check == 0) throw new Exception("logout ����");
		}
		
		//�α׾ƿ�ó��
		log.removeSession(agent_id);
		//session.invalidate();
		
		out.println("<script>");
		out.println("top.location.href= '/HCINFO/intranet.jsp?YOU=YOU';");
	    out.println("</script>");
	}
	catch(Exception e)
	{
		System.out.println(e + "_logout.jsp");
		
		out.println("<script>");
	    out.println("alert('�α׾ƿ��� �����Ͽ����ϴ�.�����ڿ��� �������ּ���');");
	    out.println("</script>");
	}
	finally
	{
		if (pconn!=null) pconn.close();
	}
%>

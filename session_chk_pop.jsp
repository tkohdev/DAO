<%@ page contentType="text/html; charset=euc-kr"%>
<%
   	if (session.getAttribute("agent_id") == null || session.getAttribute("agent_id") == "" ) 
   	{
   		out.println("<script>window.dialogArguments.myform.action= '/HCINFO/session_chk.jsp?YOU=YOU';</script>");
   		out.println("<script>window.dialogArguments.myform.submit();</script>");      	
		out.println("<script>window.close();</script>");

      	return;
   }
%>

<%@ page contentType="text/html; charset=euc-kr"%>
<%
   if (session.getAttribute("agent_id") == null || session.getAttribute("agent_id") == "" ) {
      out.println("<script>");
      out.println("alert('������ ���� �Ǿ����ϴ�. �ٽ� �α��� �Ͽ� �ּ���');");
      out.println("top.location.href=('/HCINFO/intranet.jsp?YOU=YOU');");
      out.println("</script>");
      return;
   }
%>

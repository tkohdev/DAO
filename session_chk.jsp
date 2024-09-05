<%@ page contentType="text/html; charset=euc-kr"%>
<%
   if (session.getAttribute("agent_id") == null || session.getAttribute("agent_id") == "" ) {
      out.println("<script>");
      out.println("alert('세션이 종료 되었습니다. 다시 로그인 하여 주세요');");
      out.println("top.location.href=('/HCINFO/intranet.jsp?YOU=YOU');");
      out.println("</script>");
      return;
   }
%>

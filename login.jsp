<%@page import="com.uto.pool.Testmaria"%>
<%@ page contentType="text/html; charset=euc-kr" errorPage="error.jsp" %>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="com.uto.util.*"%>  
<%@ page import="com.uto.login.*"%>
<html>
<head>
<script language="javascript" src="/HCINFO/js/common.js"></script>   
<%		
	String id			= StringUtil.nchk(request.getParameter("agent_id"));
	String pass 		= StringUtil.nchk(request.getParameter("pass"));
	String agency 		= StringUtil.nchk(request.getParameter("agency"));
	String cust_num 	= StringUtil.nchk(request.getParameter("cust_num"));
	String ip 			= request.getRemoteAddr().trim();

	//---�α��� Ƚ�� üũ�� ���� ��Ű 
	String value = request.getHeader("Cookie");
	int i_vis	=	0;	//����Ƚ��	
    if(value == null)
    {
    	Cookie cookie = new Cookie (id, "0");
    	cookie.setMaxAge(365 * 24 * 60 * 60);
        response.addCookie(cookie);
    }
    else
    {
    	Cookie[] get_visitor = request.getCookies();
    	String str_vis="0";

    	for(int i = 0; i < get_visitor.length; i++ ) 
    	{
			if (get_visitor[i].getName().equals(id) == true)
			{
    	  		str_vis = get_visitor[i].getValue();
    	    }
			else
			{
				Cookie cookie = new Cookie (id, "0");
		    	cookie.setMaxAge(365 * 24 * 60 * 60);
		        response.addCookie(cookie);
			}
    	}
    	i_vis = Integer.parseInt(str_vis);
    }
	
	String m_type = StringUtil.nchk(request.getParameter("m_type"));	//������ ����� ������ �α��� �����׽�Ʈ

	String lock_chk = "";
	LoginManagerBiz login = LoginManagerBiz.getInstance();
	HashMap map = login.check_Member(agency.trim(), cust_num.trim(), id.trim(), pass.trim(), i_vis+"" , ip);

    String result 		= map.get("return")+"";
    String lock_cnt 	= map.get("lock_cnt")+"";

    String DB_pass 		= ""; 
    
    if(result.equals("LOCK"))
    {
    	out.println("<script>alert('�н����带 3ȸ�̻� Ʋ�������Ƿ� �α��� �Ͻ� �� �����ϴ�.�����ڿ��� �����ϼ���');</script>");
    	lock_chk = "y";
    }
    else if(result.equals("OK"))			//�������� �α���
    {    	
    	login.setSession(session, id);
    	
    	session.setAttribute("agent_id",	id);
    	session.setAttribute("agent_nm", 	map.get("agent_nm").toString());
    	session.setAttribute("agency", 		map.get("agency").toString());
    	session.setAttribute("head_cd",		map.get("head_cd").toString());
    	session.setAttribute("head",		map.get("head").toString());
    	session.setAttribute("branch_cd",	map.get("branch_cd").toString());
    	session.setAttribute("branch",		map.get("branch").toString());
    	session.setAttribute("shop_cd",		map.get("shop_cd").toString());
    	session.setAttribute("shop",		map.get("shop").toString());
    	session.setAttribute("login_dt", 	map.get("login_dt").toString());
    	session.setAttribute("staff_div", 	map.get("staff_div").toString());
    	session.setAttribute("org_div", 	map.get("org_div").toString());  		//����: 1  �ܾ� :2
        session.setAttribute("position", 	map.get("position").toString());
        session.setAttribute("rank", 		map.get("rank").toString());			//������ ����
        session.setAttribute("team", 		map.get("team").toString());
        session.setAttribute("depart", 		map.get("depart").toString());
        session.setAttribute("s_position", 	map.get("s_position").toString());
        session.setAttribute("gender", 		map.get("gender").toString());
        session.setAttribute("cust_num", 		map.get("cust_num").toString());
        	
        String org 		= map.get("org_div").toString();
		String rank		= map.get("rank").toString();	

// �����ҽ�	
//---���� ��� ���� ���Ƿ� ���� �ο� ���߿� ���� ���
// 		if(org.equals("1")) session.setAttribute("level", "9");			//��������
// 		else if(rank.equals("300")) session.setAttribute("level", "8");	//������
// 		else if(rank.equals("310")) session.setAttribute("level", "8");	//��������
// 		else if(rank.equals("400")) session.setAttribute("level", "7");	//������
// 		else if(rank.equals("410")) session.setAttribute("level", "7");	//��������
// 		else if(rank.equals("500")) session.setAttribute("level", "6");	//������
// 		else if(rank.equals("510")) session.setAttribute("level", "6");	//��������
// 		else session.setAttribute("level", "5");							//�����
//-------�������    	
 
//---���� ��� ���� ���Ƿ� ���� �ο�-DAO(2020.01.02)
 		if(org.equals("1")){
 	 		if(rank.equals("100")) session.setAttribute("level", "8");	    //��ǥ�̻�
 	 		else if(rank.equals("130")) session.setAttribute("level", "7");	//������
 	 		else if(rank.equals("140")) session.setAttribute("level", "6");	//����
 	 		else session.setAttribute("level", "5");						//��������
 		}else{                                          //���� ����͸� ����
 	 		session.setAttribute("level", "5");						//�Ϲ�����
 			
 		}

//������ ���� �߰�
 		if(id.equals("111111"))  session.setAttribute("level", "9");	    //�ְ���� ������(�ٿ�����)
//-------�������  
    	
    	DB_pass 	= map.get("DB_pass")+"";

    	if(DB_pass.equals(id))
    	{
    		out.println("<script>alert('���� ����ϰ� ��� �н������ <�ӽ� �н�������> �ϴ�. �н����带 ������ �ּ���');</script>");
    		out.println("<script>pop_up('/HCINFO/jsp/COM/PWCHG_INPUT.jsp','550', '250', 'D', 'no');</script>");
    	}
    	
// �����ҽ�(���߿� ��� ������)    	
//    	if(m_type.equals(""))
//    	{
//    		out.println("<script>location.href('/HCINFO/jsp/first3.jsp');</script>");
//    	}
//   	else
//    	{
//    		if(id.equals("6111698") || id.equals("6115797") || id.equals("6111111"))
//    		{
//    			response.sendRedirect("/HCINFO/jsp/M/M_MENU.jsp");
//    		}
//    		else
//    		{
//    			out.println("<script>location.href('/HCINFO/jsp/first3.jsp');</script>");
//    		}
//    	}
    	
    	if(id.equals("111111"))
    	{
    		out.println("<script>location.href = '/HCINFO/jsp/BIZ_RS/RS/RSRS_TOTAL_SHARE_MAIN.jsp';</script>");
    	}
    	else
    	{
    			out.println("<script>location.href = '/HCINFO/jsp/first3.jsp';</script>");
    	}
    	
    	Cookie cookie = new Cookie (id, "0");	//��Ű �ʱ�ȭ
    	cookie.setMaxAge(365 * 24 * 60 * 60);
        response.addCookie(cookie);
    }
    else if(result.equals("OVER"))	// �н����� ����
    {
    	out.println("<script>alert('�н����� ���� �Ⱓ�� �������ϴ�. �н����带 ���� ������ �ּ���.');</script>");   	    	    	
    	out.println("<script>pop_up('/DAO/jsp/COM/PWCHG_INPUT.jsp','550', '250', 'D', 'no');</script>");   	
    	out.println("<script>history.back();</script>");
    }
    else if(result.equals("ERROR"))	// �н����带 1,2��  Ʋ��
    {    	
    	out.println("<script>alert('�н����尡 "+ lock_cnt +" ȸ Ʋ�Ƚ��ϴ�.');</script>");
    	lock_chk = "w";
    	
    	Cookie cookie = new Cookie (id, lock_cnt);
    	cookie.setMaxAge(365 * 24 * 60 * 60);
        response.addCookie(cookie);
    }
    else if(result.equals("WRONG"))	// �н����带 3�� Ʋ��
    {
    	out.println("<script>alert('�н����尡 3 ȸ Ʋ�Ƚ��ϴ�. �� �̻� �α����� �Ͻ� �� �����ϴ�. �����ڿ��� �����ϼ���');</script>");
    	lock_chk = "w";
    }
    else if(result.equals("EMPTY"))	// ���̵� ����
    {    	
    	out.println("<script>alert('��ϵ� ���̵� �ƴմϴ�.');</script>");
    	out.println("<script>history.back();</script>");
    }
    else if(result.equals("DOUBLE"))	// �ߺ� �α���
    {
    	out.println("<script>alert('�̹� �α��ε� ���̵� �Դϴ�. �α׾ƿ� �� �α��� ȭ������ ���ư��ϴ�.');</script>");
    	out.println("<script>location.href = '/HCINFO/abnormal_logout.jsp?agent_id="+id+"';</script>");
    }
    else if(result.equals("MESS"))	// �޽��� �α��� ����
    {
    	out.println("<script>alert('�޽��� �α��� �� ����Ͽ� �ֽʽÿ�');</script>");
    	out.println("<script>history.back();</script>");

    }
    else if(result.equals(""))
    {
    	out.println("<script>alert('�̹� ����� ����Դϴ�.�ٽ� Ȯ���Ͽ� �ֽʽÿ�.');</script>");
    	out.println("<script>history.back();</script>");
    }
    else					// ����Ҽ� �ִ� ���̵� �ƴ�
    {
		out.println("<script>alert('"+result+"');</script>");
    	out.println("<script>history.back();</script>");
    }

%>
<script>
	function init()
	{
		var frm = document.myform;
		var lock_chk = '<%=lock_chk%>';

		if(lock_chk == 'y')
		{
			frm.lock_cnt.value = '3';
			frm.action = '/HCINFO/intranet.jsp?YOU=YOU';
			frm.submit();
		}
		else if(lock_chk == 'w')
		{
			frm.lock_cnt.value = '<%=lock_cnt%>';
			frm.action = '/HCINFO/intranet.jsp?YOU=YOU';
			frm.submit();
		}
		else
		{}
	}
</script>
</head>
<body onload="init();">
<form name="myform" method="post">
<input type="hidden" name="lock_cnt" value="">
</form>
</body>
</html>
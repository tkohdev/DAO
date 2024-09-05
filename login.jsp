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

	//---로그인 횟수 체크를 위한 쿠키 
	String value = request.getHeader("Cookie");
	int i_vis	=	0;	//오류횟수	
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
	
	String m_type = StringUtil.nchk(request.getParameter("m_type"));	//민현수 모바일 관리자 로그인 구분테스트

	String lock_chk = "";
	LoginManagerBiz login = LoginManagerBiz.getInstance();
	HashMap map = login.check_Member(agency.trim(), cust_num.trim(), id.trim(), pass.trim(), i_vis+"" , ip);

    String result 		= map.get("return")+"";
    String lock_cnt 	= map.get("lock_cnt")+"";

    String DB_pass 		= ""; 
    
    if(result.equals("LOCK"))
    {
    	out.println("<script>alert('패스워드를 3회이상 틀리셨으므로 로그인 하실 수 없습니다.관리자에게 문의하세요');</script>");
    	lock_chk = "y";
    }
    else if(result.equals("OK"))			//정상적인 로그인
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
    	session.setAttribute("org_div", 	map.get("org_div").toString());  		//본사: 1  외야 :2
        session.setAttribute("position", 	map.get("position").toString());
        session.setAttribute("rank", 		map.get("rank").toString());			//본부장 구분
        session.setAttribute("team", 		map.get("team").toString());
        session.setAttribute("depart", 		map.get("depart").toString());
        session.setAttribute("s_position", 	map.get("s_position").toString());
        session.setAttribute("gender", 		map.get("gender").toString());
        session.setAttribute("cust_num", 		map.get("cust_num").toString());
        	
        String org 		= map.get("org_div").toString();
		String rank		= map.get("rank").toString();	

// 원본소스	
//---권한 제어를 위해 임의로 권한 부여 나중에 삭제 요망
// 		if(org.equals("1")) session.setAttribute("level", "9");			//본사직원
// 		else if(rank.equals("300")) session.setAttribute("level", "8");	//본부장
// 		else if(rank.equals("310")) session.setAttribute("level", "8");	//본부직원
// 		else if(rank.equals("400")) session.setAttribute("level", "7");	//지사장
// 		else if(rank.equals("410")) session.setAttribute("level", "7");	//지사직원
// 		else if(rank.equals("500")) session.setAttribute("level", "6");	//지점장
// 		else if(rank.equals("510")) session.setAttribute("level", "6");	//지점직원
// 		else session.setAttribute("level", "5");							//설계사
//-------여기까지    	
 
//---권한 제어를 위해 임의로 권한 부여-DAO(2020.01.02)
 		if(org.equals("1")){
 	 		if(rank.equals("100")) session.setAttribute("level", "8");	    //대표이사
 	 		else if(rank.equals("130")) session.setAttribute("level", "7");	//본부장
 	 		else if(rank.equals("140")) session.setAttribute("level", "6");	//팀장
 	 		else session.setAttribute("level", "5");						//팀장이하
 		}else{                                          //주주 모니터링 권한
 	 		session.setAttribute("level", "5");						//일반주주
 			
 		}

//관리자 권한 추가
 		if(id.equals("111111"))  session.setAttribute("level", "9");	    //최고권한 관리자(다오직원)
//-------여기까지  
    	
    	DB_pass 	= map.get("DB_pass")+"";

    	if(DB_pass.equals(id))
    	{
    		out.println("<script>alert('현재 사용하고 계신 패스워드는 <임시 패스워드입> 니다. 패스워드를 변경해 주세요');</script>");
    		out.println("<script>pop_up('/HCINFO/jsp/COM/PWCHG_INPUT.jsp','550', '250', 'D', 'no');</script>");
    	}
    	
// 원본소스(나중에 없어도 괜찮아)    	
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
    	
    	Cookie cookie = new Cookie (id, "0");	//쿠키 초기화
    	cookie.setMaxAge(365 * 24 * 60 * 60);
        response.addCookie(cookie);
    }
    else if(result.equals("OVER"))	// 패스워드 수정
    {
    	out.println("<script>alert('패스워드 변경 기간이 지났습니다. 패스워드를 새로 지정해 주세요.');</script>");   	    	    	
    	out.println("<script>pop_up('/DAO/jsp/COM/PWCHG_INPUT.jsp','550', '250', 'D', 'no');</script>");   	
    	out.println("<script>history.back();</script>");
    }
    else if(result.equals("ERROR"))	// 패스워드를 1,2번  틀림
    {    	
    	out.println("<script>alert('패스워드가 "+ lock_cnt +" 회 틀렸습니다.');</script>");
    	lock_chk = "w";
    	
    	Cookie cookie = new Cookie (id, lock_cnt);
    	cookie.setMaxAge(365 * 24 * 60 * 60);
        response.addCookie(cookie);
    }
    else if(result.equals("WRONG"))	// 패스워드를 3번 틀림
    {
    	out.println("<script>alert('패스워드가 3 회 틀렸습니다. 더 이상 로그인을 하실 수 없습니다. 관리자에게 문의하세요');</script>");
    	lock_chk = "w";
    }
    else if(result.equals("EMPTY"))	// 아이디가 없음
    {    	
    	out.println("<script>alert('등록된 아이디가 아닙니다.');</script>");
    	out.println("<script>history.back();</script>");
    }
    else if(result.equals("DOUBLE"))	// 중복 로그인
    {
    	out.println("<script>alert('이미 로그인된 아이디 입니다. 로그아웃 후 로그인 화면으로 돌아갑니다.');</script>");
    	out.println("<script>location.href = '/HCINFO/abnormal_logout.jsp?agent_id="+id+"';</script>");
    }
    else if(result.equals("MESS"))	// 메신져 로그인 여부
    {
    	out.println("<script>alert('메신저 로그인 후 사용하여 주십시요');</script>");
    	out.println("<script>history.back();</script>");

    }
    else if(result.equals(""))
    {
    	out.println("<script>alert('이미 퇴사한 사원입니다.다시 확인하여 주십시요.');</script>");
    	out.println("<script>history.back();</script>");
    }
    else					// 사용할수 있는 아이디가 아님
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
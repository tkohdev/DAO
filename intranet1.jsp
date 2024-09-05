<%@ page contentType="text/html; charset=euc-kr" errorPage="error.jsp" %>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="com.uto.util.*"%>  
<%@ page import="com.uto.login.*"%> 
<%

	String disable_input = "";
	String disable_btn = "";
	String ver = "HCINFO ver:1.0";	//HCINFO 버전
	String YOU	= StringUtil.nchk(request.getParameter("YOU"));
	 
%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
.textbox
	{
		border: 0; 
		margin: 0; 
		outline: 0; 
		padding-top:3px;
		z-index: 10;
		font-family: "맑은 고딕";
		font-size: 10pt;
		background-color: #e6e6e6;
	}
	
	.btn
	{
		width: 220px; 
		height: 30px; 
		cursor: pointer;
		z-index: 10;
    	border: 0;
    	filter: alpha(opacity=1);
    	opacity: 0;
	}
</style>
<script type="text/javascript">
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	for (var word in mobileKeyWords)
	{
    	if (navigator.userAgent.match(mobileKeyWords[word]) != null)
        {
        	location.href = "/HCINFO/jsp/M/M_MAIN.jsp";
        	break;
    	}
	}
</script>
<script language="javascript">
	function selectLogin()
	{
		var frm = document.myform;
		var you = '<%=YOU%>';

		if(frm.agent_id.value == "사용자 아이디")
		{
			alert("아이디를 입력해 주세요");
			frm.agent_id.focus();
			return;
		}
		
		if(frm.agent_id.value.length < 1)
		{
			alert("아이디를 입력해 주세요");
			frm.agent_id.focus();
			return;
		}
		
		if(frm.pass.value == "사용자 비밀번호")
		{
			alert("비밀번호를 입력해 주세요");
			frm.pass.focus();
			return;
		}

		if(frm.pass.value.length < 1)
		{
			alert("비밀번호를 입력해 주세요");
			frm.pass.focus();
			return;
		}

		//if(you == "")
		//{
		//	alert("HCINFO_WSS 실행 화면에서 실행해 주세요 ");
		//	return;
		//}
		
		frm.action = "login.jsp";
		frm.submit();
	}

	function checklen()
	{
		var frm = document.myform;
	 	if(frm.agent_id.value.length == 7)
	 	{
	 		frm.pass.focus();
	 	}
	}

	function re_set(type)
	{
		var frm = document.myform;

		if(type == "id")
		{
			frm.agent_id.value = "";
		}
		
		if(type == "pw")
		{
			frm.pass.value = "";
		}
	}
</script>
</head>
<LINK href="/HCINFO/css/common.css" type=text/css rel=stylesheet>
<body marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" style="overflow: hidden;" >
<form name="myform" method="post">

<div style="vertical-align: middle;background-repeat: no-repeat; background-position: top; height:820px; overflow:hidden;">
		<div style="position: absolute;">
			<div style="position: relative; top:428px; left: 187px; width: 250; height: 55;">
				<input type="text" name="agent_id" size="20" class="textbox" onKeyup="checklen()">
			</div>
		</div>
		<div style="position: absolute;">
			<div style="position: relative; top:468px; left: 187px;  width: 250; height: 50;">
				<input type="password" size="20" name="pass" class="textbox" onKeypress="javascript:if(event.keyCode==13) selectLogin();">
			</div>
		</div>
		<div style="position: absolute;">
			<div style="position: relative; top:517px; left: 155px; width: 250; height: 60;">
				<input type="button" onclick="selectLogin();" class="btn">
			</div>
		</div>
	<img src="/HCINFO/image/login/hcinfo.jpg" style="height: 820px; width:1590px; ;overflow: hidden;">
</div>
</form>
</body>
</html>
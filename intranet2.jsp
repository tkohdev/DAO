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
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>HCINFO 사업관리시스템</title>

  <!-- Favicons -->
<link href="/HCINFO/new/img/favicon.png" rel="icon">
<link href="/HCINFO/new/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
<link href="/HCINFO/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
<link href="/HCINFO/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
<link href="/HCINFO/css/style.css" rel="stylesheet">
<link href="/HCINFO/css/style-responsive.css" rel="stylesheet">
<script type="text/javascript">
/*
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	for (var word in mobileKeyWords)
	{
    	if (navigator.userAgent.match(mobileKeyWords[word]) != null)
        {
        	location.href = "/HCINFO/jsp/M/M_MAIN.jsp";
        	break;
    	}
	}
*/
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

<body>
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form name="myform" method="post"class="form-login" >
        <h2 class="form-login-heading">HCINFO 사업관리시스템</h2>
        <div class="login-wrap">
          <input type="text" name="agent_id" class="form-control" placeholder="User ID" onKeyup="checklen()" autofocus>
          <br>
          <input type="password" name="pass" class="form-control" placeholder="Password" onKeypress="javascript:if(event.keyCode==13) selectLogin();">
          <br>
<%--           <input type="button" onclick="selectLogin();" class="btn">      --%>
           <button class="btn btn-theme btn-block" onclick="selectLogin();" type="button"><i class="fa fa-lock"></i> SIGN IN</button>      
        </div>
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/HCINFO/lib/jquery/jquery.min.js"></script>
  <script src="/HCINFO/lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <script type="text/javascript" src="/HCINFO/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("image/login-bg.png", {
      speed: 500
    });
  </script>
</body>

</html>

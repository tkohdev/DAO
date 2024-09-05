<%@ page contentType="text/html; charset=euc-kr" errorPage="error.jsp" %>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="com.uto.util.*"%>  
<%@ page import="com.uto.login.*"%> 
<%

	String disable_input = "";
	String disable_btn = "";
	String ver = "DAOcorp ver:1.0";	//BIZINFO 버전
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
<title>GenesysMessengerDemo</title>

  <!-- Favicons -->
<link href="/DAO/new/img/favicon.png" rel="icon">
<link href="/DAO/new/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
<link href="/DAO/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
<link href="/DAO/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
<link href="/DAO/css/style.css" rel="stylesheet">
<link href="/DAO/css/style-responsive.css" rel="stylesheet">
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

		if(frm.agency.value == "Manage Code")
		{
			alert("관리업체코드를 입력해 주세요");
			frm.agency.focus();
			return;
		}
		
		if(frm.agency.value.length < 1)
		{
			alert("관리업체코드를 입력해 주세요");
			frm.agency.focus();
			return;
		}
		
		if(frm.cust_num.value == "Company Code")
		{
			alert("회사코드를 입력해 주세요");
			frm.cust_num.focus();
			return;
		}
		
		if(frm.cust_num.value.length < 1)
		{
			alert("회사코드를 입력해 주세요");
			frm.cust_num.focus();
			return;
		}		
		
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
		
		frm.action = "login.jsp";
		frm.submit();
	}

	function checklen()
	{
		var frm = document.myform;
	 	if(frm.agent_id.value.length == 8)
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
      *********************************************************************************************************************************************************** 
  <div id="login-page">
    <div class="container">
      <form name="myform" method="post"class="form-login" >
        <h2 class="form-login-heading">BIZINFO SYSTEM</h2>
        <div class="login-wrap">
          <input type="text" name="agency" class="form-control" placeholder="Manage Code">
          <br> 
          <input type="text" name="cust_num" class="form-control" placeholder="Company Code">
          <br>                 
          <input type="text" name="agent_id" class="form-control" placeholder="User ID" onKeyup="checklen()">
          <br>
          <input type="password" name="pass" class="form-control" placeholder="Password" onKeypress="javascript:if(event.keyCode==13) selectLogin();">
          <br>
           <button class="btn btn-theme btn-block" onclick="selectLogin();" type="button"><i class="fa fa-lock"></i> SIGN IN</button>      
        </div>
      </form>
    </div>
  </div>
  -->
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/DAO/lib/jquery/jquery.min.js"></script>
  <script src="/DAO/lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <script type="text/javascript" src="/DAO/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("image/BuildaBot.png", {
      speed: 500
    });
  </script>
<script type="text/javascript" charset="utf-8">
  (function (g, e, n, es, ys) {
    g['_genesysJs'] = e;
    g[e] = g[e] || function () {
      (g[e].q = g[e].q || []).push(arguments)
    };
    g[e].t = 1 * new Date();
    g[e].c = es;
    ys = document.createElement('script'); ys.async = 1; ys.src = n; ys.charset = 'utf-8'; document.head.appendChild(ys);
  })(window, 'Genesys', 'https://apps.apne2.pure.cloud/genesys-bootstrap/genesys.min.js', {
    environment: 'prod-apne2',
    deploymentId: '227a1c24-4a11-41ee-8fa5-a79045d32e8e'
  });
</script>
</body>

</html>

<%@ page contentType="text/html; charset=euc-kr"%>

<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="com.uto.util.*"%>  
<%@ page import="com.uto.pool.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Genesys Cloud SDK Demo Site</title>

  <!-- Favicons -->
  <link href="/DAO/new/img/favicon.png" rel="icon">
  <link href="/DAO/new/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Bootstrap core CSS -->
  <link href="/DAO/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="/DAO/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/DAO/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="/DAO/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="/DAO/css/style.css" rel="stylesheet">
  <link href="/DAO/css/style-responsive.css" rel="stylesheet">
  <script src="/DAO/lib/chart-master/Chart.js"></script>
  <!-- Custom fonts for this template-->
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <!-- Custom styles for this template-->
  <link href="/DAO/css/sb-admin-2.min.css" rel="stylesheet">  
  
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://sdk-cdn.mypurecloud.com/javascript/28.0.0/purecloud-platform-client-v2.min.js"></script>
  <script src="https://apps.inindca.com/genesys-cloud-client-logger/genesys-cloud-client-logger.min.js"></script>
  <script>
    if (window.location.href.indexOf('/cdn') > -1) {
      const script = document.createElement('script');
      // for local development
//      script.src = '../../dist/genesys-cloud-webrtc-sdk.js';
      script.src = 'https://sdk-cdn.mypurecloud.com/webrtc-sdk/v7/genesys-cloud-webrtc-sdk.js';
      document.head.prepend(script);
    }
  </script>
  <script>
    window.environments = {
      'tokyo': {
        clientId: 'a730b7e3-1b93-4089-a2f6-3624af1a9a2e', // created in tokyo org
        uri: 'mypurecloud.jp'
      },
      'seoul': {
        clientId: '872d2920-58ff-4bb3-a6fb-3065b00f8eb8', // created in coupang seoul org
        uri: 'apne2.pure.cloud'
      }
    };

    // This needs to be a global since it is initialized by platformClientInit.js and utilized in app-controller.js
    window.conversationsAPI;

    window.getCurrentUrlParams = () => {
      let params = null;
      const urlParts = window.location.href.split('#');

      if (urlParts[1]) {
        const urlParamsArr = urlParts[1].split('&');

        if (urlParamsArr.length) {
          params = {};
          for (let i = 0; i < urlParamsArr.length; i++) {
            const currParam = urlParamsArr[i].split('=');
            const key = currParam[0];
            const value = currParam[1];
            params[key] = value;
          }
        }
      }

      return params;
    }
  </script>  
  <link rel="stylesheet" type="text/css" href="../demo/common/main.css">
  
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
     <form name="top" method="post" role="form">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="/DAO/jsp/first3.jsp" class="logo"><b><span>Genesys Cloud</span>SDK Demo Site</b></a>
      <!--logo end-->
     </form> 
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
    <!--sidebar menu start--> 
 				<ul class="sidebar-menu" id="nav-accordion"> 
 					<p class="centered">
 						<a><img src="/DAO/image/coupang_logo.png" class="logo" width="150"></a> 
 					</p> 
 					<div class="desc centered">DAOCORP_TKOh_v1.0.1(H230816)</div>
<!--
	 					<li class="mt"><a><i	class="fa fa-dashboard"></i><span>��ú���</span></a></li>
  --> 					 
				</ul>
    <!-- sidebar menu end --> 					
			</div>
		</aside>    
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
			<section class="wrapper">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-2">
					<h1 class="h1 mb-0 text-gray-800">Login to Genesys Cloud</h1>
				</div>
				<div class="row">
					<div class="col-xl-6 col-md-4 mb-1">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xl font-weight-bold text-primary text-uppercase mb-1">
											<h4>
												1. Region ����<br>2. Genesys Cloud login<br>3. Input SDK<br>4. Click ����
											</h4>
										</div>
									</div>
									<div class="col mr-2">
										<div>
											<label class="h5 mb-0 font-weight-bold text-gray-800" for="environment">Select Environment :</label>
											<select	class="form-control form-control-sm mb-2" id="environment" name="environment">
												<option value="tokyo">tokyo</option>
												<option value="seoul">seoul</option>
											</select>
										</div>
										<div>
											<form id="manual-form">
												<div class="form-group">
													<button class="btn btn-success" id="auth-button" type="button">login</button>
													<button id="auth-logout" type="button" class="btn btn-danger btn-sm">logout</button>
													<button class="btn btn-sm btn-secondary mr-2" type="submit">Use manual auth token</button>
												</div>
											</form>

										</div>
										<div>
											<label class="h5 mb-0 font-weight-bold text-gray-800" for="environment">����� Auth Token �Է�</label>
											<input class="form-control mb-2" id="manual-auth1" placeholder="If you use custom access token, type this input box">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                    <!-- Content Row -->
				<div class="d-sm-flex align-items-center justify-content-between mb-2">
					<h1 class="h1 mb-0 text-gray-800">SDK Excution</h1>
                </div>
				<div class="row">
					<div class="col-xl col-md-4 mb-1">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
											<h4>
												Input SDK
											</h4>
										</div>
										<div>
											<textarea class="form-control mb-2" cols="50" rows="20" id="inputdata"></textarea>
										</div>
										<div>
											<button class="btn btn-success" id="function excute" type="button" onclick="GetFunction()">����</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</section>
		</section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>DAOCORP</strong>. All Rights Reserved
        </p>
        <div class="credits centered">
          Created by <a href="http://www.DAO.co.kr/">TKOH</a>
        </div>
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="/DAO/lib/jquery/jquery.min.js"></script>
  <script src="/DAO/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="/DAO/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/DAO/lib/jquery.scrollTo.min.js"></script>
  <script src="/DAO/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="/DAO/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="/DAO/lib/common-scripts.js"></script>
  <script type="text/javascript" src="/DAO/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="/DAO/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="/DAO/lib/sparkline-chart.js"></script>
  <script src="/DAO/lib/zabuto_calendar.js"></script>
      <!-- Page level plugins -->
  <script src="/DAO/lib/chart-master/Chart.min.js"></script>
  <script src="/DAO/lib/chart-master/chart-area-demo.js"></script>
    <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script type="text/javascript">

    if(top != window) {

        top.location = window.location;

    }

</script>
  <script src="/DAO/lib/platform-client.js"></script>
  <script src="/DAO/lib/sdk-sample.js"></script>
<!-- Include the CJS SDK -->
<script src="https://sdk-cdn.mypurecloud.com/javascript/180.0.0/purecloud-platform-client-v2.min.js"></script>

<!--  
<script type="text/javascript">
  // Obtain a reference to the platformClient object
  const platformClient = require('platformClient');
</script>
-->


<script>

function GetFunction(){
    const urlParts = window.location.href.split('#');
    const urlParamsArr = urlParts[1].split('&');
    const currParam = urlParamsArr[0].split('=');
    const key = currParam[0];
    const value = currParam[1];
	const data1 = document.getElementById('inputdata').value;
	console.log(value);
	$('#manual-auth1').val(value); 
	const func = new Function(data1);
	func();	
}
</script>
</body>
</html>

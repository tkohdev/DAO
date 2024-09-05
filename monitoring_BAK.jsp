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
  <title>Coupang 회선 모니터링</title>

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
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <!-- Custom styles for this template-->
  <link href="/DAO/css/sb-admin-2.min.css" rel="stylesheet">  
  
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
      <a href="/DAO/jsp/first3.jsp" class="logo"><b><span>Coupang </span>Monitoring System</b></a>
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
 						<a><img src="/DAO/image/2000.png" class="logo" width="150"></a> 
 					</p> 
 					<div class="desc centered">DAOCORP_v1.0.1(H201001)</div> 
	 					<li class="mt"><a><i	class="fa fa-dashboard"></i><span>대시보드</span></a></li>

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
                <!-- Begin Page Content -->
                <div class="container-fluid">
                 <!-- Total InOutbound -->
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h1 mb-0 text-gray-800">Total Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h1>Total Inbound</h1>
                                            </div>
                                            <div class="row mt">
	                                            <div id="T_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-inbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h1>Total Outbound</h1>                                            
                                            </div>
                                            <div class="row mt">
	                                            <div id="T_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-outbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                           
                        <div class="col-xl col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h1>Total Usage</h1>                                            
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                            <div class="row mt">
	                                            <div id="T_Rate"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">%</div>
                                            </div>

                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div id="r_progressbar" class="progress-bar bg-info" role="progressbar" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-percent fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 <!-- LG_InOutbound -->
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h1 mb-0 text-gray-800">LG Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h1>LG Total Inbound</h1>
                                            </div>
                                            <div class="row mt">
	                                            <div id="L_T_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-inbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h1>LG Total Outbound</h1>                                            
                                            </div>
                                            <div class="row mt">
	                                            <div id="L_T_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-outbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                           
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h1>LG Total Usage</h1>                                            
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                            <div class="row mt">
	                                            <div id="L_T_Rate"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">%</div>
                                            </div>

                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div id="l_r_progressbar" class="progress-bar bg-info" role="progressbar" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-percent fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h1>Anyang</h1>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="L_A_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="L_A_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h1>Daejun</h1>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="L_D_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="L_D_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 <!-- SKB_InOutbound -->
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h1 mb-0 text-gray-800">SKB Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h1>SKB Total Inbound</h1>
                                            </div>
                                            <div class="row mt">
	                                            <div id="S_T_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-inbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h1>SKB Total Outbound</h1>                                            
                                            </div>
                                            <div class="row mt">
	                                            <div id="S_T_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-telephone-outbound fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                           
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h1>SKB Total Usage</h1>                                            
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                            <div class="row mt">
	                                            <div id="S_T_Rate"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">%</div>
                                            </div>

                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div id="s_r_progressbar" class="progress-bar bg-info" role="progressbar" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-percent fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h1>Dongjak</h1>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="S_D_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="S_D_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-3">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h1>Seongbuk</h1>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="S_S_Inbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="h1 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="S_S_Outbound"class="h1 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h1 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    
                    <!-- Content Row -->
            <!-- 
                    <div class="row">
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    -->
                </div>
                <!-- /.container-fluid -->
      </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>DAOCORP</strong>. All Rights Reserved
        </p>
        <div class="credits">
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
  <script type="text/javascript">

    if(top != window) {

        top.location = window.location;

    }

</script>
<script>
    let trunkin01 = {};
    let trunkin02 = {};
    let trunkout01 = {};
    let trunkout02 = {};

    fetch("http://10.0.246.138/api/getsensordetails.json?id=2140&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
    .then(response => response.json())
    .then((response) => {
       //Trunk01의 데이터를 불러온다
        trunkin01.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2141&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk02의 센서 데이터를 받아온다
      })
    .then((response) => response.json())
    .then((response) => {
    	trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2152&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk01 outbound 데이터
      })
    .then((response) => response.json())
    .then((response) => {
    	trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2153&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk02 outbound 데이터
      })
    .then((response) => response.json())
    .then((response) => {
    	trunkout02.data = parseInt(response.sensordata.lastvalue);
        return trunkout02; //trunk02 outbound 데이터
      })       
    .then(data => {
      const lastvalue_in = document.createElement("div");
      const lastvalue_out = document.createElement("div");
      const lastvalue_rate = document.createElement("div");
      lastvalue_in.textContent = trunkin01.data + trunkin02.data; // trunk01과 trunk02의 데이터를 합산하여 표기
      lastvalue_out.textContent = trunkout01.data + trunkout02.data; // trunk01과 trunk02의 데이터를 합산하여 표기
      lastvalue_rate.textContent = Math.round((trunkin01.data + trunkin02.data + trunkout01.data + trunkout02.data) / 4180 * 100); // trunk01과 trunk02의 데이터를 합산하여 표기
      const T_Inbound = document.getElementById("T_Inbound");
      const T_Outbound = document.getElementById("T_Outbound");
      const T_Rate = document.getElementById("T_Rate");      
      T_Inbound.appendChild(lastvalue_in);
      T_Outbound.appendChild(lastvalue_out);
      T_Rate.appendChild(lastvalue_rate);
      this.changewidth();
      })
   function changewidth() {
        var width_value = Math.round((trunkin01.data + trunkin02.data + trunkout01.data + trunkout02.data) / 4180 * 100);
        document.getElementById("r_progressbar").style.width = width_value + "%";
    }
</script>
<script>
    let l_a_trunkin = {};
    let l_d_trunkin = {};
    let l_a_trunkout = {};
    let l_d_trunkout = {};

    fetch("http://10.0.246.138/api/getsensordetails.json?id=2143&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
    .then(response => response.json())
    .then((response) => {
       //LG 안양 Inbound의 데이터를 불러온다
        l_a_trunkin.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2146&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 대전 Inbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	l_d_trunkin.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2155&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 안양 Outbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	l_a_trunkout.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2156&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 안양 Outbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	l_d_trunkout.data = parseInt(response.sensordata.lastvalue);
        return l_d_trunkout; //trunk02 outbound 데이터
      })       
    .then(data => {
      const lastvalue_in_l_a = document.createElement("div");
      const lastvalue_in_l_d = document.createElement("div");
      const lastvalue_in_l_t = document.createElement("div");
      const lastvalue_out_l_a = document.createElement("div");
      const lastvalue_out_l_d = document.createElement("div");
      const lastvalue_out_l_t = document.createElement("div");
      const lastvalue_l_rate = document.createElement("div");
      lastvalue_in_l_a.textContent = l_a_trunkin.data; // LG 안양 Inbound
      lastvalue_in_l_d.textContent = l_d_trunkin.data; // LG 대전 Inbound
      lastvalue_in_l_t.textContent = l_a_trunkin.data + l_d_trunkin.data; // LG 전체 Inbound
      lastvalue_out_l_a.textContent = l_a_trunkout.data; // LG 안양 Outbound
      lastvalue_out_l_d.textContent = l_d_trunkout.data; // LG 대전 Outbound
      lastvalue_out_l_t.textContent = l_a_trunkout.data + l_d_trunkout.data; // LG 전체 Outbound      
      lastvalue_l_rate.textContent = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data) / 1600 * 100); // 안양,대전의 데이터를 합산하여 표기
      const L_T_Inbound = document.getElementById("L_T_Inbound");
      const L_T_Outbound = document.getElementById("L_T_Outbound");
      const L_T_Rate = document.getElementById("L_T_Rate");    
      const L_A_Inbound = document.getElementById("L_A_Inbound");
      const L_D_Inbound = document.getElementById("L_D_Inbound");      
      const L_A_Outbound = document.getElementById("L_A_Outbound");
      const L_D_Outbound = document.getElementById("L_D_Outbound");
      L_T_Inbound.appendChild(lastvalue_in_l_t);
      L_T_Outbound.appendChild(lastvalue_out_l_t);
      L_T_Rate.appendChild(lastvalue_l_rate);
      L_A_Inbound.appendChild(lastvalue_in_l_a);
      L_A_Outbound.appendChild(lastvalue_out_l_a);
      L_D_Inbound.appendChild(lastvalue_in_l_d);
      L_D_Outbound.appendChild(lastvalue_out_l_d);
      this.l_changewidth();
      })
   function l_changewidth() {
        var width_value = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data) / 1600 * 100);
        document.getElementById("l_r_progressbar").style.width = width_value + "%";
    }
</script>
<script>
    let s_d_trunkin01 = {};
    let s_d_trunkin02 = {};
    let s_d_trunkout01 = {};
    let s_d_trunkout02 = {};
    let s_s_trunkin01 = {};
    let s_s_trunkin02 = {};
    let s_s_trunkout01 = {};
    let s_s_trunkout02 = {};

    fetch("http://10.0.246.138/api/getsensordetails.json?id=2148&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
    .then(response => response.json())
    .then((response) => {
       //SKB 동작01 Inbound의 데이터를 불러온다
        s_d_trunkin01.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2149&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Inbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	s_d_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2158&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작01 Outbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	s_d_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2159&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Outbound의 데이터를 불러온다
      })
    .then((response) => response.json())
    .then((response) => {
    	s_d_trunkout02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2150&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Inbound의 데이터를 불러온다
      })
      
    .then((response) => response.json())
    .then((response) => {
    	s_s_trunkin01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2151&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Inbound의 데이터를 불러온다
      }) 
    .then((response) => response.json())
    .then((response) => {
    	s_s_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2160&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Outbound의 데이터를 불러온다
      })    
    .then((response) => response.json())
    .then((response) => {
    	s_s_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://10.0.246.138/api/getsensordetails.json?id=2161&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Outbound의 데이터를 불러온다
      }) 
    .then((response) => response.json())
    .then((response) => {
    	s_s_trunkout02.data = parseInt(response.sensordata.lastvalue);
        return s_s_trunkout02;
      })       
    .then(data => {
      const lastvalue_in_s_d_d01 = document.createElement("div");
      const lastvalue_in_s_d_d02 = document.createElement("div");
      const lastvalue_in_s_s_d01 = document.createElement("div");
      const lastvalue_in_s_s_d02 = document.createElement("div");
      const lastvalue_out_s_d_d01 = document.createElement("div");
      const lastvalue_out_s_d_d02 = document.createElement("div");
      const lastvalue_out_s_s_d01 = document.createElement("div");
      const lastvalue_out_s_s_d02 = document.createElement("div");
      const lastvalue_in_s_t = document.createElement("div");
      const lastvalue_out_s_t = document.createElement("div");
      const lastvalue_s_rate = document.createElement("div");
      const lastvalue_in_s_d_t = document.createElement("div");
      const lastvalue_out_s_d_t = document.createElement("div");
      const lastvalue_in_s_s_t = document.createElement("div");
      const lastvalue_out_s_s_t = document.createElement("div");      
      lastvalue_in_s_d_t.textContent = s_d_trunkin01.data + s_d_trunkin02.data; // SKB 동작 Inbound
      lastvalue_in_s_s_t.textContent = s_s_trunkin01.data + s_s_trunkin02.data; // SKB 성북 Inbound
      lastvalue_in_s_t.textContent = s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data; // SKB 전체 Inbound      
      lastvalue_out_s_d_t.textContent = s_d_trunkout01.data + s_d_trunkout02.data; // SKB 동작 Outbound
      lastvalue_out_s_s_t.textContent = s_s_trunkout01.data + s_s_trunkout02.data; // SKB 성북 Outbound 
      lastvalue_out_s_t.textContent = s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data; // SKB 전체 Outbound         
      lastvalue_s_rate.textContent = Math.round((s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 2580 * 100); // 안양,대전의 데이터를 합산하여 표기
      const S_T_Inbound = document.getElementById("S_T_Inbound");
      const S_T_Outbound = document.getElementById("S_T_Outbound");
      const S_T_Rate = document.getElementById("S_T_Rate");    
      const S_D_Inbound = document.getElementById("S_D_Inbound");
      const S_S_Inbound = document.getElementById("S_S_Inbound");      
      const S_D_Outbound = document.getElementById("S_D_Outbound");
      const S_S_Outbound = document.getElementById("S_S_Outbound");
      S_T_Inbound.appendChild(lastvalue_in_s_t);
      S_T_Outbound.appendChild(lastvalue_out_s_t);
      S_T_Rate.appendChild(lastvalue_s_rate);
      S_D_Inbound.appendChild(lastvalue_in_s_d_t);
      S_D_Outbound.appendChild(lastvalue_out_s_d_t);
      S_S_Inbound.appendChild(lastvalue_in_s_s_t);
      S_S_Outbound.appendChild(lastvalue_out_s_s_t);
      this.s_changewidth();
      })
   function s_changewidth() {
        var width_value = Math.round((s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 2580 * 100);
        document.getElementById("s_r_progressbar").style.width = width_value + "%";
    }
</script>
<script language='javascript'>
window.setTimeout('window.location.reload()',60000);
</script>
</body>
</html>

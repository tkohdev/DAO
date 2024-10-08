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
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <!-- Custom styles for this template-->
  <link href="/DAO/css/sb-admin-2.min.css" rel="stylesheet">  
</head>

<body onload="LGTotalCuncurrent()" oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
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
 						<a><img src="/DAO/image/coupang_logo.png" class="logo" width="150"></a> 
 					</p> 
 					<div class="desc centered">DAOCORP_TKOh_v1.0.1(H230816)</div> 
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-2">
                        <h1 class="h1 mb-0 text-gray-800">Total Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-2 col-md-4 mb-1">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h2>Total<br>Inbound</h2>
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
                        <div class="col-xl-2 col-md-4 mb-1">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h2>Total<br>Outbound</h2>                                            
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
                        <div class="col-xl-2 col-md-4 mb-1">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h2>Total<br>Usage</h2>                                            
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
                                                   <div id="r_progressbar" class="progress-bar bg-info" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
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
                        <div class="col-xl-6 col-md-4 mb-1">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            <h2>Last 12 Hours Concurrent Avg. per Hours</h2>                                            
                                            </div>
                                            <div class="chart-area">
                                            	<canvas id="myAreaChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                         
                    </div>
                 <!-- LG_InOutbound -->
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-2">
                        <h1 class="h1 mb-0 text-gray-800">LG Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl col-md-5 mb-1">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h2>LG Total Inbound</h2>
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
                        <div class="col-xl col-md-5 mb-1">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h2>LG Total Outbound</h2>                                            
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
                        <div class="col-xl col-md-5 mb-1">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h2>LG Total Usage</h2>                                            
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
                        <div class="col-xl col-md-5 mb-1">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h2>Anyang</h2>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="L_A_Inbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="L_A_Outbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-1">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h2>Daejun</h2>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="L_D_Inbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="L_D_Outbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-2">
                        <h1 class="h1 mb-0 text-gray-800">SKB Concurrent</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl col-md-5 mb-0">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                            <h2>SKB Total Inbound</h2>
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
                        <div class="col-xl col-md-5 mb-0">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                            <h2>SKB Total Outbound</h2>                                            
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
                        <div class="col-xl col-md-5 mb-0">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                            <h2>SKB Total Usage</h2>                                            
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
                        <div class="col-xl col-md-5 mb-0">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h2>Dongjak</h2>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="S_D_Inbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="S_D_Outbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-building fa-5x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-xl col-md-5 mb-0">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-0">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                <h2>Seongbuk</h2>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Inbound</div>
	                                            <div id="S_S_Inbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
                                            </div>
                                            <div class="row mt-1">
                                                <div class="h2 mb-0 font-weight-bold text-gray-800">Outbound</div>
	                                            <div id="S_S_Outbound"class="h2 mb-0 font-weight-bold text-gray-800" style="margin-left: 10px; margin-right: 5px"></div>
    	                                        <div class="h2 mb-0 font-weight-bold text-gray-800">call</div>
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
<script>
// 토탈 데이터를 통신사 데이터로 합산하기 위하여 통합 삭제
/*
function TotalCuncurrent(){
    let trunkin01 = {};
    let trunkin02 = {};
    let trunkout01 = {};
    let trunkout02 = {};
    fetch("http://211.168.177.225/api/getsensordetails.json?id=2140&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2140&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })
    .then((response) => {
       //Trunk01의 데이터를 불러온다
        trunkin01.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2141&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk02의 센서 데이터를 받아온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2141&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })      
    .then((response) => {
    	trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2152&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk01 outbound 데이터
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2152&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })            
    .then((response) => {
    	trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2153&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======"); //trunk02 outbound 데이터
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2153&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })   
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
      lastvalue_rate.textContent = Math.round((trunkin01.data + trunkin02.data + trunkout01.data + trunkout02.data) / 5580 * 100); // trunk01과 trunk02의 데이터를 합산하여 표기
      const T_Inbound = document.getElementById("T_Inbound");
      const T_Outbound = document.getElementById("T_Outbound");
      const T_Rate = document.getElementById("T_Rate");      
      T_Inbound.appendChild(lastvalue_in);
      T_Outbound.appendChild(lastvalue_out);
      T_Rate.appendChild(lastvalue_rate);
      var width_value = Math.round((trunkin01.data + trunkin02.data + trunkout01.data + trunkout02.data) / 5580 * 100);
      document.getElementById("r_progressbar").style.width = width_value + "%";
      })
    LGTotalCuncurrent();    
}
*/
function LGTotalCuncurrent(){
    let l_a_trunkin = {};
    let l_d_trunkin = {};
    let l_a_trunkout = {};
    let l_d_trunkout = {};
    let s_d_trunkin01 = {};
    let s_d_trunkin02 = {};
    let s_d_trunkout01 = {};
    let s_d_trunkout02 = {};
    let s_s_trunkin01 = {};
    let s_s_trunkin02 = {};
    let s_s_trunkout01 = {};
    let s_s_trunkout02 = {};

    fetch("http://211.168.177.225/api/getsensordetails.json?id=2143&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2143&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })     
    .then((response) => {
       //LG 안양 Inbound의 데이터를 불러온다
        l_a_trunkin.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2146&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 대전 Inbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2146&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })         
    .then((response) => {
    	l_d_trunkin.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2155&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 안양 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2155&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })        
    .then((response) => {
    	l_a_trunkout.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2156&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======"); //LG 안양 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2156&apitoken=PC2GDZSNJYAYLNXEOA34GARMDVFTDU5PXZZ4OMXOIY======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })       
    .then((response) => {
    	l_d_trunkout.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2148&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
      })   
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2148&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })      
    .then((response) => {
       //SKB 동작01 Inbound의 데이터를 불러온다
        s_d_trunkin01.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2149&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Inbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2149&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })        
    .then((response) => {
    	s_d_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2158&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작01 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2158&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })        
    .then((response) => {
    	s_d_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2159&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2159&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_d_trunkout02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2150&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Inbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2150&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkin01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2151&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Inbound의 데이터를 불러온다
      }) 
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2151&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2160&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Outbound의 데이터를 불러온다
      })    
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2160&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2161&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Outbound의 데이터를 불러온다
      }) 
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2161&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkout02.data = parseInt(response.sensordata.lastvalue);
        return s_s_trunkout02;
      })      
    .then(data => {
      const lastvalue_in = document.createElement("div");
      const lastvalue_out = document.createElement("div");
      const lastvalue_rate = document.createElement("div");	
      const lastvalue_in_l_a = document.createElement("div");
      const lastvalue_in_l_d = document.createElement("div");
      const lastvalue_in_l_t = document.createElement("div");
      const lastvalue_out_l_a = document.createElement("div");
      const lastvalue_out_l_d = document.createElement("div");
      const lastvalue_out_l_t = document.createElement("div");
      const lastvalue_l_rate = document.createElement("div");
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
      lastvalue_in.textContent = l_a_trunkin.data + l_d_trunkin.data + s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data; // trunk01과 trunk02의 데이터를 합산하여 표기
      lastvalue_out.textContent = l_a_trunkout.data + l_d_trunkout.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data; // trunk01과 trunk02의 데이터를 합산하여 표기
      lastvalue_rate.textContent = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data + s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 5580 * 100); // trunk01과 trunk02의 데이터를 합산하여 표기
      lastvalue_in_l_a.textContent = l_a_trunkin.data; // LG 안양 Inbound
      lastvalue_in_l_d.textContent = l_d_trunkin.data; // LG 대전 Inbound
      lastvalue_in_l_t.textContent = l_a_trunkin.data + l_d_trunkin.data; // LG 전체 Inbound
      lastvalue_out_l_a.textContent = l_a_trunkout.data; // LG 안양 Outbound
      lastvalue_out_l_d.textContent = l_d_trunkout.data; // LG 대전 Outbound
      lastvalue_out_l_t.textContent = l_a_trunkout.data + l_d_trunkout.data; // LG 전체 Outbound      
      lastvalue_l_rate.textContent = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data) / 3000 * 100); // 안양,대전의 데이터를 합산하여 표기
      lastvalue_in_s_d_t.textContent = s_d_trunkin01.data + s_d_trunkin02.data; // SKB 동작 Inbound
      lastvalue_in_s_s_t.textContent = s_s_trunkin01.data + s_s_trunkin02.data; // SKB 성북 Inbound
      lastvalue_in_s_t.textContent = s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data; // SKB 전체 Inbound      
      lastvalue_out_s_d_t.textContent = s_d_trunkout01.data + s_d_trunkout02.data; // SKB 동작 Outbound
      lastvalue_out_s_s_t.textContent = s_s_trunkout01.data + s_s_trunkout02.data; // SKB 성북 Outbound 
      lastvalue_out_s_t.textContent = s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data; // SKB 전체 Outbound         
      lastvalue_s_rate.textContent = Math.round((s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 2580 * 100); // 안양,대전의 데이터를 합산하여 표기
      const T_Inbound = document.getElementById("T_Inbound");
      const T_Outbound = document.getElementById("T_Outbound");
      const T_Rate = document.getElementById("T_Rate");
      const L_T_Inbound = document.getElementById("L_T_Inbound");
      const L_T_Outbound = document.getElementById("L_T_Outbound");
      const L_T_Rate = document.getElementById("L_T_Rate");    
      const L_A_Inbound = document.getElementById("L_A_Inbound");
      const L_D_Inbound = document.getElementById("L_D_Inbound");      
      const L_A_Outbound = document.getElementById("L_A_Outbound");
      const L_D_Outbound = document.getElementById("L_D_Outbound");
      const S_T_Inbound = document.getElementById("S_T_Inbound");
      const S_T_Outbound = document.getElementById("S_T_Outbound");
      const S_T_Rate = document.getElementById("S_T_Rate");    
      const S_D_Inbound = document.getElementById("S_D_Inbound");
      const S_S_Inbound = document.getElementById("S_S_Inbound");      
      const S_D_Outbound = document.getElementById("S_D_Outbound");
      const S_S_Outbound = document.getElementById("S_S_Outbound");
      T_Inbound.appendChild(lastvalue_in);
      T_Outbound.appendChild(lastvalue_out);
      T_Rate.appendChild(lastvalue_rate);
      var width_value = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data + s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 5580 * 100);
      document.getElementById("r_progressbar").style.width = width_value + "%";
      L_T_Inbound.appendChild(lastvalue_in_l_t);
      L_T_Outbound.appendChild(lastvalue_out_l_t);
      L_T_Rate.appendChild(lastvalue_l_rate);
      L_A_Inbound.appendChild(lastvalue_in_l_a);
      L_A_Outbound.appendChild(lastvalue_out_l_a);
      L_D_Inbound.appendChild(lastvalue_in_l_d);
      L_D_Outbound.appendChild(lastvalue_out_l_d);
      var width_value = Math.round((l_a_trunkin.data + l_d_trunkin.data + l_a_trunkout.data + l_d_trunkout.data) / 3000 * 100);
      document.getElementById("l_r_progressbar").style.width = width_value + "%";
      S_T_Inbound.appendChild(lastvalue_in_s_t);
      S_T_Outbound.appendChild(lastvalue_out_s_t);
      S_T_Rate.appendChild(lastvalue_s_rate);
      S_D_Inbound.appendChild(lastvalue_in_s_d_t);
      S_D_Outbound.appendChild(lastvalue_out_s_d_t);
      S_S_Inbound.appendChild(lastvalue_in_s_s_t);
      S_S_Outbound.appendChild(lastvalue_out_s_s_t);
      var width_value = Math.round((s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 2580 * 100);
      document.getElementById("s_r_progressbar").style.width = width_value + "%";
      })
    UsageChart();    
}

// total data를 통신사 데이터를 합산한 값으로 하기 위하여 통합 삭제
/* function SKBTotalCuncurrent(){
    let s_d_trunkin01 = {};
    let s_d_trunkin02 = {};
    let s_d_trunkout01 = {};
    let s_d_trunkout02 = {};
    let s_s_trunkin01 = {};
    let s_s_trunkin02 = {};
    let s_s_trunkout01 = {};
    let s_s_trunkout02 = {};

    fetch("http://211.168.177.225/api/getsensordetails.json?id=2148&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2148&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })      
    .then((response) => {
       //SKB 동작01 Inbound의 데이터를 불러온다
        s_d_trunkin01.data = parseInt(response.sensordata.lastvalue); // {news:[{},{},{}]}
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2149&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Inbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2149&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })        
    .then((response) => {
    	s_d_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2158&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작01 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2158&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })        
    .then((response) => {
    	s_d_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2159&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 동작02 Outbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2159&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_d_trunkout02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2150&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Inbound의 데이터를 불러온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2150&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkin01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2151&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Inbound의 데이터를 불러온다
      }) 
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2151&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkin02.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2160&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북01 Outbound의 데이터를 불러온다
      })    
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2160&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
    .then((response) => {
    	s_s_trunkout01.data = parseInt(response.sensordata.lastvalue);
        return fetch("http://211.168.177.225/api/getsensordetails.json?id=2161&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======"); //SKB 성북02 Outbound의 데이터를 불러온다
      }) 
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/getsensordetails.json?id=2161&apitoken=LQS7MOZOLZV6W7W3UB6GSZB3S2D2ZYBQIT2AYNZXLQ======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })  
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
      var width_value = Math.round((s_d_trunkin01.data + s_d_trunkin02.data + s_s_trunkin01.data + s_s_trunkin02.data + s_d_trunkout01.data + s_d_trunkout02.data + s_s_trunkout01.data + s_s_trunkout02.data) / 2580 * 100);
      document.getElementById("s_r_progressbar").style.width = width_value + "%";
      })
      UsageChart();  
}
*/
</script>
<script>
function UsageChart(){
    let time_01 = {};
    let time_02 = {};
    let time_03 = {};
    let time_04 = {};
    let time_05 = {};
    let time_06 = {};	
    let time_07 = {};
    let time_08 = {};
    let time_09 = {};
    let time_10 = {};
    let time_11 = {};
    let time_12 = {};
    let trunkin01_01 = {};
    let trunkin01_02 = {};
    let trunkin01_03 = {};
    let trunkin01_04 = {};
    let trunkin01_05 = {};
    let trunkin01_06 = {};
    let trunkin01_07 = {};
    let trunkin01_08 = {};
    let trunkin01_09 = {};
    let trunkin01_10 = {};
    let trunkin01_11 = {};
    let trunkin01_12 = {};
    let trunkin02_01 = {};
    let trunkin02_02 = {};
    let trunkin02_03 = {};
    let trunkin02_04 = {};
    let trunkin02_05 = {};
    let trunkin02_06 = {};
    let trunkin02_07 = {};
    let trunkin02_08 = {};
    let trunkin02_09 = {};
    let trunkin02_10 = {};
    let trunkin02_11 = {};
    let trunkin02_12 = {};
    let trunkout01_01 = {};
    let trunkout01_02 = {};
    let trunkout01_03 = {};
    let trunkout01_04 = {};
    let trunkout01_05 = {};
    let trunkout01_06 = {};
    let trunkout01_07 = {};
    let trunkout01_08 = {};
    let trunkout01_09 = {};
    let trunkout01_10 = {};
    let trunkout01_11 = {};
    let trunkout01_12 = {};
    let trunkout02_01 = {};
    let trunkout02_02 = {};
    let trunkout02_03 = {};
    let trunkout02_04 = {};
    let trunkout02_05 = {};
    let trunkout02_06 = {};
    let trunkout02_07 = {};
    let trunkout02_08 = {};
    let trunkout02_09 = {};
    let trunkout02_10 = {};
    let trunkout02_11 = {};
    let trunkout02_12 = {};
	const e_date = new Date();
	const s_date = new Date();
	const today = new Date();
	const today_date = today.getDate();
	const s_date2 = s_date.setHours(s_date.getHours() - 12);
	const e_hours = ('0' + e_date.getHours()).slice(-2);
	const e_c_hours = e_date.getHours();
	const e_minutes = ('0' + e_date.getMinutes()).slice(-2);
	const e_seconds = "00";
	const s_hours = ('0' + s_date.getHours()).slice(-2);
	const s_minutes = ('0' + s_date.getMinutes()).slice(-2);

	var today_e_y = today.getFullYear();
	var today_e_m = today.getMonth()+1;
	var today_e_d = today.getDate();
	var today_s_y = s_date.getFullYear();
	var today_s_m = s_date.getMonth()+1;
	var today_s_d = s_date.getDate();
	const s_timeStr = today_s_y+"-"+(("00"+today_s_m.toString()).slice(-2))+"-"+(("00"+today_s_d.toString()).slice(-2)) + '-' + s_hours + '-' + s_minutes + '-' + e_seconds;  	
	const e_timeStr = today_e_y+"-"+(("00"+today_e_m.toString()).slice(-2))+"-"+(("00"+today_e_d.toString()).slice(-2)) + '-' + e_hours + '-' + e_minutes + '-' + e_seconds;
	console.log("http://211.168.177.225/api/historicdata.json?id=2140&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======");
    fetch("http://211.168.177.225/api/historicdata.json?id=2140&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======")
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/historicdata.json?id=2140&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======")
            	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })
    .then((response) => {
       //Trunk01의 데이터를 불러온다
        time_01.data = response.histdata[0].datetime;
        time_02.data = response.histdata[1].datetime;
        time_03.data = response.histdata[2].datetime;
        time_04.data = response.histdata[3].datetime;
        time_05.data = response.histdata[4].datetime;       
        time_06.data = response.histdata[5].datetime;
        time_07.data = response.histdata[6].datetime;
        time_08.data = response.histdata[7].datetime;
        time_09.data = response.histdata[8].datetime;
        time_10.data = response.histdata[9].datetime;
        time_11.data = response.histdata[10].datetime;       
        time_12.data = response.histdata[11].datetime;
        trunkin01_01.data = parseInt(response.histdata[0].Value);
        trunkin01_02.data = parseInt(response.histdata[1].Value);
        trunkin01_03.data = parseInt(response.histdata[2].Value);
        trunkin01_04.data = parseInt(response.histdata[3].Value);
        trunkin01_05.data = parseInt(response.histdata[4].Value);
        trunkin01_06.data = parseInt(response.histdata[5].Value);
        trunkin01_07.data = parseInt(response.histdata[6].Value);
        trunkin01_08.data = parseInt(response.histdata[7].Value);
        trunkin01_09.data = parseInt(response.histdata[8].Value);
        trunkin01_10.data = parseInt(response.histdata[9].Value);
        trunkin01_11.data = parseInt(response.histdata[10].Value);
        trunkin01_12.data = parseInt(response.histdata[11].Value);
        return fetch("http://211.168.177.225/api/historicdata.json?id=2141&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======"); //trunk02의 센서 데이터를 받아온다
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/historicdata.json?id=2141&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======")
            	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })      
    .then((response) => {
    	trunkin02_01.data = parseInt(response.histdata[0].Value);
    	trunkin02_02.data = parseInt(response.histdata[1].Value);
    	trunkin02_03.data = parseInt(response.histdata[2].Value);
    	trunkin02_04.data = parseInt(response.histdata[3].Value);
    	trunkin02_05.data = parseInt(response.histdata[4].Value);
    	trunkin02_06.data = parseInt(response.histdata[5].Value);
    	trunkin02_07.data = parseInt(response.histdata[6].Value);
    	trunkin02_08.data = parseInt(response.histdata[7].Value);
    	trunkin02_09.data = parseInt(response.histdata[8].Value);
    	trunkin02_10.data = parseInt(response.histdata[9].Value);
    	trunkin02_11.data = parseInt(response.histdata[10].Value);
    	trunkin02_12.data = parseInt(response.histdata[11].Value);
        return fetch("http://211.168.177.225/api/historicdata.json?id=2152&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======"); //trunk01 outbound 데이터
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/historicdata.json?id=2152&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })            
    .then((response) => {
    	trunkout01_01.data = parseInt(response.histdata[0].Value);
    	trunkout01_02.data = parseInt(response.histdata[1].Value);
    	trunkout01_03.data = parseInt(response.histdata[2].Value);
    	trunkout01_04.data = parseInt(response.histdata[3].Value);
    	trunkout01_05.data = parseInt(response.histdata[4].Value);
    	trunkout01_06.data = parseInt(response.histdata[5].Value);
    	trunkout01_07.data = parseInt(response.histdata[6].Value);
    	trunkout01_08.data = parseInt(response.histdata[7].Value);
    	trunkout01_09.data = parseInt(response.histdata[8].Value);
    	trunkout01_10.data = parseInt(response.histdata[9].Value);
    	trunkout01_11.data = parseInt(response.histdata[10].Value);
    	trunkout01_12.data = parseInt(response.histdata[11].Value);
        return fetch("http://211.168.177.225/api/historicdata.json?id=2153&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======"); //trunk02 outbound 데이터
      })
    .then((response) => {
    	if(response.status != "200"){
        	do{
        		time.sleep(1);
        		fetch("http://211.168.177.225/api/historicdata.json?id=2153&avg=3600&sdate=" +s_timeStr+ "&edate=" +e_timeStr+"&usecaption=1&apitoken=GOHCPASGCQF2A57X5BGRSSNZVVKXETR2LJM3ZJMUBI======")
        	}while(response.status == "200");
    		return response.json();
    	}else{
    		return response.json();
    	}
    })   
    .then((response) => {
    	trunkout02_01.data = parseInt(response.histdata[0].Value);
    	trunkout02_02.data = parseInt(response.histdata[1].Value);
    	trunkout02_03.data = parseInt(response.histdata[2].Value);
    	trunkout02_04.data = parseInt(response.histdata[3].Value);
    	trunkout02_05.data = parseInt(response.histdata[4].Value);
    	trunkout02_06.data = parseInt(response.histdata[5].Value);
    	trunkout02_07.data = parseInt(response.histdata[6].Value);
    	trunkout02_08.data = parseInt(response.histdata[7].Value);
    	trunkout02_09.data = parseInt(response.histdata[8].Value);
    	trunkout02_10.data = parseInt(response.histdata[9].Value);
    	trunkout02_11.data = parseInt(response.histdata[10].Value);
    	trunkout02_12.data = parseInt(response.histdata[11].Value);
        return trunkout02_12; //trunk02 outbound 데이터
      })       
    .then(data => {
      const lastvalue_time_01 = document.createElement("div");
      const lastvalue_time_02 = document.createElement("div");
      const lastvalue_time_03 = document.createElement("div");
      const lastvalue_time_04 = document.createElement("div");
      const lastvalue_time_05 = document.createElement("div");    	
      const lastvalue_time_06 = document.createElement("div");
      const lastvalue_time_07 = document.createElement("div");
      const lastvalue_time_08 = document.createElement("div");
      const lastvalue_time_09 = document.createElement("div");
      const lastvalue_time_10 = document.createElement("div");
      const lastvalue_time_11 = document.createElement("div");    	
      const lastvalue_time_12 = document.createElement("div");
      const lastvalue_in_01 = document.createElement("div");
      const lastvalue_in_02 = document.createElement("div");
      const lastvalue_in_03 = document.createElement("div");
      const lastvalue_in_04 = document.createElement("div");
      const lastvalue_in_05 = document.createElement("div");
      const lastvalue_in_06 = document.createElement("div");
      const lastvalue_in_07 = document.createElement("div");
      const lastvalue_in_08 = document.createElement("div");
      const lastvalue_in_09 = document.createElement("div");
      const lastvalue_in_10 = document.createElement("div");
      const lastvalue_in_11 = document.createElement("div");
      const lastvalue_in_12 = document.createElement("div");
      const lastvalue_out_01 = document.createElement("div");
      const lastvalue_out_02 = document.createElement("div");
      const lastvalue_out_03 = document.createElement("div");
      const lastvalue_out_04 = document.createElement("div");
      const lastvalue_out_05 = document.createElement("div");
      const lastvalue_out_06 = document.createElement("div");
      const lastvalue_out_07 = document.createElement("div");
      const lastvalue_out_08 = document.createElement("div");
      const lastvalue_out_09 = document.createElement("div");
      const lastvalue_out_10 = document.createElement("div");
      const lastvalue_out_11 = document.createElement("div");
      const lastvalue_out_12 = document.createElement("div");
      const lastvalue_rate = document.createElement("div");
      lastvalue_time_01.textContent = time_01.data;      
      lastvalue_time_02.textContent = time_02.data;
      lastvalue_time_03.textContent = time_03.data;
      lastvalue_time_04.textContent = time_04.data;
      lastvalue_time_05.textContent = time_05.data;      
      lastvalue_time_06.textContent = time_06.data;
      lastvalue_time_07.textContent = time_07.data;      
      lastvalue_time_08.textContent = time_08.data;
      lastvalue_time_09.textContent = time_09.data;
      lastvalue_time_10.textContent = time_10.data;
      lastvalue_time_11.textContent = time_11.data;      
      lastvalue_time_12.textContent = time_12.data;
      lastvalue_in_01.textContent = trunkin01_01.data + trunkin02_01.data;      
      lastvalue_in_02.textContent = trunkin01_02.data + trunkin02_02.data;
      lastvalue_in_03.textContent = trunkin01_03.data + trunkin02_03.data;
      lastvalue_in_04.textContent = trunkin01_04.data + trunkin02_04.data;
      lastvalue_in_05.textContent = trunkin01_05.data + trunkin02_05.data;
      lastvalue_in_06.textContent = trunkin01_06.data + trunkin02_06.data;
      lastvalue_in_07.textContent = trunkin01_07.data + trunkin02_07.data;      
      lastvalue_in_08.textContent = trunkin01_08.data + trunkin02_08.data;
      lastvalue_in_09.textContent = trunkin01_09.data + trunkin02_09.data;
      lastvalue_in_10.textContent = trunkin01_10.data + trunkin02_10.data;
      lastvalue_in_11.textContent = trunkin01_11.data + trunkin02_11.data;
      lastvalue_in_12.textContent = trunkin01_12.data + trunkin02_12.data;
      lastvalue_out_01.textContent = trunkout01_01.data + trunkout02_01.data;
      lastvalue_out_02.textContent = trunkout01_02.data + trunkout02_02.data;
      lastvalue_out_03.textContent = trunkout01_03.data + trunkout02_03.data;
      lastvalue_out_04.textContent = trunkout01_04.data + trunkout02_04.data;
      lastvalue_out_05.textContent = trunkout01_05.data + trunkout02_05.data;
      lastvalue_out_06.textContent = trunkout01_06.data + trunkout02_06.data;
      lastvalue_out_07.textContent = trunkout01_07.data + trunkout02_07.data;
      lastvalue_out_08.textContent = trunkout01_08.data + trunkout02_08.data;
      lastvalue_out_09.textContent = trunkout01_09.data + trunkout02_09.data;
      lastvalue_out_10.textContent = trunkout01_10.data + trunkout02_10.data;
      lastvalue_out_11.textContent = trunkout01_11.data + trunkout02_11.data;
      lastvalue_out_12.textContent = trunkout01_12.data + trunkout02_12.data;

  	//Area Chart Example
  	var ctx_in = document.getElementById("myAreaChart");
	var ctx_out = document.getElementById("myAreaChart");
  	var Time_01 = lastvalue_time_01.textContent.slice(lastvalue_time_01.textContent.length-8, lastvalue_time_01.textContent.length);
  	var Time_02 = lastvalue_time_02.textContent.slice(lastvalue_time_02.textContent.length-8, lastvalue_time_02.textContent.length);
  	var Time_03 = lastvalue_time_03.textContent.slice(lastvalue_time_03.textContent.length-8, lastvalue_time_03.textContent.length);
  	var Time_04 = lastvalue_time_04.textContent.slice(lastvalue_time_04.textContent.length-8, lastvalue_time_04.textContent.length);
  	var Time_05 = lastvalue_time_05.textContent.slice(lastvalue_time_05.textContent.length-8, lastvalue_time_05.textContent.length);	
  	var Time_06 = lastvalue_time_06.textContent.slice(lastvalue_time_06.textContent.length-8, lastvalue_time_06.textContent.length);  
  	var Time_07 = lastvalue_time_07.textContent.slice(lastvalue_time_07.textContent.length-8, lastvalue_time_07.textContent.length);
  	var Time_08 = lastvalue_time_08.textContent.slice(lastvalue_time_08.textContent.length-8, lastvalue_time_08.textContent.length);
  	var Time_09 = lastvalue_time_09.textContent.slice(lastvalue_time_09.textContent.length-8, lastvalue_time_09.textContent.length);
  	var Time_10 = lastvalue_time_10.textContent.slice(lastvalue_time_10.textContent.length-8, lastvalue_time_10.textContent.length);
  	var Time_11 = lastvalue_time_11.textContent.slice(lastvalue_time_11.textContent.length-8, lastvalue_time_11.textContent.length);	
  	var Time_12 = lastvalue_time_12.textContent.slice(lastvalue_time_12.textContent.length-8, lastvalue_time_12.textContent.length);
  	var In_01 = lastvalue_in_01.textContent;
  	var In_02 = lastvalue_in_02.textContent;
  	var In_03 = lastvalue_in_03.textContent;
  	var In_04 = lastvalue_in_04.textContent;
  	var In_05 = lastvalue_in_05.textContent;
  	var In_06 = lastvalue_in_06.textContent;
  	var In_07 = lastvalue_in_07.textContent;
  	var In_08 = lastvalue_in_08.textContent;
  	var In_09 = lastvalue_in_09.textContent;
  	var In_10 = lastvalue_in_10.textContent;
  	var In_11 = lastvalue_in_11.textContent;
  	var In_12 = lastvalue_in_12.textContent;
  	var Out_01 = lastvalue_out_01.textContent;
  	var Out_02 = lastvalue_out_02.textContent;
  	var Out_03 = lastvalue_out_03.textContent;
  	var Out_04 = lastvalue_out_04.textContent;
  	var Out_05 = lastvalue_out_05.textContent;
  	var Out_06 = lastvalue_out_06.textContent;
  	var Out_07 = lastvalue_out_07.textContent;
  	var Out_08 = lastvalue_out_08.textContent;
  	var Out_09 = lastvalue_out_09.textContent;
  	var Out_10 = lastvalue_out_10.textContent;
  	var Out_11 = lastvalue_out_11.textContent;
  	var Out_12 = lastvalue_out_12.textContent;
  	var myLineChart = new Chart(ctx_in, {
  	  type: 'line',
  	  data: {
  	    labels: [Time_01, Time_02, Time_03, Time_04, Time_05, Time_06, Time_07, Time_08, Time_09, Time_10, Time_11, Time_12],
  	    datasets: [{
  	      label: "Inbond",
  	      lineTension: 0.3,
  	      backgroundColor: "rgba(78, 115, 223, 0.05)",
  	      borderColor: "rgba(78, 115, 223, 1)",
  	      pointRadius: 3,
  	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
  	      pointBorderColor: "rgba(78, 115, 223, 1)",
  	      pointHoverRadius: 3,
  	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
  	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
  	      pointHitRadius: 10,
  	      pointBorderWidth: 2,
  	      data: [In_01, In_02, In_03, In_04, In_05, In_06, In_07, In_08, In_09, In_10, In_11, In_12],
  	    },
  	  {
  	      label: "Oubond",
  	      lineTension: 0.3,
  	      backgroundColor: "rgba(198, 245, 223, 1)",
  	      borderColor: "rgba(102, 229, 168, 1)",
  	      pointRadius: 3,
  	      pointBackgroundColor: "rgba(102, 229, 168, 1)",
  	      pointBorderColor: "rgba(102, 229, 168, 1)",
  	      pointHoverRadius: 3,
  	      pointHoverBackgroundColor: "rgba(102, 229, 168, 1)",
  	      pointHoverBorderColor: "rgba(102, 229, 168, 1)",
  	      pointHitRadius: 10,
  	      pointBorderWidth: 2,
  	      data: [Out_01, Out_02, Out_03, Out_04, Out_05, Out_06, Out_07, Out_08, Out_09, Out_10, Out_11, Out_12],
  	    }],
  	  },
  	  options: {
  	    maintainAspectRatio: false,
  	    layout: {
  	      padding: {
  	        left: 10,
  	        right: 25,
  	        top: 25,
  	        bottom: 0
  	      }
  	    },
  	    scales: {
  	      xAxes: [{
  	        time: {
  	          unit: 'date'
  	        },
  	        gridLines: {
  	          display: false,
  	          drawBorder: false
  	        },
  	        ticks: {
  	          maxTicksLimit: 7
  	        }
  	      }],
  	      yAxes: [{
  	        ticks: {
  	          maxTicksLimit: 5,
  	          padding: 10,
  	          // Include a dollar sign in the ticks
  	          callback: function(value, index, values) {
  	            return number_format(value);
  	          }
  	        },
  	        gridLines: {
  	          color: "rgb(234, 236, 244)",
  	          zeroLineColor: "rgb(234, 236, 244)",
  	          drawBorder: false,
  	          borderDash: [2],
  	          zeroLineBorderDash: [2]
  	        }
  	      }],
  	    },
  	    legend: {
  	      display: false
  	    },
  	    tooltips: {
  	      backgroundColor: "rgb(255,255,255)",
  	      bodyFontColor: "#858796",
  	      titleMarginBottom: 10,
  	      titleFontColor: '#6e707e',
  	      titleFontSize: 14,
  	      borderColor: '#dddfeb',
  	      borderWidth: 1,
  	      xPadding: 15,
  	      yPadding: 15,
  	      displayColors: false,
  	      intersect: false,
  	      mode: 'index',
  	      caretPadding: 10,
  	      callbacks: {
  	        label: function(tooltipItem, chart) {
  	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
  	          return number_format(tooltipItem.yLabel);
  	        }
  	      }
  	    }
  	  }
  	});
  })
}
</script>
<script>
setTimeout(function(){
location.reload();
},10000); // 3000밀리초 = 3초
</script>
</body>
</html>

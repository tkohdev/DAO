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
      <a href="/DAO/jsp/first3.jsp" class="logo"><b><span>Coupang</span>Monitoring SYSTEM</b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" onClick="javascript:log_out();">Logout</a></li>
        </ul>
      </div>
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
 						<a href="/DAO/jsp/first3.jsp"><img src="/DAO/image/2000.png" class="logo" width="150"></a> 
 					</p> 
 					<div class="desc centered">DAOCORP_v1.0.1(H201001)</div> 
		 
 					<li class="mt"><a class="active" href="/DAO/jsp/first3.jsp"><i	class="fa fa-dashboard"></i><span>대시보드</span></a></li>
 					<li class="sub-menu"><a href="javascript:;"><i class="fa fa-tags"></i> <span>신규등록</span></a>
 						<ul class="sub">
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_TOTAL_SHARE_REGI_NEW_MAIN.jsp">회사등록</a></li>
	 		             	<li><a href="/DAO/jsp/BIZ_RS/OB/RSOB_REGI_SHAREHOLDER_MAIN.jsp">주주등록</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_STOCKHOLDER_REGI_NEW_MAIN.jsp">주권발행등록</a></li>
 						</ul>
 					</li>
 					<li class="sub-menu"><a href="javascript:;"><i class="fa fa-desktop"></i> <span>주식현황관리</span></a>
 						<ul class="sub">
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_TOTAL_SHARE_REGI_CHANGE_MAIN.jsp">주식변동등록</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_STOCKHOLDER_REGI_INCREASE_MAIN.jsp">증자 상세입력</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_STOCKHOLDER_REGI_REDUCE_MAIN.jsp">감자(소각) 상세입력</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_STOCKHOLDER_REGI_TRADE_MAIN.jsp">주식거래등록</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/RS/RSRS_STOCKHOLDER_STOCK_CHANGE_MAIN.jsp">발행주권 변경</a></li>
 						</ul>
 					</li>

 					<li class="sub-menu">
 						<a href="javascript:;">
 							<i class="fa fa-bar-chart-o"></i>
 								<span>현황조회</span>
 						</a>
                                        <%--최고권한(다오직원) 및 관리업체 조회용 현황--%>
			
 						<ul class="sub">
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_STOCKHOLDER_MAIN.jsp">주주현황</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_SUMMARY_MAIN.jsp">주식변동현황</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_TRADE_MAIN.jsp">주식거래현황</a></li>
 						</ul>
 					</li>
                                        <%--주주 조회용 현황(본인소속 회사내용만 조회--%>

 						<ul class="sub">
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_INDIVIDUAL_STOCKHOLDER_MAIN.jsp">주주현황</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_INDIVIDUAL_SUMMARY_MAIN.jsp">주식변동현황</a></li>
 							<li><a href="/DAO/jsp/BIZ_RS/ST/RSST_STATISTICS_INDIVIDUAL_TRADE_MAIN.jsp">주식거래현황</a></li>
 						</ul>
 					</li>
                                <%--최고권한(다오직원) 업체 등록화면--%>

                     <li class="sub-menu">
                      <a href="javascript:;">
                       <i class="fa fa-edit"></i>
                        <span>관리자(DAO)</span>
                      </a>
                       <ul class="sub">
 		             	<li><a href="/DAO/jsp/first.jsp" target="_blank">관리자 메뉴</a></li>
                       </ul>
                     </li>

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


<h1>Authors</h1>
<ul id="authors"></ul>

    <div id="userInfo"></div>
    <script>
    fetch("http://10.0.246.138/api/getsensordetails.json?id=2140&apitoken=E3FLTLRGVACPA6MKEHEUOLBL2HB42O6KO2CTFDGGCQ======")
    .then(response => response.json())
.then(data => {
const lastvalue = document.createElement("div");
lastvalue.textContent = data.sensordata.lastvalue;
const userInfo = document.getElementById("userInfo");
userInfo.appendChild(lastvalue);
})
    </script>
      
        <div class="row">



       
       <div class="container-fluid" >
            <div class="row">
                <div class="col-xs-3">.col-xs-3</div>
                <div class="col-xs-3">.col-xs-3</div>
                <div class="col-xs-3">.col-xs-3</div>
                <div class="col-xs-3">.col-xs-3</div>
            </div>
            <div class="row">
                <div class="col-sm-3">.col-sm-3</div>
                <div class="col-sm-3">.col-sm-3</div>
                <div class="col-sm-3">.col-sm-3</div>
                <div class="col-sm-3">.col-sm-3</div>
            </div>
            <div class="row">
                <div class="col-md-3">.col-md-3</div>
                <div class="col-md-3">.col-md-3</div>
                <div class="col-md-3">.col-md-3</div>
                <div class="col-md-3">.col-md-3</div>
            </div>
            <div class="row">
                <div class="col-lg-3">.col-lg-3</div>
                <div class="col-lg-3">.col-lg-3</div>
                <div class="col-lg-3">.col-lg-3</div>
                <div class="col-lg-3">.col-lg-3</div>
            </div>
        </div>
        
          <div class="col-lg-12 main-chart">
          
          
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>무슨무슨월별현황</h3>
            </div>
            <div>
                      <object data="http://10.0.246.138/public/mapshow.htm?id=2139&mapid=A03979E2-83B1-405A-B86E-24AFEA73E0E1"
width="420"
height="290"
type="text/html" sandbox="allow-same-origin">
</object>
            </div>
            
            <div class="border-head">
              <h3>무슨무슨월별현황</h3>
            </div>
                      <object data="http://10.0.246.138/public/mapshow.htm?id=2139&mapid=A03979E2-83B1-405A-B86E-24AFEA73E0E1"
width="420"
height="290"
type="text/html" sandbox="allow-same-origin">
</object>
            <!--custom chart end-->
            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div>
            <div class="border-head">
              <h3>무슨무슨월별현황</h3>
            </div>
<object data="http://10.0.246.138/public/mapshow.htm?id=2139&mapid=A03979E2-83B1-405A-B86E-24AFEA73E0E1"
width="420"
height="290"
type="text/html" sandbox="allow-same-origin">
</object>


                </div>
                <!-- /grey-panel -->
              </div>
                            <div class="col-md-4 col-sm-4 mb">
                <div>
            <div class="border-head">
              <h3>무슨무슨월별현황</h3>
            </div>
<object data="http://10.0.246.138/public/mapshow.htm?id=2139&mapid=A03979E2-83B1-405A-B86E-24AFEA73E0E1"
width="420"
height="290"
type="text/html" sandbox="allow-same-origin">
</object>


                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div>
                  <div class="darkblue-header">
                    <h5>무슨대비 무슨현황</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#1c9ca7"
                      },
                      {
                        value: 40,
                        color: "#f68275"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p>April 17, 2020</p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                    </div>
                    <div class="pull-right">
                      <h5>60%</h5>
                    </div>
                  </footer>
                </div>
                <!--  /darkblue panel -->
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <!-- REVENUE PANEL -->
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>월별 무슨현황</h5>
                  </div>
                  <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                  </div>
                  <p class="mt"><b>$ 17,980</b><br/>Month Income</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>LIKY8199</strong>. All Rights Reserved
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
  <script type="text/javascript">
/*  
    $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: '에이치씨인포 사업관리시스템',
        // (string | mandatory) the text inside the notification
        text: '에이씨인포 사업관리시스템에 오신걸 환영합니다.',
        // (string | optional) the image to display on the left
        //image: '/DAO1/image/DAO_logo.gif',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
*/    
  </script>

</body>
</html>

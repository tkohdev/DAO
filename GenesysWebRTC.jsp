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
      'dca': {
        // clientId: '2c75d833-922b-4324-9d0e-6c20b9c714b2', // created in valve-telphony org, dca
        clientId: 'a730b7e3-1b93-4089-a2f6-3624af1a9a2e',
        uri: 'mypurecloud.jp'
      },
      'pca-us': {
        clientId: '0a6928df-e16d-49ea-a4d8-9dad6b450a1b', // created in torontohackathon org
        uri: 'mypurecloud.jp'
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
  <div class="app-header">
    <div class="title">GenesysCoud WebRTC SDK Sample</div>
    <div class="subtitle">Choose and environment to authenticate with, then click 'Start App' to initialize the SDK
    </div>
  </div>

  <div>
    <div>
      <label for="environment">Select Environment:</label>
      <select id="environment" name="environment">
        <option value="dca">dca</option>
        <option value="pca-us">pca-us</option>
      </select>
    </div>

    <div class="m-2">
      <form id="manual-form">
        <div class="form-group">
          <button class="btn btn-sm btn-secondary" id="auth-button" type="button">Use Implicit Auth</button>
          <span>or</span>
        </div>
        <div class="form-group d-flex">
          <button class="btn btn-sm btn-secondary mr-2" type="submit">Use manual auth token</button>
          <input style="width: 400px" class="form-control" id="manual-auth" placeholder="Use custom access token">
        </div>
        <div class="form-group">
          <button id="auth-logout" type="button" class="btn btn-danger btn-sm">Sign out</button>
        </div>
      </form>
    </div>
    <button id="start-app-button" type="button" class="btn btn-success">Start App</button>
    <button id="start-app-button-with-default-audio" type="button" class="btn btn-info">Start App w/ Default
      Audio</button>

    <div class="acd-screen-share">
      <div>
        <label for="screenshare-environment">Select Environment:</label>
        <select id="screenshare-environment" name="environment">
          <option value="dca">dca</option>
          <option value="pca-us">pca-us</option>
        </select>
      </div>
      <label>Orginization Id:</label>
      <input id="org-id" placeholder="Orginization Id">
      <label>Security code:</label>
      <input id="security-key" placeholder="Security code">
    </div>
    <button id="start-app-no-auth-button" type="button" class="btn btn-success">Start App Without Auth (ACD Screen
      Share)</button>
  </div>
  <div id="auth-text" class="auth-text">Authenticated</div>
  <div id="init-text" class="init-text">Initializing SDK...</div>

  <div id="app-content" class="app-content">
    <div class="top">
      <div id="app-controls" class="app-controls">
        <h4>User Info</h4>
        <div id="user-element">
        </div>
        <hr>

        <h2>Softphone</h2>
        <h5>Misc. Controls</h5>
        <div class="control-section">
          <button id="on-queue" type="button" class="btn btn-info">Go On Queue</button>
          <button id="off-queue" type="button" class="btn btn-warning">Go Off Queue</button>
        </div>
        <!-- outbound call -->
        <h5>Outbound phone call</h5>
        <div class="control-section">
          <label>Enter phone number:</label>
          <input id="outbound-phone-number" type="text" class="text-input">
          <div>
            <button type="button" class="btn btn-success" id="outbound-call-start">Start Call</button>
            <!-- <button type="button" class="btn btn-danger" id="outbound-call-end">End Call</button> -->
          </div>
        </div>

        <!-- inbound call -->
        <!-- <h5>Inbound phone call</h5>
        <div class="control-section">
          <button type="button" class="btn btn-success btn-sm" id="answer-inbound-call">Answer</button>
          <button type="button" class="btn btn-danger" id="inbound-call-end">End Call</button>
        </div> -->

        <h5>User's Station</h5>
        <div id="stations-element">
        </div>
        <hr>

        <h5>Active Sessions</h5>
        <div id="sessions-element">
          <!-- table get dynamically rendered -->
        </div>
        <hr>
        <h5>Pending Sessions</h5>
        <div id="pending-sessions">
          <!-- table get dynamically rendered -->
        </div>

        <hr>
        <!-- audio volume -->
        <h5>Audio Volume</h5>
        <div class="control-section">
          <input id="volume-input" type="text" class="text-input">
        </div>

        <!-- video -->
        <hr>
        <h2>Video</h2>
        <h5>Video conference</h5>
        <div class="control-section">
          <div>
            <label>Enter room jid:</label>
            <input id="video-jid" type="text" class="text-input" value="">
          </div>
          <div>
            <label>User jid to invite:</label>
            <input id="invitee-jid" type="text" class="text-input" value="">
          </div>
          <div>
            <div>
              <label>(Optional) Video Resolution</label>
              <a href="https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints">See height and width</a>
            </div>
            <textarea id="media-constraints" style="height: 100px;width: 200px;resize: both;">
{
  "width": { "ideal": 4096 },
  "height": { "ideal": 2160 }
}
            </textarea>
          </div>

          <div>
            <h4>Other User(s)</h4>
            <div id="waiting-for-media" class="hidden">Waiting for incoming media</div>
            <audio id="vid-audio"></audio>
            <video id="vid-video"></video>
          </div>
          <div>
            <h4>Self-view</h4>
            <video id="vanity-view"></video>
            <div id="select-video-resolution" class="hidden" style="margin-top: 10px">
              <label>Video Resolution</label>
              <select name="videoResolutions" id="video-resolutions" class="d-inline">
                <option selected value="default">Default</option>
                <option value="480p">480p</option>
                <option value="720p">720p</option>
                <option value="1080p">1080p</option>
                <option value="2K">2K</option>
                <option value="4K">4K</option>
                <option value="" disabled style="display: none;" id="unique-resolution"></option>
              </select>
              <button id="update-video-resolution" class="d-inline btn btn-info btn-sm">Update Video Resolution</button>
            </div>
          </div>

          <div>
            <div class="start-controls">
              <button type="button" class="btn btn-success" id="video-start">Start</button>
              <button type="button" class="btn btn-info btn-sm" id="video-start-constraints">Start With Custom
                Resolution</button>
              <button type="button" class="btn btn-info btn-sm" id="video-start-no-video">Start - No Video</button>
              <button type="button" class="btn btn-info btn-sm" id="video-start-no-audio">Start - No Audio</button>
              <button type="button" class="btn btn-info btn-sm" id="video-start-no-audio-video">Start - No
                Audio/Video</button>
            </div>
            <div class="start-controls">
              <button type="button" class="btn btn-success" id="video-answer">Answer</button>
              <button type="button" class="btn btn-info btn-sm" id="video-answer-constraints">Answer With Custom
                Resolution</button>
              <button type="button" class="btn btn-info btn-sm" id="video-answer-no-video">Answer - No Video</button>
              <button type="button" class="btn btn-info btn-sm" id="video-answer-no-audio">Answer - No Audio</button>
              <button type="button" class="btn btn-info btn-sm" id="video-answer-no-audio-video">Answer - No
                Audio/Video</button>
            </div>

            <div id="video-actions" class="hidden">
              <div id="video-controls">
                <div class="d-flex flex-column p-1">
                  <span>Screen share</span>
                  <button type="button" class="btn btn-primary btn-sm mb-1" id="start-screen-share">Start screen
                    share</button>
                  <button type="button" class="btn btn-primary btn-sm" id="stop-screen-share">Stop screen share</button>
                </div>
                <div class="d-flex flex-column p-1">
                  <span>Mic</span>
                  <button type="button" class="btn btn-primary btn-sm mb-1" id="audio-mute">Mute mic</button>
                  <button type="button" class="btn btn-primary btn-sm" id="audio-unmute">Unmute mic</button>
                </div>
                <div class="d-flex flex-column p-1">
                  <span>Camera</span>
                  <button type="button" class="btn btn-primary btn-sm mb-1" id="video-mute">Mute camera</button>
                  <button type="button" class="btn btn-primary btn-sm" id="video-unmute">Unmute camera</button>
                </div>
                <div class="d-flex flex-column p-1">
                  <span>End</span>
                  <button type="button" class="h-100 btn btn-danger" id="video-end">End Call</button>
                </div>
              </div>
              <div>
                <label>Participant to pin (empty to unpin)</label>
                <input id="participant-pin" type="text" class="text-input" value="">
                <button type="button" class="btn btn-primary" id="participant-pin-btn">Pin/Unpin</button>
              </div>
            </div>
          </div>
        </div>

        <!-- Disconnect -->
        <div><a class="control-link" href="#" id="disconnect-sdk">Disconnect</a></div>
        <div><a class="control-link" href="#" id="destroy-sdk">Destroy Sdk</a></div>

        <!-- devices -->
        <h5 id="media-devices-header" class="clickable">Media Devices <span class="fs-med">(toggle)</span></h5>
        <div class="control-section" id="media-devices">
          <h6>Permissions/Devices</h6>
          <div class="d-flex d-row m-1">
            <button id="request-mic-permissions" class="mx-2 d-inline btn btn-primary btn-sm">
              Request Mic Permissions
            </button>
            <button id="request-camera-permissions" class="mx-2 d-inline btn btn-primary btn-sm">
              Request Camera Permissions
            </button>
            <button id="request-both-permissions" class="mx-2 d-inline btn btn-primary btn-sm">
              Request All Permissions
            </button>
            <button id="enumerate-devices" class="mx-2 d-inline btn btn-info btn-sm">
              Enumerate Devices
            </button>
          </div>
          <hr>

          <!-- audio -->
          <label for="audio-devices" class="d-block">Mic Device</label>
          <select name="audioDevices" id="audio-devices" class="d-inline"></select>
          <button id="update-audio-media" class="d-inline btn btn-info btn-sm">Update Mic Device</button>

          <div>
            <label class="d-block">Headset Vendor: <span id="headset-vendor">none</span></label>
            <label class="d-block">Headset Connection: <span id="headset-connection">noVendor</span></label>
            <button id="webhid-permissions-btn" class="d-none btn btn-info btn-sm">Allow Webhid Permissions</button>
          </div>

          <br>

          <!-- video -->
          <label for="video-devices" class="d-block">Video Device</label>
          <select name="videoDevices" id="video-devices" class="d-inline mb-1"></select>
          <button id="update-video-media" class="d-inline btn btn-info btn-sm">Update Video Device</button>
          <br>
          <button id="update-outgoing-media" class="my-2 d-inline btn btn-primary btn-sm">Update Outgoing Media</button>
          <hr>

          <!-- output -->
          <label for="output-devices">Output Device</label>
          <br>
          <select name="outputDevices" id="output-devices" class="d-block mb-1"></select>
          <button id="update-output-media" class="btn btn-primary btn-sm">Update Output Media</button>
          <hr>

          <!-- mic volume -->
          <h6>Current Mic Volume</h6>
          <div class="pids-wrapper">
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
            <div class="pid"></div>
          </div>
          <hr>
          <h6>Set Default Devices</h6>

          <div class="d-flex flex-row m-1">
            <div class="d-flex flex-column mx-3">
              <div>Defaults to Update</div>
              <div>
                <input type="checkbox" name="videoDeviceCheckbox" id="video-device-check-box" checked>
                <label for="video-device-check-box">Video</label>
              </div>
              <div>
                <input type="checkbox" name="audioDeviceCheckbox" id="audio-device-check-box" checked>
                <label for="audio-device-check-box">Audio</label>
              </div>
              <div>
                <input type="checkbox" name="outputDeviceCheckbox" id="output-device-check-box" checked>
                <label for="output-device-check-box">Output</label>
              </div>
            </div>

            <div>
              <div>Update active sessions</div>
              <input type="radio" name="updateActiveSessionsWithDefault" id="update-active-sessions-with-default-yes"
                value="true" checked>
              <label class="mr-2" for="update-active-sessions-with-default-yes">Yes</label>
              <input type="radio" name="updateActiveSessionsWithDefault" id="update-active-sessions-with-default-no"
                value="false">
              <label for="update-active-sessions-with-default-no">No</label>
            </div>
          </div>
          <button type="button" class="btn btn-primary btn-sm" id="update-defaults">Set Defaults</button>

        </div>
        <!-- media state log -->
        <h5 id="media-state-header" class="clickable">Media State <span class="fs-med">(toggle)</span></h5>
        <div id="media-state" class="d-none">
          <div class="d-flex d-row">
            <button type="button" id="get-current-media-state" class="m-2 d-inline btn btn-info btn-sm">
              Get Current Media State
            </button>
            <button type="button" id="clear-media-state-log" class="m-2 d-inline btn btn-warning btn-sm">
              Clear Media State Log
            </button>
          </div>

          <div class="log-output">
            <textarea id="media-state-log-data" class="log-data" readonly="true"></textarea>
          </div>
        </div>
      </div>

      <!-- log -->
      <div class="log-output">
        <div class="log-header">
          <h5 class="clickable mr-3" id="log-header">Log: <span class="fs-med">(toggle)</span></h5>
          <span>
            <input name="log-traces-check" type="checkbox" id="log-traces-check" />
            <label for="log-traces-check">Log trace events</label>
          </span>
        </div>
        <div id="log-body">
          <textarea id="log-data" class="log-data" readonly="true"></textarea>
          <button type="button" id="clear-log">Clear Log</button>
        </div>
      </div>
    </div>
  </div>      
<%-- 
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
--%>                
                
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

<script type="text/javascript">
  // Obtain a reference to the platformClient object
  const platformClient = require('platformClient');
</script>
<script>
function GetAuthLogin(){
//	const client = platformClient.ApiClient.instance;
//	client.setAccessToken('Ls9XcUasiNxLvLnVQximg5MKOfNhAFq5LCTbTdCtOKe09fyCf8c6lop5QrG18ubvkF0XaQf-JZz6uOr5e0vTUQ');
//	console.log(`1111`);
	
//	const platformClient = require("purecloud-platform-client-v2");

	const client = platformClient.ApiClient.instance;
	client.setEnvironment(platformClient.PureCloudRegionHosts.ap_northeast_2); // Genesys Cloud region

	// Manually set auth token or use loginImplicitGrant(...) or loginClientCredentialsGrant(...)
	client.setAccessToken("8PVCiqg1hXEj1cm6tSYxgIymttGnZOrWe__yv1El0UczRTzZlNUedDUbwjOxy8hF2nnYv1A7OuvUgPVWfKMVlw");

	let apiInstance = new platformClient.ConversationsApi();

	let date = new Date();

	let firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
	let lastDay = new Date(date.getFullYear(), date.getMonth()+1, 1);
	let interval = firstDay.toISOString() + "/" + lastDay.toISOString(); // present 1 month interval(UTC)
	console.log("Interval", interval);

	const SS = "eadb7c70-c985-430f-93f3-4de42b6a7de8"; // SS ID
	const SSC = "8e77a7db-213a-4004-80c3-203814aac062"; // SSC ID
	const CHAT = "dfcaac5c-c080-428e-844e-2d81aea7c442"; // Genesys_Chat ID


	let body = {
	 "interval": interval,
	 "order": "asc",
	 "orderBy": "conversationStart",
	 "paging": {
	  "pageSize": "20", // number of conversations
	  "pageNumber": 1
	 },
	 "segmentFilters": [
	  {
	   "type": "and",
	   "predicates": [
	    {
	     "type": "dimension",
	     "dimension": "mediaType",
	     "operator": "matches",
	     "value": "callback"
	    },
	    {
	     "type": "dimension",
	     "dimension": "queueId",
	     "operator": "matches",
	     "value": SSC// SSC ID
	    }
	   ]
	  }
	 ],
	 "conversationFilters": [
	  {
	   "type": "and",
	   "predicates": [
	    {
	     "type": "dimension",
	     "dimension": "conversationEnd",
	     "operator": "notExists",
	     "value": null
	    }
	   ]
	  }
	 ]
	}; // query body


	function Disconnect(conversationId, timeDiffHour){
	  if(timeDiffHour < 0.5) {
	    return;
	  } 
	  //Disconnet API
	  apiInstance.postConversationDisconnect(conversationId)
	  .then((data) => {
	    console.log(`postConversationDisconnect success!`,conversationId);
	  })
	  .catch((err) => {
	    console.log("There was a failure calling postConversationDisconnect", conversationId);
	    console.error(err);
	  });
	}


	function ConversationDetailQuery(){
	  // Query for conversation details API
	  apiInstance.postAnalyticsConversationsDetailsQuery(body)
	    .then((data) => {
	      console.log("total conversation length: "+data.conversations.length);
	      
	      //conversations array
	      data.conversations.forEach(function(obj,idx){
	        
	        let convStart = new Date(obj.conversationStart);
	        let timeDiff = new Date().getTime() - convStart.getTime();
	        let timeDiffHour = (timeDiff / (1000 * 60 * 60 )); // conversation duration per Hour
	        console.log("conversationId : "+obj.conversationId+" /// conversation duration(Hour): "+timeDiffHour);
	        
	        if(timeDiffHour > 2.5){ // If conversation duration > 2.5 Hour
	          //Disconnect Right now
	          //Disconnect(obj.conversationId, timeDiffHour); 
	          
	          //Disconnect per 1000 millisecond
	          setTimeout(async function(){await Disconnect(obj.conversationId, timeDiffHour)}, idx*1000+500);
	        }
	      });
	    })
	    .catch((err) => {
	      console.log("There was a failure calling postAnalyticsConversationsDetailsQuery");
	      console.error(err);
	    });
	}



	ConversationDetailQuery();
}
</script>
<!-- 
<script>
function GetAuthLogin(){

	const platformClient = require('purecloud-platform-client-v2');
	const client = platformClient.ApiClient.instance;

	const CLIENT_ID = 0a6928df-e16d-49ea-a4d8-9dad6b450a1b;
	const CLIENT_SECRET = mSJ1B8svDAl4mR55Kx4IdaLadmFdCzvvfCzDmSXvjJY;

	let organizationApi = new platformClient.OrganizationApi();

	// Authenticate with Genesys Cloud
	client.loginClientCredentialsGrant(CLIENT_ID, CLIENT_SECRET)
	.then(() => {
	organizationApi.getOrganizationsMe()
	  .then((data) => {
	    console.log(`getOrganizationsMe success! data: ${JSON.stringify(data, null, 2)}`);
	  })
	  .catch((err) => {
	    console.log('There was a failure calling getOrganizationsMe');
	    console.error(err);
	  });
	})	
</script>
 -->


<script>
/*
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
*/
</script>
<script>
/*
setTimeout(function(){
location.reload();
},10000); // 3000밀리초 = 3초
*/
</script>
</body>
</html>

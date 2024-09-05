<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="java.net.URL"%>
<%@ page import="com.uto.util.*"%>  
<%@ page import="com.uto.pool.*"%>

<!-- URL url = new URL("https://www.google.com"); -->

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

 
	<title>자동차 찾기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">	
	<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<!-- link href="../plugin/select2/dist/css/select2.css" rel="stylesheet"/ -->
  <!-- script src="../plugin/select2/dist/js/select2.js"></script-->
	
	<script language=javascript>
		
		$(function(){
			//setCardateAndCaryear("20230828",$('#caryear').val());
			
			$('#caryear').change(function(){
				setCardateAndCaryear("20230828",$('#caryear').val());
			});
		});

		function CompanyChange()
		{	
			document.NewAccount.CarName.value = null;
			document.NewAccount.CarYear.value =null;
			document.NewAccount.submit();
		}
		function CarNameChange()
		{
			document.NewAccount.CarYear.value = null;
			document.NewAccount.submit();
		}
		function Next()
		{
			document.SetInfo.CarCompany.value = document.NewAccount.CarCompany.value;
			document.SetInfo.CarName.value    = document.NewAccount.CarName.value;
			document.SetInfo.CarYear.value    = document.NewAccount.CarYear.value;

			let check = /^[0-9]+$/; 
			var cardate = document.NewAccount.cardate.value;
			if (!check.test(cardate) || cardate.length != 8) {
    		alert("차량등록일은 숫자 8자리만 입력 가능합니다.");
    		document.NewAccount.cardate.value = '';
			}else{
				document.SetInfo.cardate.value    = cardate;
				document.SetInfo.submit();			
			}
		} 
		
		// ndate : YYYYMMDD  / month 몇개월전
		function prevMonth(ndate,month) {
		   var dateString = ndate.substr(0,4) + '-' +ndate.substr(4,2) + '-' + ndate.substr(6,2);
			 var d = new Date(dateString);
		   d.setMonth(d.getMonth()-month);
		   return d.getFullYear() + "" + ( (d.getMonth()+1) < 9 ? "0" + (d.getMonth()+1) : (d.getMonth()+1) ) + ""+ ( (d.getDate()) < 9 ? "0" + (d.getDate()) : (d.getDate()) );
		}
		
		function setCardateAndCaryear(fdate,caryear){

			var d = new Date();
			var fdateVal = fdate;
			var caryearVal = '';
			var caryearGubun = '';

			caryearVal = caryear.substring(0,4);
			if(caryear.length == 5)		caryearGubun = caryear.substr(-1);

			// A,B 구분이 있을 경우 
			if(caryearGubun != ''){
				// 개시일과 차량연식이 같은 경우(3,4분기)
				if(fdateVal.substring(0,4) == caryearVal){
					if(caryearGubun == 'A')					document.getElementById("cardate").value = fdateVal
					else if(caryearGubun == 'B')		document.getElementById("cardate").value = fdateVal.substring(0,4)+""+"0101";
				// 개시일과 차량연식이 다른 경우	(1,2분기)
				}else if(fdateVal.substring(0,4)-1 == caryearVal){
					if(caryearGubun == 'A')					document.getElementById("cardate").value = prevMonth(fdateVal,6);
					else if(caryearGubun == 'B')		document.getElementById("cardate").value = caryearVal + fdateVal.substring(4,8);
				}
			}else{
				document.getElementById("cardate").value = caryearVal + fdateVal.substring(4,8);
			}
		}
		
	</script>  
    
</head>

<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 bgcolor="#FFFFFF">

<form name="NewAccount" method=post>
<input type="hidden" name="turl" value="www.myga.co.kr/common/">

<div id="contents">
<table width="100%">
	<tr>
		<td height="35" bgcolor="#1e96e6">
		<font color="White" size="4px">&nbsp;<b>차량선택</b></font></td>
	</tr>
</table>
	
<!-----------내용 삽입하기 시작----------->
<table width="98%" class="pop_left_right" style="margin:auto;">
    <tr> 
     <td class="pop_left_td"  width="80">제조회사 </td>
     <td class="pop_right_td">  	
		<select name="CarCompany" id="carcompany" size="1" onChange = "CompanyChange()">	
		<option value="전체">전체</option>"	
<option value='기아'>기아</option><option value='대우'>대우</option><option value='삼성'>삼성</option><option value='쌍용'>쌍용</option><option value='쎄미시스코'>쎄미시스코</option><option value='쎄보'>쎄보</option><option value='아시아'>아시아</option><option value='현대'>현대</option><option value='KST'>KST</option>
		</select>				
    </td>
  	</tr>
  	<tr>
    <td class="pop_left_td" width="60">차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 </td>
    <td class="pop_right_td"> 
		<select name="CarName" id="carname" size="1"  onChange = "CarNameChange()">
				
<option value='갤로퍼' selected>갤로퍼</option><option value='그랜져'>그랜져</option><option value='그레이스　　　　　　'>그레이스　　　　　　</option><option value='넥시아'>넥시아</option><option value='넥쏘'>넥쏘</option><option value='누비라'>누비라</option><option value='다이너스티'>다이너스티</option><option value='델타'>델타</option><option value='라노스'>라노스</option><option value='라비타'>라비타</option><option value='라세티'>라세티</option><option value='레간자'>레간자</option><option value='레조'>레조</option><option value='레토나'>레토나</option><option value='렉스턴'>렉스턴</option><option value='로디우스'>로디우스</option><option value='로체'>로체</option><option value='록스타'>록스타</option><option value='르망'>르망</option><option value='리갈'>리갈</option><option value='리오'>리오</option><option value='마르샤'>마르샤</option><option value='마이브'>마이브</option><option value='마티즈'>마티즈</option><option value='말리부'>말리부</option><option value='매그너스'>매그너스</option><option value='맥스크루즈'>맥스크루즈</option><option value='모닝'>모닝</option><option value='모하비'>모하비</option><option value='무쏘'>무쏘</option><option value='베뉴'>베뉴</option><option value='베라크루즈'>베라크루즈</option><option value='베르나'>베르나</option><option value='베스타　　　　　　　'>베스타　　　　　　　</option><option value='벨로스터'>벨로스터</option><option value='브로엄'>브로엄</option><option value='비스토'>비스토</option><option value='세이블'>세이블</option><option value='세피아'>세피아</option><option value='셀토스'>셀토스</option><option value='슈마'>슈마</option><option value='스마트EV'>스마트EV</option><option value='스쿠프'>스쿠프</option><option value='스타렉스'>스타렉스</option><option value='스타리아'>스타리아</option><option value='스테이츠맨'>스테이츠맨</option><option value='스텔라'>스텔라</option><option value='스토닉'>스토닉</option><option value='스팅어'>스팅어</option><option value='스파크'>스파크</option><option value='스펙트라'>스펙트라</option><option value='스포티지'>스포티지</option><option value='싼타모'>싼타모</option><option value='싼타페'>싼타페</option><option value='쎄라토'>쎄라토</option><option value='쎄보'>쎄보</option><option value='쏘나타'>쏘나타</option><option value='쏘렌토'>쏘렌토</option><option value='쏘울'>쏘울</option><option value='씨에로　　　　　　　'>씨에로　　　　　　　</option><option value='아반떼'>아반떼</option><option value='아베오'>아베오</option><option value='아벨라'>아벨라</option><option value='아슬란'>아슬란</option><option value='아이오닉'>아이오닉</option><option value='아카디아'>아카디아</option><option value='아토스'>아토스</option><option value='알페온'>알페온</option><option value='에스페로'>에스페로</option><option value='에쿠스'>에쿠스</option><option value='엑센트'>엑센트</option><option value='엑셀'>엑셀</option><option value='엑티언'>엑티언</option><option value='엔터프라이즈'>엔터프라이즈</option><option value='엘란'>엘란</option><option value='엘란트라'>엘란트라</option><option value='오피러스'>오피러스</option><option value='올란도'>올란도</option><option value='옵티마'>옵티마</option><option value='윈스톰'>윈스톰</option><option value='이스타나'>이스타나</option><option value='임페리얼'>임페리얼</option><option value='제네시스'>제네시스</option><option value='제네시스 (2세대)'>제네시스 (2세대)</option><option value='젠트라'>젠트라</option><option value='체어맨'>체어맨</option><option value='카니발'>카니발</option><option value='카렌스'>카렌스</option><option value='카리스타'>카리스타</option><option value='카스타'>카스타</option><option value='카이런'>카이런</option><option value='칼로스'>칼로스</option><option value='캐스퍼'>캐스퍼</option><option value='캐피탈'>캐피탈</option><option value='캡티바'>캡티바</option><option value='코나'>코나</option><option value='코란도'>코란도</option><option value='콩코드'>콩코드</option><option value='크레도스'>크레도스</option><option value='크루즈'>크루즈</option><option value='클릭'>클릭</option><option value='테라칸'>테라칸</option><option value='토레스'>토레스</option><option value='토스카'>토스카</option><option value='투스카니'>투스카니</option><option value='투싼'>투싼</option><option value='트라제'>트라제</option><option value='트랙스'>트랙스</option><option value='트레일블레이저'>트레일블레이저</option><option value='티볼리'>티볼리</option><option value='티뷰론'>티뷰론</option><option value='티코'>티코</option><option value='파크타운'>파크타운</option><option value='팰리세이드'>팰리세이드</option><option value='포르테'>포르테</option><option value='포텐샤'>포텐샤</option><option value='프라이드'>프라이드</option><option value='프레지오'>프레지오</option><option value='프린스'>프린스</option><option value='EV6'>EV6</option><option value='EV9'>EV9</option><option value='i30'>i30</option><option value='i40'>i40</option><option value='K3'>K3</option><option value='K5'>K5</option><option value='K7'>K7</option><option value='K8'>K8</option><option value='K9'>K9</option><option value='NIRO'>NIRO</option><option value='NIRO(니로)'>NIRO(니로)</option><option value='QM5'>QM5</option><option value='QM6'>QM6</option><option value='RAY'>RAY</option><option value='SM3'>SM3</option><option value='SM5'>SM5</option><option value='SM6'>SM6</option><option value='SM7'>SM7</option><option value='XM3'>XM3</option><option value='X-TREK'>X-TREK</option>
		</select>	
				
      </td>
    </tr>

    <tr> 
      <td class="pop_left_td"  width="60">연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;식</td>
      <td class="pop_right_td"> 
		<select name="CarYear" id="caryear" size="1">
<option value='2004'>2004</option><option value='2003'>2003</option><option value='2002'>2002</option><option value='2001'>2001</option><option value='2000'>2000</option><option value='1999'>1999</option><option value='1998'>1998</option><option value='1997'>1997</option><option value='1996'>1996</option><option value='1995'>1995</option><option value='1994'>1994</option><option value='1993'>1993</option><option value='1992'>1992</option>
				</select>
	    </td>
    </tr>
    <tr> 
      <td class="pop_left_td"  width="60">차량등록일</td>
      <td class="pop_right_td"> 
      	<input type="text" name="cardate" id="cardate" placeholder="YYYYMMDD" value="" style="ime-mode:active;width:95%;border:1px solid #dcdcdc;height:25px;padding-left:14px;" maxlength="8">
      </td>
    </tr>    
  </table>
  <p style="margin:3px;color:red;">** 차량등록일은 보험개시일과 선택한 차량연식 기준으로 자동세팅합니다.</p>
  <p style="margin:3px;color:red;">&nbsp;&nbsp;&nbsp;자동세팅되는 날짜와 다른경우 수동으로 수정 바랍니다.</p>
  <p style="margin:3px;color:red;">&nbsp;&nbsp;&nbsp;차량등록일 기준으로 전방충돌방지,차선이탈방지 정보를 자동 세팅합니다.</p>
  </form>
  
	<form name="SetInfo" method="post" action="car_domestic_2.asp">  
	<input type="hidden" name="turl" value="www.myga.co.kr/common/">
	<input type="hidden" name="CarCompany" value=0>
	<input type="hidden" name="CarName" value=0> 
	<input type="hidden" name="CarYear" value=0>
	<input type="hidden" name="dbyear" value="2023">
	<input type="hidden" name="term" value="3">
	<input type="hidden" name="iy" value="2023">
	<input type="hidden" name="im" value="08">
	<input type="hidden" name="cardate" >
	<input type="hidden" name="fdate" value="20230828">

<br>	
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="40">
  <tr align="center" valign="bottom"> 
    <td><input type="button" class="btn1" value=" 적 용 " onclick="Next()" ></td>
  </tr>
</table>		

</form>  
<table height="100">
<tr>
	<td></td>
</tr>
</table>
	
<!--bottom-->	

<table width="100%">
	<tr>
		<td height="25" bgcolor="#A5A5A5">
	<a href="javascript:self.close();"><font color="White" size="3px">[닫기]</a></font></td>
	</tr>
</table>
</div>

<script>


	$(function() {
    var strWidth;
    var strHeight;
		
    if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
        strWidth = $('#contents').outerWidth() + (window.outerWidth - window.innerWidth);
        strHeight = $('#contents').outerHeight() + (window.outerHeight - window.innerHeight);
    }
    else {
        var strDocumentWidth = $(document).outerWidth();
        var strDocumentHeight = $(document).outerHeight();
        window.resizeTo ( strDocumentWidth, strDocumentHeight );

        var strMenuWidth = strDocumentWidth - $(window).width();
        var strMenuHeight = strDocumentHeight - $(window).height();

        strWidth = $('#contents').outerWidth() + strMenuWidth;
        strHeight = $('#contents').outerHeight() + strMenuHeight;
    }
	//resize
	window.resizeTo( strWidth, strHeight );
});	
	
</script>

</body>
</html>

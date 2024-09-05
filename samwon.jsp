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

 
	<title>�ڵ��� ã��</title>
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
    		alert("����������� ���� 8�ڸ��� �Է� �����մϴ�.");
    		document.NewAccount.cardate.value = '';
			}else{
				document.SetInfo.cardate.value    = cardate;
				document.SetInfo.submit();			
			}
		} 
		
		// ndate : YYYYMMDD  / month �����
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

			// A,B ������ ���� ��� 
			if(caryearGubun != ''){
				// �����ϰ� ���������� ���� ���(3,4�б�)
				if(fdateVal.substring(0,4) == caryearVal){
					if(caryearGubun == 'A')					document.getElementById("cardate").value = fdateVal
					else if(caryearGubun == 'B')		document.getElementById("cardate").value = fdateVal.substring(0,4)+""+"0101";
				// �����ϰ� ���������� �ٸ� ���	(1,2�б�)
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
		<font color="White" size="4px">&nbsp;<b>��������</b></font></td>
	</tr>
</table>
	
<!-----------���� �����ϱ� ����----------->
<table width="98%" class="pop_left_right" style="margin:auto;">
    <tr> 
     <td class="pop_left_td"  width="80">����ȸ�� </td>
     <td class="pop_right_td">  	
		<select name="CarCompany" id="carcompany" size="1" onChange = "CompanyChange()">	
		<option value="��ü">��ü</option>"	
<option value='���'>���</option><option value='���'>���</option><option value='�Ｚ'>�Ｚ</option><option value='�ֿ�'>�ֿ�</option><option value='��̽ý���'>��̽ý���</option><option value='�꺸'>�꺸</option><option value='�ƽþ�'>�ƽþ�</option><option value='����'>����</option><option value='KST'>KST</option>
		</select>				
    </td>
  	</tr>
  	<tr>
    <td class="pop_left_td" width="60">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
    <td class="pop_right_td"> 
		<select name="CarName" id="carname" size="1"  onChange = "CarNameChange()">
				
<option value='������' selected>������</option><option value='�׷���'>�׷���</option><option value='�׷��̽�������������'>�׷��̽�������������</option><option value='�ؽþ�'>�ؽþ�</option><option value='�ؽ�'>�ؽ�</option><option value='�����'>�����</option><option value='���̳ʽ�Ƽ'>���̳ʽ�Ƽ</option><option value='��Ÿ'>��Ÿ</option><option value='��뽺'>��뽺</option><option value='���Ÿ'>���Ÿ</option><option value='��Ƽ'>��Ƽ</option><option value='������'>������</option><option value='����'>����</option><option value='���䳪'>���䳪</option><option value='������'>������</option><option value='�ε�콺'>�ε�콺</option><option value='��ü'>��ü</option><option value='�Ͻ�Ÿ'>�Ͻ�Ÿ</option><option value='����'>����</option><option value='����'>����</option><option value='����'>����</option><option value='������'>������</option><option value='���̺�'>���̺�</option><option value='��Ƽ��'>��Ƽ��</option><option value='������'>������</option><option value='�ű׳ʽ�'>�ű׳ʽ�</option><option value='�ƽ�ũ����'>�ƽ�ũ����</option><option value='���'>���</option><option value='���Ϻ�'>���Ϻ�</option><option value='����'>����</option><option value='����'>����</option><option value='����ũ����'>����ũ����</option><option value='������'>������</option><option value='����Ÿ��������������'>����Ÿ��������������</option><option value='���ν���'>���ν���</option><option value='��ξ�'>��ξ�</option><option value='����'>����</option><option value='���̺�'>���̺�</option><option value='���Ǿ�'>���Ǿ�</option><option value='���佺'>���佺</option><option value='����'>����</option><option value='����ƮEV'>����ƮEV</option><option value='������'>������</option><option value='��Ÿ����'>��Ÿ����</option><option value='��Ÿ����'>��Ÿ����</option><option value='����������'>����������</option><option value='���ڶ�'>���ڶ�</option><option value='�����'>�����</option><option value='���þ�'>���þ�</option><option value='����ũ'>����ũ</option><option value='����Ʈ��'>����Ʈ��</option><option value='����Ƽ��'>����Ƽ��</option><option value='��Ÿ��'>��Ÿ��</option><option value='��Ÿ��'>��Ÿ��</option><option value='�����'>�����</option><option value='�꺸'>�꺸</option><option value='�Ÿ'>�Ÿ</option><option value='���'>���</option><option value='���'>���</option><option value='�����Ρ�������������'>�����Ρ�������������</option><option value='�ƹݶ�'>�ƹݶ�</option><option value='�ƺ���'>�ƺ���</option><option value='�ƺ���'>�ƺ���</option><option value='�ƽ���'>�ƽ���</option><option value='���̿���'>���̿���</option><option value='��ī���'>��ī���</option><option value='���佺'>���佺</option><option value='�����'>�����</option><option value='�������'>�������</option><option value='����'>����</option><option value='����Ʈ'>����Ʈ</option><option value='����'>����</option><option value='��Ƽ��'>��Ƽ��</option><option value='������������'>������������</option><option value='����'>����</option><option value='����Ʈ��'>����Ʈ��</option><option value='���Ƿ���'>���Ƿ���</option><option value='�ö���'>�ö���</option><option value='��Ƽ��'>��Ƽ��</option><option value='������'>������</option><option value='�̽�Ÿ��'>�̽�Ÿ��</option><option value='���丮��'>���丮��</option><option value='���׽ý�'>���׽ý�</option><option value='���׽ý� (2����)'>���׽ý� (2����)</option><option value='��Ʈ��'>��Ʈ��</option><option value='ü���'>ü���</option><option value='ī�Ϲ�'>ī�Ϲ�</option><option value='ī����'>ī����</option><option value='ī����Ÿ'>ī����Ÿ</option><option value='ī��Ÿ'>ī��Ÿ</option><option value='ī�̷�'>ī�̷�</option><option value='Į�ν�'>Į�ν�</option><option value='ĳ����'>ĳ����</option><option value='ĳ��Ż'>ĳ��Ż</option><option value='ĸƼ��'>ĸƼ��</option><option value='�ڳ�'>�ڳ�</option><option value='�ڶ���'>�ڶ���</option><option value='���ڵ�'>���ڵ�</option><option value='ũ������'>ũ������</option><option value='ũ����'>ũ����</option><option value='Ŭ��'>Ŭ��</option><option value='�׶�ĭ'>�׶�ĭ</option><option value='�䷹��'>�䷹��</option><option value='�佺ī'>�佺ī</option><option value='����ī��'>����ī��</option><option value='����'>����</option><option value='Ʈ����'>Ʈ����</option><option value='Ʈ����'>Ʈ����</option><option value='Ʈ���Ϻ�����'>Ʈ���Ϻ�����</option><option value='Ƽ����'>Ƽ����</option><option value='Ƽ���'>Ƽ���</option><option value='Ƽ��'>Ƽ��</option><option value='��ũŸ��'>��ũŸ��</option><option value='�Ӹ����̵�'>�Ӹ����̵�</option><option value='������'>������</option><option value='���ٻ�'>���ٻ�</option><option value='�����̵�'>�����̵�</option><option value='��������'>��������</option><option value='������'>������</option><option value='EV6'>EV6</option><option value='EV9'>EV9</option><option value='i30'>i30</option><option value='i40'>i40</option><option value='K3'>K3</option><option value='K5'>K5</option><option value='K7'>K7</option><option value='K8'>K8</option><option value='K9'>K9</option><option value='NIRO'>NIRO</option><option value='NIRO(�Ϸ�)'>NIRO(�Ϸ�)</option><option value='QM5'>QM5</option><option value='QM6'>QM6</option><option value='RAY'>RAY</option><option value='SM3'>SM3</option><option value='SM5'>SM5</option><option value='SM6'>SM6</option><option value='SM7'>SM7</option><option value='XM3'>XM3</option><option value='X-TREK'>X-TREK</option>
		</select>	
				
      </td>
    </tr>

    <tr> 
      <td class="pop_left_td"  width="60">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td class="pop_right_td"> 
		<select name="CarYear" id="caryear" size="1">
<option value='2004'>2004</option><option value='2003'>2003</option><option value='2002'>2002</option><option value='2001'>2001</option><option value='2000'>2000</option><option value='1999'>1999</option><option value='1998'>1998</option><option value='1997'>1997</option><option value='1996'>1996</option><option value='1995'>1995</option><option value='1994'>1994</option><option value='1993'>1993</option><option value='1992'>1992</option>
				</select>
	    </td>
    </tr>
    <tr> 
      <td class="pop_left_td"  width="60">���������</td>
      <td class="pop_right_td"> 
      	<input type="text" name="cardate" id="cardate" placeholder="YYYYMMDD" value="" style="ime-mode:active;width:95%;border:1px solid #dcdcdc;height:25px;padding-left:14px;" maxlength="8">
      </td>
    </tr>    
  </table>
  <p style="margin:3px;color:red;">** ����������� ���谳���ϰ� ������ �������� �������� �ڵ������մϴ�.</p>
  <p style="margin:3px;color:red;">&nbsp;&nbsp;&nbsp;�ڵ����õǴ� ��¥�� �ٸ���� �������� ���� �ٶ��ϴ�.</p>
  <p style="margin:3px;color:red;">&nbsp;&nbsp;&nbsp;��������� �������� �����浹����,������Ż���� ������ �ڵ� �����մϴ�.</p>
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
    <td><input type="button" class="btn1" value=" �� �� " onclick="Next()" ></td>
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
	<a href="javascript:self.close();"><font color="White" size="3px">[�ݱ�]</a></font></td>
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

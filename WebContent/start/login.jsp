<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="blackSurviver.Connect"/>>
<%
	request.setCharacterEncoding("EUC-KR");
String msg1="����";
if(request.getParameter("id")!=null){
	boolean delete=mgr.reset(request.getParameter("id"));
	if(delete){msg1="���� ����";}
}

%>



<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=yes">
<title>�α���</title>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<style type="text/css">
</style>
<script type="text/javascript">
<%if(request.getParameter("id")!=null){%>
alert('<%=msg1%>');
<%}%>
function formChk(){
    if(document.login.id.value==''){
      alert("id�� �Է��ϼ���!!");
      document.login.id.focus();
    }else if(document.login.pwd.value==''){
      alert("password�� �Է��ϼ���!!");    
      document.login.pwd.focus();
    }else{
       document.login.submit(); 
    }
    }

</script>

</head>


<body style="overflow: hidden;background-color:black;background-size: 100%;">


<form name="login" method="post" action="loginProc.jsp">
<table class="loginform" style="margin-top: 30%;margin-left: 35%;width: 250; background-color: white;">
<tr>
	<td width="30">ID</td>
	<td width="200"><input name="id"></td>
</tr>
<tr>
	<td>PASSWORD</td>
	<td><input type="password" name="pwd"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value="ȸ������" onclick="javascript:location.href='../start/reg.jsp'">
		<input type="button" value="���ӹ��" onclick="javascript:location.href='gameHelp.jsp'">

		<input type="button" value="�α���" onclick="javascript:formChk()">
	</td>
</tr>

</table>



</form>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=yes">
<title>ȸ������</title>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
</head>

<body style="background-color: gray;">
<form name="register" method="post" action="regProc.jsp">
<table border="1" style="margin-left: 20%;margin-top: 10%;background-color: white;">

<tr>
	<td>ĳ���� ����</td>
	<td>
	<img src="../image/char/����.png" width="100">
	<input type="radio" name="ch" value="1" onclick="javascript:location.href='../charInfo/Nadine.jsp'">
	<img src="../image/char/���̸�.png" width="100">
	<input type="radio" name="ch" value="2" onclick="javascript:location.href='../charInfo/Dailin.jsp'">
	<img src="../image/char/�ű׳ʽ�.png" width="100">
	<input type="radio" name="ch" value="3" onclick="javascript:location.href='../charInfo/Magnus.jsp'">
	<img src="../image/char/��Ű.png" width="100">
	<input type="radio" name="ch" value="4" onclick="javascript:location.href='../charInfo/Jackie.jsp'">
	<p>
	<img src="../image/char/Ű�ƶ�.png" width="100">
	<input type="radio" name="ch" value="5" onclick="javascript:location.href='../charInfo/Chiara.jsp'">
	<img src="../image/char/�ǿ���.png" width="100">
	<input type="radio" name="ch" value="6" onclick="javascript:location.href='../charInfo/Fiora.jsp'">
	<img src="../image/char/����.png" width="100">
	<input type="radio" name="ch" value="7" onclick="javascript:location.href='../charInfo/Hyunwoo.jsp'">
	<img src="../image/char/����.png" width="100">
	<input type="radio" name="ch" value=8 onclick="javascript:location.href='../charInfo/Hyejin.jsp'">
	</td>
</tr>
<tr>
	<td width="30">���̵�</td>
	<td width="200"><input name="id"></td>
</tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="password" name="pwd"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="����ϱ�" >
		<input type="reset" value="�����ϱ�">
		<input type="button" value="ó������" onclick="javascript:location.href='login.jsp'">
	</td>
</tr>



</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<%@include file="../sc.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link href="../../css/css.css?ver=<?php echo time()?>" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<title>연못</title>
</head>
<body>

<img src="../../image/background/B5.png" width="100%" height="100%" class="bg">
<img src="../../image/background/B5.png" width="100%" height="100%" class="mbg">
<audio src="../../audio/배경음악 (4).wav" autoplay="autoplay" loop="loop" id="bgm"></audio>
<%@include file="../base.html"%>
</body>
</html>
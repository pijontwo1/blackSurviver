<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<%
int count=0;
if(request.getParameter("count")!=""){
count=Integer.parseInt(request.getParameter("count"));
}
%>
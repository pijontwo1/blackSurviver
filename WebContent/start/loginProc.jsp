<%@page import="blackSurviver.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="blackSurviver.Connect"/>
<jsp:useBean id="bean" class="blackSurviver.User"/>
<jsp:setProperty property="*" name="bean"/>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

bean=mgr.userlist(id);
	
String beanid=bean.getId();
String beanpwd=bean.getPwd();
int beanch=bean.getCh();


String msg="로그인";
String res="입력실패";

if(beanid==null)
{
	msg="없는 아이디";
	%>
	<script>
	location.href="login.jsp"
		alert("<%=msg%>");
	</script>
	<%
}
else if(!beanpwd.equals(pwd))
{
	msg="다른 비밀번호";
	%>
	<script>
	location.href="login.jsp"
		alert("<%=msg%>");
	</script>
	<%
}
else
{
	 
	 boolean flag=mgr.start(beanid, beanch);
	 if(flag){
	 	res="입력성공";
	 }
	
	%>
	<script>
	alert(" <%=msg%>+<%=res%>");
	location.href="map/start.jsp?id=<%=id%>&now=180000&ch=<%=beanch%>"
	</script>
	<%
}

%>


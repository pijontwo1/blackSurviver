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


String msg="�α���";
String res="�Է½���";

if(beanid==null)
{
	msg="���� ���̵�";
	%>
	<script>
	location.href="login.jsp"
		alert("<%=msg%>");
	</script>
	<%
}
else if(!beanpwd.equals(pwd))
{
	msg="�ٸ� ��й�ȣ";
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
	 	res="�Է¼���";
	 }
	
	%>
	<script>
	alert(" <%=msg%>+<%=res%>");
	location.href="map/start.jsp?id=<%=id%>&now=180000&ch=<%=beanch%>"
	</script>
	<%
}

%>


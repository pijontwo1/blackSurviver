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
int ch=Integer.parseInt(request.getParameter("ch"));
boolean result;
String msg="�����ϴ� ���̵�";
	result=mgr.insert(bean);
	if(result){msg="���� ����";}
%>


<script>
location.href="login.jsp"
	alert(" <%=msg%>");

</script>
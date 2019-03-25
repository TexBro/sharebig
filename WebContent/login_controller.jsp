<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import=" model.login.*"%>
<%
	String command = request.getParameter("command");
	String method = request.getMethod();

	if (method.equals("POST") && command.equals("login")) {
		%>
		<jsp:useBean id="loginDO" class="model.DO.LoginDO" />
		<jsp:setProperty name="loginDO" property="*" />
		<jsp:useBean id="loginSO" class="model.login.LoginSO" />
				
		<jsp:useBean id="loginDAO" class="model.login.LoginDAO" />
		
		
		<%
		log("user !!" +loginDO.getUserid());
		log("pss !!"+loginDO.getPasswd());
		
		loginDAO.selectUser(loginDO);
		
		response.sendRedirect("main_controller.jsp");
	}
	if (method.equals("POST") && command.equals("signup")) {
		pageContext.forward("/WEB-INF/view/signup.jsp");
	}
	if(method.equals("GET") && command==null){
		pageContext.forward("/WEB-INF/view/login.jsp");

	}
%>

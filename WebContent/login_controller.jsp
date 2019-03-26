<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import=" model.login.* , model.signUp.*, java.util.*" %>
<%
	String command = request.getParameter("command");

	String method = request.getMethod();
	log(command);
	log(method);


	if((method.equals("GET") && command==null)){
		/* 아무런 command 없는 경우  */
		pageContext.forward("/WEB-INF/view/login.jsp");
	}
	else if((method.equals("POST") && command==null)){
		/* 아무런 command 없는 경우  */
		pageContext.forward("/WEB-INF/view/login.jsp");
	}
	
	else if((method.equals("GET")||method.equals("POST")) && command==null){
		/* 아무런 command 없는 경우  */
		pageContext.forward("/WEB-INF/view/login.jsp");
	}
	
	else if( (method.equals("GET")||method.equals("POST"))  && command.equals("wrong")){
		pageContext.forward("/WEB-INF/view/login.jsp?ver=wrong");
	}
	else if(method.equals("GET")  && command.equals("signup")){
		pageContext.forward("/WEB-INF/view/signup.jsp");
	}
	
	else if(method.equals("POST") && command.equals("login")) {
	
	%>
	
	<jsp:useBean id="loginDO" class="model.dataObject.LoginDO" />
	<jsp:setProperty name="loginDO" property="*" />
	<jsp:useBean id="loginSO"  class="model.login.LoginSO" />
	
	<%
		
		if(!loginSO.checkLogin(loginDO)) {
			response.sendRedirect("login_controller.jsp?command=wrong");
			//pageContext.forward("login_controller.jsp?command=wrong");
		} else { 
			session.setAttribute("id", loginDO.getUserid());
			pageContext.forward("/main_controller.jsp");
		}
	
	} 
	
	else if (method.equals("POST") && command.equals("signup")) {
		/* 회원 가입 클릭시  */
				
			%>
		    <jsp:useBean id="signUpSO" class="model.signUp.SignUpSO"/>
		
			<%
		if(request.getMethod().equals("POST")&& command.equals("signup"))
			{
				request.setCharacterEncoding("UTF-8");
			%>
				<jsp:useBean id="MemberDO" class="model.dataObject.MemberDO" />
				<jsp:setProperty name="MemberDO" property="*" />		
			<%
				
				signUpSO.setSignUp(MemberDO);
			}
		pageContext.forward("/WEB-INF/view/signup.jsp");
	}
	else{
		
	}
	
%>

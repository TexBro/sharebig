<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.DO.* "%>

<%
	String command = request.getParameter("command");
	String option = request.getParameter("option");
	String method = request.getMethod();
	
	log(command);
	if (method.equals("GET") && command == null) {
		/* 아무런 command 없는 경우  */
		pageContext.forward("/WEB-INF/view/index.jsp");

	}
	else if (method.equals("GET") && command.equals("list")) {
		/* list  패이지로의 이동 처리  */
		pageContext.forward("/WEB-INF/view/index-list.jsp");
	}
	
	else if (method.equals("GET") && command.equals("mypage") ) {
		/* mypage 이동  */
		pageContext.forward("/WEB-INF/view/mypage.jsp");
	}

	else if (method.equals("GET") && command.equals("regist")){
		pageContext.forward("/WEB-INF/view/item-register.jsp");
	
	}
	
	
	else if (method.equals("GET") && command.equals("logout") ) {
		/* 로그아웃  처리 */
		response.sendRedirect("login_controller.jsp");
	} 
	
	else {
		pageContext.forward("/WEB-INF/view/index.jsp");
	}
%>
<%@page import="model.detail.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.dataObject.*, model.myPage.*"%>

<%
	String command = request.getParameter("command");
	String option = request.getParameter("option");
	String method = request.getMethod();
	log(command);
	
	if(session.getAttribute("id")==null){
		response.sendRedirect("login_controller.jsp");
	}
	else if (method.equals("GET") && command == null) {
		/* 아무런 command 없는 경우  */
		pageContext.forward("/WEB-INF/view/index.jsp");
	}
	else if (method.equals("GET") && command.equals("list")) {
		/* list  패이지로의 이동 처리  */
		pageContext.forward("/WEB-INF/view/index-list.jsp");
	}
	
	else if (method.equals("GET") && command.equals("mypage") ) {
		/* mypage 이동  */
		%>
		<jsp:useBean id="mypageSO" class="model.myPage.MyPageSO"/>
		<%
		String id = (String)session.getAttribute("id");
		MemberDO member=mypageSO.getMember(id);
		session.setAttribute("member",member);
		
		ArrayList<ItemDO> salelist=mypageSO.getSaleList(id);
		session.setAttribute("salelist",salelist);
		
		ArrayList<ItemDO> sharelist=mypageSO.getShareList(id);
		session.setAttribute("sharelist",sharelist);

		ArrayList<ItemDO> interestlist=mypageSO.getInterestList(id);
		session.setAttribute("interestlist",interestlist);

		pageContext.forward("/WEB-INF/view/mypage.jsp");
	}

	else if (method.equals("GET") && command.equals("regist")){
		pageContext.forward("/WEB-INF/view/item-register.jsp");
	
	}
	
	else if (method.equals("GET") && command.equals("detail")){
		String itemid = request.getParameter("itemid");
		%>
		<jsp:useBean id="detailSO" class="model.detail.DetailSO"/>
		<%
		//log();
		ItemDO item =detailSO.getBasicItemInfo(Integer.parseInt(itemid));
		ArrayList<ItemCommentDO> commentlist = detailSO.getItemComment(Integer.parseInt(itemid));
				
		//basicdetailSO.
		session.setAttribute("commentlist",commentlist);
		session.setAttribute("item", item);
		pageContext.forward("/WEB-INF/view/property-details.jsp");
	}
	else if (method.equals("GET") && command.equals("logout") ) {
		/* 로그아웃  처리 */
		session.invalidate();
		response.sendRedirect("login_controller.jsp");
	} 
	
	else {
		pageContext.forward("/WEB-INF/view/index.jsp");
	}
%>
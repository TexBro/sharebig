<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@page import="oracle.net.aso.s"%>
<%@page import="model.detail.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.main.*"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*"%>
<%@page import="model.register.RegisterSO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.dataObject.*, model.myPage.*"%>

<%
	String command = request.getParameter("command");
	String method = request.getMethod();
	log(command);
	
	if(session.getAttribute("id")==null){
		response.sendRedirect("login_controller.jsp");
	}
	else if (method.equals("GET") && command == null) {
		//pageContext.forward("/WEB-INF/view/index.jsp");
	/*}
	else if (method.equals("GET") && command.equals("main")) {
		*//* 아무런 command 없는 경우  */
		
		%>
			<jsp:useBean id="mainSO" class="model.main.MainSO"/>			
		<%
		String pageparam = request.getParameter("page");
		String option = request.getParameter("option");
		
		String sess_id = (String)session.getAttribute("id");
		ArrayList<ItemDO> mainitemlist = null;
		ArrayList<Integer> interestlist= mainSO.getInterestlist(sess_id);
		int totalrow=mainSO.getCountItemList(option);
		
		if(pageparam == null){
			pageparam="1";
		}
		if(option == null){
			mainitemlist=mainSO.getAllMainItemlist(Integer.parseInt(pageparam));	
		}
		else{
			mainitemlist=mainSO.getMainItemlist(option, Integer.parseInt(pageparam));
		}
		session.setAttribute("pageparam", pageparam);
		session.setAttribute("totalrow", totalrow);
		session.setAttribute("interestlist", interestlist);
		session.setAttribute("mainitemlist", mainitemlist);
		pageContext.forward("/WEB-INF/view/index.jsp");
	}
	else if(method.equals("GET") && command.equals("favorite")){
		String str_itemid = request.getParameter("itemid");
		int itemid= Integer.parseInt(str_itemid);
		%>
		<jsp:useBean id="mainSO1" class="model.main.MainSO"/>			
		<% 
		String userid=(String)session.getAttribute("id");
		if(mainSO1.checkFavorite(itemid,userid)){
			//System.out.print("asdf");
			mainSO1.removeFavorite(itemid, userid);
		}
		else{
			mainSO1.addFavorite(itemid, userid);
		}

		response.sendRedirect("main_controller.jsp");

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
	else if (method.equals("POST") && command.equals("register")){
		try {
			ItemDO itemDO = new ItemDO();
			MemberDO memberDO = new MemberDO();
			RegisterSO registerSO = new RegisterSO();
			FileUploadDO fileDO = new FileUploadDO();

			String savePath = "C:/Java/webproject/sharebig_git_master/WebContent/images";
			int sizeLimit = 5 * 1024 * 1024; //5MB

			String encoding = "UTF-8";

			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, encoding,
			new DefaultFileRenamePolicy());
			
			String share_final_date =multi.getParameter("share_final_date");
			int register_type = Integer.parseInt(multi.getParameter("register_type"));
			int item_type = Integer.parseInt(multi.getParameter("item_type"));
			String item_name = multi.getParameter("item_name");
			int price = Integer.parseInt(multi.getParameter("price"));
			String item_info = multi.getParameter("item_info");
			String item_file = multi.getParameter("item_file");
			int cata_no = Integer.parseInt(multi.getParameter("cata_no"));

			String id = multi.getParameter("id");
			String sysName = multi.getFilesystemName("item_file");
			String orgName = multi.getOriginalFileName("item_file");
			String type = multi.getContentType("item_file");

			System.out.println("regi-type : " + register_type);
			itemDO.setShare_final_date(share_final_date);
			itemDO.setRegister_type(register_type);
			itemDO.setItem_type(item_type);
			itemDO.setItem_name(item_name);
			itemDO.setPrice(price);
			itemDO.setItem_info(item_info);
			itemDO.setItem_file(item_file);
			itemDO.setCata_no(cata_no);
			itemDO.setId((String)session.getAttribute("id"));
			fileDO.setOrgName(orgName);
			fileDO.setSysName(sysName);

			System.out.println("orgName : " + orgName);
			System.out.println("sysName : " + sysName);

			registerSO.setUploadItem(itemDO, memberDO, fileDO, request);
			//pageContext.forward("/WEB-INF/view/index.jsp");
			response.sendRedirect("main_controller.jsp?command=mypage");
			} catch (Exception e) {
			e.printStackTrace();
			}
	
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
	else if (method.equals("POST") && command.equals("takeitem") ) {
		%>
		<jsp:useBean id="detailSO1" class="model.detail.DetailSO"/>
		<%
		ItemDO itemDO=(ItemDO)session.getAttribute("item");
		itemDO.setStart_date(request.getParameter("start_date"));
		itemDO.setEnd_date(request.getParameter("end_date"));
		//itemDO.setItem_no(Integer.parseInt(request.getParameter("itemid")));
		
		detailSO1.takeItem(itemDO);
		response.sendRedirect("main_controller.jsp");
	} 
	
	else {
		pageContext.forward("/WEB-INF/view/index.jsp");
	}
%>
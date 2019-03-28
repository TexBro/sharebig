<%@page import="java.util.ArrayList"%>
<%@page import="model.dataObject.ItemDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="site-section site-section-sm bg-light">
	<div class="container">

		<div class="row mb-5">
		<%
		ArrayList<Integer> interestlist =(ArrayList<Integer>)session.getAttribute("interestlist");
		ArrayList<ItemDO> mainitemlist = (ArrayList<ItemDO>)session.getAttribute("mainitemlist");
		int totalrow=(Integer)session.getAttribute("totalrow");
		for(ItemDO itemDO : mainitemlist){
		%>
			<div class="col-md-6 col-lg-4 mb-4">
				<div class="property-entry h-100">
					<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>" class="property-thumbnail" style="text-align: center;">
						<div class="offer-type-wrap">
						<%if(itemDO.getRegister_type() == 1) {%>
							<span class="offer-type bg-danger">Sale</span>
							
						<%}
						else if (itemDO.getRegister_type() == 2){%> 
							<span class="offer-type bg-success">Rent</span>
							<%} %>
						</div> <img src='<%="images/"+itemDO.getItem_file()%>' alt="Image" class="img-fluid" style="max-height: 200px;">
					</a>
					<div class="p-4 property-body">
					<% 
					if(interestlist.contains(itemDO.getItem_no()) ){
						%>
					
						<a href="main_controller.jsp?command=favorite&itemid=<%=itemDO.getItem_no()%>" class="property-favorite active" style="top:120px;"> <span
							class="icon-heart-o"></span></a>
						<% 
						}
					else{
					%>
					<a href="main_controller.jsp?command=favorite&itemid=<%=itemDO.getItem_no()%>" class="property-favorite" style="top:120px;"> <span
							class="icon-heart-o"></span></a>
						
					<%
					}
					%>
						<h2 class="property-title">
							<a href="main_controller.jsp?command=detail&itemid=<%=itemDO.getItem_no()%>"><%=itemDO.getItem_name() %></a>
						</h2>
 						<span class="property-location d-block mb-3">
							<span class="property-icon icon-room"></span>
							 본사
						 </span> 
						 <strong class="property-price text-primary mb-3 d-block text-success"><%=itemDO.getPrice()%> 원</strong>
					</div>
				</div>
			</div>
		<%
			}
		%>

		</div>
		<script type="text/javascript">
		
		function removeParams(sParam)
		{
		            var url = window.location.href.split('?')[0]+'?';
		            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
		                sURLVariables = sPageURL.split('&'),
		                sParameterName,
		                i;
		         
		            for (i = 0; i < sURLVariables.length; i++) {
		                sParameterName = sURLVariables[i].split('=');
		                if (sParameterName[0] != sParam) {
		                    url = url + sParameterName[0] + '=' + sParameterName[1] + '&'
		                }
		            }
		            return url.substring(0,url.length-1);
		}
		
		function CreatePageURL(i) {
			var url = location.pathname+location.search;
			if(!!!location.search){
				url += "?page="+i;
			}
			else{
				url=removeParams("page");
				if(Object.keys(url.split('?')).length==1)
					url += "?page="+i;
				else
					url += "&page="+i;
			}
			console.log(url);
			return url;
		}
		
		</script>
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="site-pagination">
				<%
					int pageparam=(Integer.parseInt((String)session.getAttribute("pageparam")));
					for(int i = 1 ; i <= Math.ceil((float)totalrow/9); i++){
						if(pageparam==i){
				%>
							<%-- <a href='main_controller.jsp?page=<%=i%>' class="active"><%=i%></a>--%>
							<a href = "javascript:window.location=CreatePageURL(<%=i%>)"  class="active"><%=i%></a>
				<%
						} 
						else{
				%>
							<a href = "javascript:window.location=CreatePageURL(<%=i%>)"  class=""><%=i%></a>
							<%-- <a href='main_controller.jsp?page=<%=i%>' class=""><%=i%></a>--%>
				<%
						}
					}
				%>

				</div>
			</div>
		</div>

	</div>
</div>


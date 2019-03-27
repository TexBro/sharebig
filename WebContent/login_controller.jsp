<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import=" model.login.* , model.signUp.*, java.util.*" %>
<%

if(request.getMethod().equals("POST")) {
request.setCharacterEncoding("UTF-8");
}

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

/* 사번이 틀릴 경우  */
else if( (method.equals("GET")||method.equals("POST"))  && command.equals("checkWrong")){
pageContext.forward("/WEB-INF/view/member-check.jsp?ver=wrong");
}

else if(method.equals("GET")  && command.equals("signup")){
pageContext.forward("/WEB-INF/view/member-check.jsp");
// pageContext.forward("/WEB-INF/view/signup.jsp");
}

else if(method.equals("POST") && command.equals("login")) {

%>

<jsp:useBean id="loginDO" class="model.dataObject.LoginDO" />
<jsp:setProperty name="loginDO" property="*" />
<jsp:useBean id="loginSO"  class="model.login.LoginSO" />

<%

if(!loginSO.checkLogin(loginDO)) {
response.sendRedirect("login_controller.jsp?command=wrong");
} else { 
session.setAttribute("id", loginDO.getUserid());
pageContext.forward("/main_controller.jsp");
}

} 

/* 사번을 입력하고 register를 누를 시  */
else if (method.equals("POST") && command.equals("checkMember")) {

%>
<jsp:useBean id="memberNoDO" class="model.dataObject.MemberNoDO" />
<jsp:setProperty name="memberNoDO" property="*" />
<jsp:useBean id="loginSO2"  class="model.login.LoginSO" />
<%

if(!loginSO2.checkMember(memberNoDO)) {
System.out.println("사번틀림");
/* 사번이 틀릴 시  */
response.sendRedirect("login_controller.jsp?command=checkWrong");
} else { 
System.out.println("사번맞음");
pageContext.forward("/WEB-INF/view/signup.jsp");
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
pageContext.forward("/WEB-INF/view/login.jsp");    

}



%>
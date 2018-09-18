<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid=request.getParameter("userid");	
	
	MemberDAO dao=new MemberDAO();	
	boolean flag=dao.checkId(userid);
	
	if(flag){ //formValidate가 작동하기 위해서는 false를 돌려줘야 인식함
		out.print("false");
	}else{
		out.print("true");
	}
%>   
 



<%-- <!-- db작업을 진행할 joinProcess.jsp -->
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//memberProcess.jsp에서 넘긴값 처리하기
	request.setCharacterEncoding("utf-8");

	//joinForm.jsp에서 사용자가 입력한 값 가져온 후
	String userid=request.getParameter("userid");

	//DAO연동
	MemberDAO dao=new MemberDAO();
	boolean flag=dao.checkId(userid);
	
	if(flag){
		out.print(0);
	
	}
	
%> --%>

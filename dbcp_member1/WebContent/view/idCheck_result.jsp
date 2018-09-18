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
	boolean result=dao.checkId(userid);

	
	//여기값이 joinForm_idCheck.jsp에 return 값으로 간다.
	//callback
	if(result){ 
		out.print(0);	
	}else{
		out.print(1);
	}
	
%>

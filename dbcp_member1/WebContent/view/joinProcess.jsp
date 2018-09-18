<!-- db작업을 진행할 joinProcess.jsp -->
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//memberProcess.jsp에서 넘긴값 처리하기
	request.setCharacterEncoding("utf-8");

	//joinForm.jsp에서 사용자가 입력한 값 가져온 후
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	//DAO연동
	MemberDAO dao=new MemberDAO();
	
	//VO연동
	MemberVO vo=new MemberVO();
	
	//Data삽입
	vo.setUserid(userid);
	vo.setPassword(password);
	vo.setName(name);
	vo.setGender(gender);
	vo.setEmail(email);
	
	int result=dao.member_insert(vo);
	
	if(result>0){
		out.print("<script>");
		out.print("alert('회원 가입 완료');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");
		
	}else{
		out.print("<script>");
		out.print("alert('회원 가입 실패');");
		out.print("location.href='joinForm.jsp';");
		out.print("</script>");
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 </title>
</head>
<body>

</body>
</html>
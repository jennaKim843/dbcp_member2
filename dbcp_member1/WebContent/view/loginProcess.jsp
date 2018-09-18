
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//로그인 처리
	//loginForm.jsp에서 사용자가 입력한 id와 current_password를 가져온후
	//DB를 거쳐 확인 후 존재하는 사용자라면 세션에 담기
	String userid = request.getParameter("userid");
	String password = request.getParameter("current_password");

	MemberDAO dao = new MemberDAO();
    MemberVO vo = dao.isLogin(userid, password);

	
	if (vo!=null) {
		//vo가 널이 아니라면 존재하는 사용자이기 때문에 세션에 담기
		
		//cookie와 session에 가장 큰 차이점
		//session은 객체 자체로 담는게 가능하다.
		
		//따로따로 담는 방법
		//session.setAttribute(id,"id");
		//session.setAttribute(password,"password");
		
		//두개를 한번에 담는 방법(객체 자체로 담는게 가능.-session이기 때문)
		session.setAttribute("vo", vo);
		
		out.print("<script>");
		out.print("alert('로그인 되었습니다. 환영합니다.');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");
	
		
	} else {
		out.print("<script>");
		out.print("alert('아이디와 비밀번호를 확인해 주세요.');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
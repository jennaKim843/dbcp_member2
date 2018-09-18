<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="../css/floating-labels.css" rel="stylesheet">
<!-- 세션에 값이 있다면 현재 로그인 상태임, 세션에 값이 없는경우 비로그 인상태이므로 로그인 폼 보여주기  -->
<%
	//세션에서 정보 가져오기(오브젝트 타입이기 때문에 변환)
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	if (vo == null) {// 세션의 값이 없다면 form을 보여주고
%>
<form class="form-signin" name="loginform" action="loginProcess.jsp"
	method="post">
	<div class="form-label-group">
		<input type="text" id="userid" name="userid" class="form-control"
			placeholder="id" required autofocus> <label for="userid">아이디</label>
	</div>
	<div class="form-label-group">
		<input type="password" id="current_password" name="current_password"
			class="form-control" placeholder="Password" required> <label
			for="pass">비밀번호</label>
	</div>

	<div class="checkbox mb-3">
		<label> <input type="checkbox" value="remember-me">
			Remember me
		</label>
	</div>
	<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
		in</button>
	<p class="mt-5 mb-3 text-muted text-center">&copy; 2018</p>
</form>
<%
	} else {//세션의 값이 있다면 form보여주지 않음.
%>
	<script>
		//string 상태로 들어가게 하기 위해서 ''넣어준것.
		var name='<%=vo.getName()%>';
	
		//3번 메뉴를 없애라는 스크립트.
		var $menu=$('#3').detach();
		
		var $tag='<span class="navbar-text">'+name+' 님 반갑습니다.</span>'
		+'&nbsp;&nbsp;'
		+'<button type="button" id="logout" class="btn btn-primary">'
		+'로그아웃</button>';
		//append 의 의미는 붙이라는 의미 
		$("#navbarCollapse").append($tag);
	</script>
	<%} %>
	<script>
		//로그아웃 버튼 클릭시 동작
		$(function(){
			$("#logout").click(function(){
				location.href="logout.jsp"
			});
		});
	</script>
	
<%@ include file="../layout/footer.jsp"%>

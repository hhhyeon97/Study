<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
#css{
	text-align:center;
	padding:15px;

}
input{
	margin-bottom:10px;
}
</style>
</head>
<body>
<div id="css">
<h1>Custom Login Page</h1>
<h2><c:out value="${error}"/></h2>
<h2><c:out value="${logout}"/></h2>

<form method="post" action="/login" > <!-- action 주소 /login 이름 변경하면 안 됨 !! -->

<!-- form 태그에서 method="post" 방식으로 전달할 때는 반드시 CSRF 토큰값을 서버로 함께 전달해야 한다. -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- ★ !!! -->
	
	<!-- 
	CSRF (Cross-site request forgery)의 특징)
      1.스프링 시큐리티에서 post방식을 이용하는 경우 기본적으로 CSRF 토근을 사용한다. 이 토큰은 '사이트간 위조
      방지'를 목적으로 특정한 값의 토큰을 사용하는 방식이다.
      2.CSRF 토큰은 사용자가 임의로 변하는 특정한 토큰값을 서버에서 체크하는 방식이다. 
      3.서버에서는 브라우저에서 데이터를 전송할 때 CSRF토큰을 함께 전송한다. 사용자가 post방식등으로 특정한
      작업을 할때는 브라우저에서 전송한 CSRF토큰값과 서버가 보관하고 있는 토큰값을 비교한다. 만일 토큰값이 다르다면
      작업을 처리하지 않는 방식이다.
      4.서버에서 생성하는 토큰은 일반적으로 난수를 생성해서 해커가 난수를 찾을 수 없도록 한다.
      사용자가 '/customLogin'을 처음 호출했을 때와 강제로 F12개발툴 세션쿠키에서 강제로 세션 쿠키 정보를 삭제한 후
      에 다시 호출했을 때 CSRF 토큰 값이 변경되는 것을 확인 할 수 있다.
	 -->
	
	
	<div>
	
	아이디 <input type="text" name="username" size="14">
		<!-- 스프링 시큐리티에서는 로그인 아이디 네임속성명은 반드시 username으로 해야한다. -->	
	</div>

	<div>
	
	비밀번호 <input type="password" name="password" size="14">
		<%-- 스프링 시큐리티에서는 로그인 비번 네임피라미터 이름은 password로 해야 한다. --%>
	
	</div>
	
	<div>
		<input type="checkbox" name="remember-me">Remember Me
	</div>	<!-- 자동 로그인 기능 -> 스프링 시큐리티에서는 관례적으로 자동로그인에서는 네임피라미터 이름을
				remember-me로 사용한다.  -->
	
	
	<div>
	<input type="submit" value="Login">
	</div>


</form>
</div>
</body>
</html>
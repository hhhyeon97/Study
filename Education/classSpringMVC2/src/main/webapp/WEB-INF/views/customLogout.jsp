<%@ page contentType="text/html; charset=UTF-8"%>
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
<h1>LogOut Page</h1>

<form method="post" action="/customLogout">



<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<!-- 스프링 시큐리티에서는 POST방식일 때 csrf 토큰 처리를 해야 한다.-->
<input type="submit" value="로그아웃">


</form>
</div>
</body>
</html>
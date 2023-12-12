<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	position:fixed;
	top:0px;
	left:0px;
	width:100%;
	height:40px;
	line-height:40px;
	text-align: center;
	background-color:#9dc98d;
	color:black;
	font-size: 20px;
}

nav{
	position:fixed;
	top:40px;
	left:0px;
	width:100%;
	height:30px;
	line-height: 30px;
	padding-left: 20px;
	background-color: gray;
	color: white;
}

a{
	text-decoration: none;
	color:inherit;
}
</style>
</head>
<body>

<header>
<b>수강신청 도우미 사이트</b>
</header>

<nav>
<a href="list.jsp">교과목목록 조회/수정</a>&nbsp;&nbsp;&nbsp;
<a href="insert.jsp">교과목 추가</a>&nbsp;&nbsp;&nbsp;
<a href="index.jsp">홈으로</a>
</nav>

</body>
</html>
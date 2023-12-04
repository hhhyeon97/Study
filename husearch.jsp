<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section  style="position:fixed; background-color:#98b5d4;
top:70px; left:0px; width:100%; height:100%; ">
<h2 style="text-align:center;">후보 조회</h2>
<form style="display:flex; align-items: center; justify-content: center;">
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
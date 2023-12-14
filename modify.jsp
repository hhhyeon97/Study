<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<style>
section {
	position:fixed;
	top:70px;
	left:0px;
	width:100%;
	height:100%;
}

h2{
	text-align: center;
}


form {
	display:flex;
	align-items: center;
	justify-content: center;
}

table {
	text-align: center;
}

</style>
</head>
<body>
<jsp:include page="header.jsp" />

<section>

<h2><b>교과목목록 조회/수정</b></h2>

<form>
<table border="1">

<%
request.setCharacterEncoding("UTF-8"); 

String id = request.getParameter("id"); //외부 페이지 데이터 받아오기
try{
	
	String sql = "select * from course_tbl where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	
	String lecturer = rs.getString(4);
	%>
	
	<tr>
	<td>과목 코드</td>
	<td><input type="text" name="id" style="width:100%" value="<%=id%>" readonly></td>
	</tr>
	
	<tr>
	<td>과목명</td>
	<td><input type="text" name="name" style="width:100%" value="<%=rs.getString(2)%>"></td>
	</tr>
	
	<tr>
	<td>학점</td>
	<td><input type="text" name="credit" style="width:100%" value="<%=rs.getString(3)%>"></td>
	</tr>	
	
	<tr>
	<td>담당강사</td>
	<td><select name="lecturer" style="width:100%">
		<option value="">담당강사</option>
		<option value="1" <% if(lecturer.equals("1")) out.println("selected"); %>>김교수</option>
		<option value="2" <% if(lecturer.equals("2")) out.println("selected"); %>>이교수</option>
		<option value="3" <% if(lecturer.equals("3")) out.println("selected"); %>>박교수</option>
		<option value="4" <% if(lecturer.equals("4")) out.println("selected"); %>>우교수</option>
		<option value="5" <% if(lecturer.equals("5")) out.println("selected"); %>>최교수</option>
		<option value="6" <% if(lecturer.equals("6")) out.println("selected"); %>>임교수</option>
	</select>
	</td>
	</tr>		

	<tr>
	<td>학점</td>
	<td><input type="text" name="credit" style="width:100%" value="<%=rs.getString(3)%>"></td>
	</tr>		
	
	<%
}
catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
</body>
</html>
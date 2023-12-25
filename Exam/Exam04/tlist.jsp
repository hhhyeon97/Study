<%@page import="java.text.DecimalFormat"%>
<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp" />
<section>
<h2>강사조회</h2>

<form>
	<table border="1">
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>강의명</td>
			<td>수강료</td>
			<td>강사자격취득일</td>
		 </tr>
		 
<%

request.setCharacterEncoding("UTF-8");

try{
	String sql="select * from tbl_teacher_202201 order by teacher_code";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery();
	while(rs.next()){
		
		int class_price = rs.getInt(4);
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###");
		String price = transformat.format(class_price);
		
		String teach_resist_date = rs.getString(5);
		String date = teach_resist_date.substring(0,4)+"년"+
		teach_resist_date.substring(4,6)+"월"+teach_resist_date.substring(6,8)+"일";
		
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=price%></td>
		<td><%=date%></td>
	</tr>
	
		
<%		
	}
	
}
catch(Exception e){
	e.printStackTrace();
}

%>		 
		 
		 
		 
		 
	</table>
</form>


</section>
<jsp:include page="footer.jsp" />
</body>
</html>
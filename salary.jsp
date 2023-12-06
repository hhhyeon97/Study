<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp" />
<section>
<h2>강사매출현황</h2>
<form>
<table border="1">
	<tr>
		<td>강사코드</td>
		<td>강의명</td>
		<td>강사명</td>
		<td>총매출</td>
	</tr>

<%
request.setCharacterEncoding("UTF-8");

try{
	
	String sql="select te.teacher_code, class_name, teacher_name, sum(tuition) salary "+
	"from tbl_teacher_202201 te, tbl_class_202201 cl "+
	"where te.teacher_code=cl.teacher_code "+
	"group by te.teacher_code, class_name, teacher_name order by te.teacher_code";
	// 오라클에서는 group by절에 들어가는 항목을 select절에 들어가는 항목과 일치시켜줘야 함 ! 
	
	PreparedStatement pstmt = con.prepareStatement(sql); // sql 생성
	ResultSet rs = pstmt.executeQuery(); // 결과 집합 생성
	
	while(rs.next()){
		
		int salary = rs.getInt(4);
		
		// 숫자의 형식을 변경 
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###"); //.00 붙이면 소수점 표현
		
		String salary2 = transformat.format(salary);
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td style="text-align:right"><%=rs.getString(3) %></td>
		<td style="text-align:right"><%=salary2 %></td>
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
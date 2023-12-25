<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp" />

<section>
<h2>회원정보조회</h2>
<form>

	<table border="1">
			<tr>
				<td> 수강월 </td>
				<td> 회원번호 </td>
				<td> 회원명 </td>
				<td> 강의명 </td>
				<td> 강의장소 </td>
				<td> 수강료 </td>
				<td> 등급 </td>
			</tr>
<%

request.setCharacterEncoding("UTF-8");

try{
	String sql="select resist_month, cl.c_no, c_name, class_name, class_area, tuition, grade from tbl_teacher_202201 te, tbl_member_202201 me, tbl_class_202201 cl "+
	"where te.teacher_code=cl.teacher_code and me.c_no=cl.c_no order by resist_month";
	
	PreparedStatement pstmt = con.prepareStatement(sql); //sql생성
	ResultSet rs = pstmt.executeQuery(); //결과 집합 생성 
	
	while(rs.next()){
	
		String resist_month = rs.getString(1); //202203
		String date = resist_month.substring(0,4)+"년"+resist_month.substring(4,6)+"월"; //2022년03월
		
		int tuition = rs.getInt(6);
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###");
		String price = transformat.format(tuition);
%>		
	
	<tr>
		<td><%=date%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=price%></td>
		<td><%=rs.getString(7)%></td>
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
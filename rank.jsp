<%@page import="java.sql.ResultSet"%>
<%@include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
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
<section style="position:fixed; top:70px;
left:0px; width:100%; height:100%;
background-color:lightgray;">
<h2>후보자등수</h2>
<form style="display:flex; align-items: center; justify-content: center;">

<table border="1" style="border-collapse: collapse; text-align:center;">
	<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>총투표수</td>
	</tr>
<%


try{
	
	String sql = "SELECT ";
    sql+= " M.m_no, M.m_name, count(*) AS v_total";
    sql+= " FROM tbl_member_202005 M, tbl_vote_202005 V";
    sql+= " WHERE M.m_no = V.m_no AND V.v_confirm = 'Y' ";
    sql+= " GROUP BY M.m_no, M.m_name";
    sql+= " ORDER BY v_total DESC";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	
	while(rs.next()){
		
		//int vtotal = rs.getInt("vtotal");
		
%>


<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
	
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
<jsp:include page="footer.jsp"/>
</body>
</html>
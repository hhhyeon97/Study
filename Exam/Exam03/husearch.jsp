<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 조회</title>
<style>
table td {
	width:100px;
	text-align:center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>

<section  style="position:fixed; background-color:#98b5d4;
top:70px; left:0px; width:100%; height:100%; ">
<h2 style="text-align:center;">후보 조회</h2>
<form style="display:flex; align-items: center; justify-content: center;">
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>


<%

request.setCharacterEncoding("UTF-8");

String sql = "select m_no,m_name,tm.p_code,p_school,m_jumin,m_city,p_tel1,p_tel2,p_tel3 "+
				"from tbl_member_202005 tm, tbl_party_202005 tp "+
				"where tm.p_code=tp.p_code order by m_no";

PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

try{
	
	while(rs.next()){
		
		String t_tel = rs.getString(7)+rs.getString(8)+rs.getString(9);
		
		String phone = t_tel.substring(0,2)+"-"+t_tel.substring(2,7)+"-"+t_tel.substring(7,11);

		String m_jumin = rs.getString(5);
		
		String jumin = m_jumin.substring(0,6)+"-"+m_jumin.substring(6,13);

		
		String p_school = rs.getString(4);
		
		String school="";
		if(p_school.equals("1")) {
			school="고졸";
		}
		else if(p_school.equals("2")) {
			school="학사";
		}
		else if(p_school.equals("3")) {
			school="석사";
		}
		else if(p_school.equals("4")) {
			school="박사";
		}
		
%>

	<tr>
		<td><%=rs.getString(1) %> </td>
		<td><%=rs.getString(2) %> </td>
		<td><%=rs.getString(3) %> </td>
		<td><%=school%></td>
		<td style="width: 170px;"><%=jumin%> </td>
		<td><%=rs.getString(6) %> </td>
		<td><%=phone%> </td>
	</tr>



<%		
		
	}
	
	
}catch(Exception e){
	e.printStackTrace();
}



%>




	</table>
</form>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
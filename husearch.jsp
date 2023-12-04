<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
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

try{
	//String sql="select mem_m_no,m_name,par.p_code,p_school,m_jumin,m_city,concat(p_tel1,'-',p_tel2,'-',p_tel3)as phone "
	//		+"from tbl_member_202005 mem, tbl_party_202005 par "+
	//		"where mem.p_code = par.p_code";
	
	String sql2="select v_jumin,v_name,m_no,v_time,v_area,v_confirm from tbl_vote_202005";
		PreparedStatement pstmt=con.prepareStatement(sql2);
		ResultSet rs=pstmt.executeQuery();
	
	while(rs.next()){
		
		//String a = rs.getString(7)+rs.getString(8)+rs.getString(9);
		//String phone = a.substring(0,3)+"-"+a.substring(3,7)+"-"+a.substring(7,11);
	/* 	String p=rs.getString(7);
		String phone=p.substring(0,3)+"-"+p.substring(3,7)+"-"+p.substring(7,11);
		
		String b = rs.getString(4); // 3 또는 4 출력 
		if(b.equals("1")) b="고졸";
		else b="대졸";
		 */
		 
		 String a =rs.getString(6);
		 String msg;
		 if(a.equals("Y")) msg="확인";
		 else msg="미확인";
		 
		 String b=rs.getString(1);
		 String ju1=b.substring(0,2);
		 String ju2=b.substring(2,4);
		 String ju3=b.substring(4,6);
		 
		 String birth=ju1+"년"+ju2+"월"+ju3+"일";
		
		 String c=rs.getString(4);
		 String tt=c.substring(0,2)+":"+c.substring(2,4);
		 
		 %>
			<tr>
				<td><%=birth%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=tt%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=msg%></td>
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
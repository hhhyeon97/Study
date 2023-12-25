<%@include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style="position:fixed; top:70px;
left:0px; width:100%; height:100%;
background-color:#98b5d4;">
<h2 style="text-align:center;">투표검수조회</h2>

<form style="display:flex; align-center:center; justify-content: center;">


<table border="1" style="text-align:center;">

	<tr>
		<td style="width:80px;">성명</td>
		<td style="width:140px;">생년월일</td>
		<td>나이</td>
		<td>성별</td>
		<td>후보번호</td>
		<td>투표시간</td>
		<td>유권자확인</td>
	</tr>

<%
request.setCharacterEncoding("UTF-8");

String sql="select v_name,v_jumin,v_jumin,v_jumin,m_no,v_time,v_confirm "+
			"from tbl_vote_202005 where v_area='제1투표장' order by v_time";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();


try{
	while(rs.next()){
		
		
		String v_confirm = rs.getString(7);
		String confirm;
		if(v_confirm.equals("Y")){
			confirm="확인";
		}else{
			confirm="미확인";
		}
		
		String a=rs.getString(2);
		
		String jumin = "19"+a.substring(0,2)+"년"+a.substring(2,4)+"월"+a.substring(4,6)+"일생";
		
		String v_time = rs.getString(6);
		
		String time = v_time.substring(0,2)+":"+v_time.substring(2,4);
		
		String b = rs.getString(4);
		String c = b.substring(6,7);
		String gender;
		if(c.equals("1")){
			gender="남";
		}else{
			gender="여";
		}
	
		int age=Integer.parseInt(rs.getString(3).substring(0,2));
		
		age= 2023-(1900+age)+1;
		
		
		%>

<tr>
	<td><%=rs.getString(1)%> </td>
	<td><%=jumin %> </td>
	<td><%="만"+age+"세"%> </td>
	<td><%=gender%> </td>
	<td><%=rs.getString(5) %> </td>
	<td><%=time%> </td>
	<td><%=confirm%> </td>
	
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
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
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

<tr>

<td>과목코드</td>
<td>과목명</td>
<td>학점</td>
<td>담당강사</td>
<td>요일</td>
<td>시작시간</td>
<td>종료시간</td>
<td>삭제</td>


</tr>

<%

request.setCharacterEncoding("UTF-8");

try{
		// 데이터 안 불러와졌던 이유 !!! sql문때문이 아니라 데이터 commit 안 해서 ^^... 
	//String sql ="select id, co.name cname, credit, le.name lname, week, start_hour, end_hour from course_tbl co, lecturer_tbl le WHERE co.lecturer = le.idx";
			String sql2="select id, co.name cname, credit, le.name lname, week, start_hour, end_hour from course_tbl co,lecturer_tbl le where co.lecturer = le.idx order by id";
			PreparedStatement pstmt = con.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();

			
	while(rs.next()){
		
		
		String a = rs.getString(5);
		switch(a){
		case "1" : a="월요일"; break;
		case "2" : a="화요일"; break;
		case "3" : a="수요일"; break;
		case "4" : a="목요일"; break;
		case "5" : a="금요일"; break;
		}
		
		String start_hour = rs.getString(6);
		while(start_hour.length()<4){
			start_hour = "0"+start_hour;
		}
		String start = start_hour.substring(0,2)+"시"+start_hour.substring(2,4)+"분";

		String end_hour = rs.getString(7);
		while(end_hour.length()<4){
			end_hour = "0"+end_hour;
		}
		String end = end_hour.substring(0,2)+"시"+end_hour.substring(2,4)+"분";

%>
	<tr>
		<td><a href="modify.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=a%></td>
		<td><%=start%></td>
		<td><%=end%></td>		<!-- 주소창은 다 붙여써야 함 !!  -->
		<td><a href="action.jsp?id=<%=rs.getString(1)%>&mode=delete">삭제</a></td>
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
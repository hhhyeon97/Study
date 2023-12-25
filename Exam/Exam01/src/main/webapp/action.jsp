<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8"); //한글깨짐 방지

Connection conn=null;
Statement stmt=null;
				// 외부파일로부터 데이터 불러오는 것!
String mode = request.getParameter("mode");

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
				
				
				
				
try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql="";
	
	switch(mode){
									// 입력받는형식은 20231130 - >  2023-11-30 되게 하려면
									// 날짜 함수 TO_DATE('날짜','형식') 사용
									// 20231130 to_date('20231130','yyyy-MM-dd')
	case "insert" :
		sql = "insert into member_tbl_02 values("+ custno +","+"'"+custname+"',"+
	"'"+phone+"',"+"'"+address+"',"+
		"TO_DATE('"+joindate+"', 'yyyy-MM-dd'),"+"'"+grade+"',"+"'"+city+"')";
		
	stmt.executeUpdate(sql); 
%>
		<jsp:forward page="join.jsp"></jsp:forward> 
		<!-- 액션 작업 끝난 후 페이지 이동할 곳 지정하는 거 -->
<%
		break;
	
	// update member set custname='김행복' where custname='김뿌듯';
	case "modify" :	
		sql = "update member_tbl_02 set "+
			"custname = '"+custname+"',"+
			"phone = '"+phone+"',"+
			"address = '"+address+"',"+
			"joindate = TO_DATE('"+joindate+"', 'yyyy-MM-dd'),"+
			"grade = '"+grade+"',"+"city = '"+city+"'"+"WHERE custno = " + custno ;
		
		stmt.executeUpdate(sql);
%>
<jsp:forward page="modify.jsp"></jsp:forward>
<%		
	  break;
	}
}
catch(Exception e){ // 예외처리
	e.printStackTrace();
}
%>
</body>
</html>
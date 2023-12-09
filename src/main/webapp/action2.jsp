<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
request.setCharacterEncoding("UTF-8");
				// 외부에서 데이터 받아오기 
String empno = request.getParameter("empno");

try{
	
	String sql="select * from tbl_resv_202108 where empno=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	
	pstmt.setString(1, empno);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		%>
		<jsp:forward page="success.jsp"></jsp:forward>
		
		<%
	}else {
		%>
		<jsp:forward page="fail.jsp"></jsp:forward>
		<%
	}
	
}
catch(Exception e){
	
	e.printStackTrace();
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table td{
	padding:5px;
}
input{
	
}
</style>
<body>
<jsp:include page="header.jsp"/>
<script type="text/javascript" src="check.js"></script>
<section style="position:fixed; background-color:#98b5d4;
top:70px; left:0px; width:100%; height:100%; ">
<h2 style="text-align:center;">투표하기</h2>

<form name="frm" action="action.jsp" style="display:flex; align-items: center; justify-content: center;">
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>주민번호</th>
			<td><input type="text" size="30" name="v_jumin"></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="v_name"></td>
		</tr>
				<tr>
			<th>투표번호</th>
			<td><select name="m_no">
			<option value="1">1김후보</option>
			<option value="2">2이후보</option>
			<option value="3">3박후보</option>
			<option value="4">4조후보</option>
			<option value="5">5최후보</option>
			</select>
			</td>
		</tr>
				<tr>
			<th>투표시간</th>
			<td><input type="text" name="v_time"></td>
		</tr>
				<tr>
			<th>투표장소</th>
			<td><input type="text" name="v_area"></td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td><input type="radio" value="Y" name="v_confirm">확인
			<input type="radio" value="N" name="v_confirm">미확인</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
			<input type="button" value="투표하기" onclick="add()">
			<input type="button" value="다시하기" onclick="res()">
			</td>
		</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
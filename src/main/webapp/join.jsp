<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>						<!-- src : 불러올 파일명 -->
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp" />

<section style="position:fixed; top:60px; width:100%; height:100%;
background-color:lightgray;">
<h3 style="text-align: center"> <b>홈쇼핑 회원 등록</b></h3><br>


<!--폼태그에 있어 name은 폼값을 넘기기 위해서 사용된다. -->
						<!-- 테이블 정렬 / 수직 정렬 / 수평 정렬 -->	
<form name="frm" style="display:flex; align-items: center;
justify-content: center; text-align:center">

<table border="1">

<tr> <!-- 행 (가로)-->
	<td>회원번호(자동발생)</td><!-- 열 (세로)-->
	<td><input type="text" name="custno" readonly></td>
</tr>
<tr> 
	<td>회원성명</td>
	<td><input type="text" name="custname"></td>
</tr>
<tr> 
	<td>회원전화</td>
	<td><input type="text" name="phone"></td>
</tr>
<tr> 
	<td>회원주소</td>
	<td><input type="text" name="address"></td>
</tr>
<tr> 
	<td>가입일자</td>
	<td><input type="text" name="joindate"></td>
</tr>
<tr> 
	<td>고객등급(A:VIP,B:일반,C:직원)</td>
	<td><input type="text" name="grade"></td>
</tr>
<tr> 
	<td>도시코드</td>
	<td><input type="text" name="city"></td>
</tr>
<tr>
	<td colspan="2"> <!-- 열 합치기 -->	<!-- 클릭 이벤트 : onclick="return 함수();" -->
	<input type="submit" value="등록" onclick="return joinCheck();"> <!-- submit은 보통 제출할 자료가 있을 때 -->
	<input type="button" value="조회" onclick="return search();"> <!-- button으로는 회원조회 할 예정 -->
	</td>
</tr>
</table>

</form>

</section>

<jsp:include page="footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link rel="stylesheet" href="style2.css">
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp" />
<section>
<h2>수강신청</h2>
<form action="action.jsp" name="frm">
<table border="1">
	<tr>
		<td style="text-align:center;">수강월</td>
		<td><input type="text" name="resist_month" style="width:150px"> 예) 202203 </td>
	</tr>
	<tr>
		<td style="text-align:center;">회원명</td>
		<td>
			<select name="c_name" style="width:150px" onchange="getvalue(this.value)">
				<option value="">회원명</option>
				<option value="10001">홍길동</option>
				<option value="10002">김초초</option>
				<option value="10003">이둥둥</option>
				<option value="20001">강수수</option>
				<option value="20002">홍길동</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">회원번호</td>
		<td><input id="c_no" name="c_no" readonly style="width:150px"> </td>
	</tr>
	
	<tr>
		<td style="text-align:center;">강의장소</td>
		<td>
		<input type="radio" name="class_area" value="강남본원">강남본원
		<input type="radio" name="class_area" value="서초본원">서초본원
		<input type="radio" name="class_area" value="마포본원">마포본원
		<input type="radio" name="class_area" value="종로본원">종로본원
		<input type="radio" name="class_area" value="노원본원">노원본원
		</td>
	</tr>
	
	<tr>
		<td style="text-align:center;" >강의명</td>
		<td>
			<select name="class_name" style="width:150px" onchange="getvalue2(this.value)">
				<option value="">강의신청</option>
				<option value="100000">초급반</option>
				<option value="200000">중급반</option>
				<option value="300000">고급반</option>
				<option value="400000">심화반</option>
			</select>
		</td>
	</tr>

	<tr>
		<td style="text-align:center;">수강료</td>
		<td>
		<input id="tuition" name="tuition" readonly>
		</td>
	</tr>

	<tr style="text-align:center;">
		<td colspan="2"> 
			<input type="button" value="수강신청" onclick="add()">&nbsp;
			<input type="button" value="다시쓰기" onclick="res()">
		</td>
	</tr>


</table>
</form>

</section>
<jsp:include page="footer.jsp" />
</body>
</html>
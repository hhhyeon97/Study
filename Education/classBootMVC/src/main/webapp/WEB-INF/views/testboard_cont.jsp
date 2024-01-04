<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용보기</title>
</head>
<body>
	<div id="bCont_wrap">
		<h2 class="bCont_title">게시판 내용보기</h2>
		<table id="bCont_t">
			<tr>
				<th>제목</th>
				<td>${tb.btitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${bcont}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${tb.bhit}</td>
			</tr>
		</table>
		<div id="bCont_menu">
			<input type="button" value="목록"
				onclick="location='testboard_list';" />
		</div>
	</div>
</body>
</html>
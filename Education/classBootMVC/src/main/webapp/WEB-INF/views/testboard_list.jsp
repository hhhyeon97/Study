<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<form method="get" action="testboard_list">
		<div id="bList_wrap">
			<h2 class="bList_title">게시판 목록</h2>
			<div class="bList_count">글개수: ${listcount} 개</div>
			<table id="bList_t">
				<tr>
					<th width="6%" height="26">번호</th>
					<th width="50%">제목</th>
					<th width="14%">작성자</th>
					<th width="17%">작성일</th>
					<th width="14%">조회수</th>
				</tr>
				<c:if test="${!empty blist}">
					<c:forEach var="b" items="${blist}">
						<tr>
							<td align="center">${b.bno}</td>						
							<td><a id="titleui"href="aop_cont?no=${b.bno}&state=cont">${b.btitle}</a></td>
							<td align="center">${b.bname}</td>
							<td align="center">${fn:substring(b.bdate,0,10)}</td>
							<td align="center">${b.bhit}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty blist}">
					<tr>
						<th colspan="5">목록이 없습니다!</th>
					</tr>
				</c:if>
			</table>


			<div id="bList_menu">
				<input type="button" value="글쓰기"
					onclick="location='testboard_write';"/>
			</div>

		
	</form>
</body>
</html>
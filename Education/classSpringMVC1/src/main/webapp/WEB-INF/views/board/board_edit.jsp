<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 MVC 게시판 수정</title>
<!-- BoardVO에 생성한 변수명과 일치시키기!!! -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery cdn 최신 주소 -->
<script type="text/javascript">
	function check(){
		
		if($.trim($('#writer').val())==''){
			alert('글쓴이를 입력하세요!');
			$('#writer').val('').focus();
			return false;
		}
		if($.trim($('#title').val()).length==0){
			alert('글제목을 입력하세요!');
			$('#title').val('').focus();
			return false;
		}
		
		if($.trim($('#content').val())==""){
			alert('글내용을 입력하세요!');
			$('#content').val('').focus();
			return false;
		}
	}
	
</script>
<style>

*{
	text-align:center;
}

form{

  	display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    max-width: 400px; /* 최대 너비 설정 */
    margin: 70px auto 0; /* 상단 여백 추가 */ 
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
    background-color: white; /* 배경색 추가 */
    
}
.click {
	margin-top:10px;
}
</style>
</head>
<body>
<form method="post" action="board_edit_ok" onsubmit="return check();"> 
	<input type="hidden" name="bno" value="${b.bno}">
	<%--히든은 브라우저 상에서는 만들어지지 않는다. 하지만 값을 네임피라미터 이름에 담아서 전달할 때 사용한다.
		브라우저 출력창에서 페이지 소스보기 하면 hidden이 노출되기 때문에 보안상 중요한 비번 값은 값은 히든으로 전달하는 것이 아니다. --%>
	
	<input type="hidden" name="page" value="${page}">
	<%--책갈피 기능때문에 쪽번호 전달 --%>
	
	<h2>스프링 MVC 게시판 수정폼</h2>
	글쓴이 <input name="writer" id="writer" size="14" value="${b.writer}"><br><br>
	글제목 <input name="title" id="title" size="36" value="${b.title}"><br><br>
	글내용 <textarea name="content" id="content" rows="10" cols="36">${b.content}</textarea>
	
	<hr>
	<div class="click">
	<input type="submit" value="수정">
	<input type="reset" value="취소" onclick="$('#writer').focus();">
	<input type="button" value="목록" onclick="location='/controller/board/board_list?page=${page}';">
	</div>
	<%--페이징에서 책갈피 기능을 구현하기 위해서 board_list?page=쪽번호를 get방식으로 전달하면
	내가 본 페이지 번호로 바로 이동한다. --%>

<%--테이블 태그로도 만드는 연습해보기! --%>

</form>
</body>
</html>
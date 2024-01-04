<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 MVC 게시판 글쓰기</title>
<!-- BoardVO에 생성한 변수명과 일치시키는 게 좋음 ! -->
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
<form method="post" onsubmit="return check();"> <%--action속성을 생략하면 이전 매핑주소인 board_write가 액션 매핑주소가 된다.
										같은 컨트롤러에서 동일 매핑주소가 사용되면 method방식인 get or post등으로 구분한다. --%>
	<h2>스프링 MVC 게시판 입력폼</h2>
	글쓴이 <input name="writer" id="writer" size="14"><br><br>
	글제목 <input name="title" id="title" size="36"><br><br>
	글내용 <textarea name="content" id="content" rows="10" cols="36"></textarea>
	
	<hr>
	<div class="click">
	<input type="submit" value="저장">
	<input type="reset" value="취소" onclick="$('#writer').focus();">
	<input type="button" value="목록" onclick="location='/controller/board/board_list?page=${page}';">
	</div>
	<%--페이징에서 책갈피 기능을 구현하기 위해서 board_list?page=쪽번호를 get방식으로 전달하면
	내가 본 페이지 번호로 바로 이동한다. --%>

<%--테이블 태그로도 만드는 연습해보기! --%>

</form>
</body>
</html>
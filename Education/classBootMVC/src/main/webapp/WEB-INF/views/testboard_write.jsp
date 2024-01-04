<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study 글쓰기 폼</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function check(){
		if($.trim($('#test_name').val())==''){
			alert('작성자를 입력하세요!');
			$('#test_name').val('').focus();
			return false;
		}
		if($.trim($('#test_title').val())==''){
			alert('글제목을 입력하세요!');
			$('#test_title').val('').focus();
			return false;
		}
		if($.trim($('#test_cont').val())==''){
			alert('글 내용을 입력하세요!');
			$('#test_cont').val('').focus();
			return false;
		}
	}
</script>
</head>
<body>  <!-- name 파라미터 이름과 vo에 있는 변수명과 일치해주면 자동으로 엔티티빈에 데이터가 저장되고 ! id 이름은 스크립트에서 아이디 선택자를 이용해 검증한는 부분과 맞춰 주는 것!! -->
																							<!-- 헷갈리지 않으려면 id,name 전부 맞춰주는게 좋은 듯! -->
<form method="post" action="testboard_ok" onsubmit='return check();'>
작성자  <input name="bname" id="test_name" size="36"><br>
제목 <input name="btitle" id="test_title" size="36"><br><br>
내용 <textarea name="bcont" id="test_cont" rows="10" cols="34"></textarea>
<hr>
<input type="submit" value="입력">
<input type="button" value="목록" onclick="location='testboard_list';">
<input type="reset" value="취소">

</form>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

#css{
	width:100%;/* 뷰포트 너비에 맞추기 */
    max-width: 600px; /* 최대 너비 설정 */
    height: auto; /* 내용에 맞게 높이 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    margin-top:50px;
    padding: 40px;
    box-sizing: border-box;
    border: 2px solid rgba(255,255,255, .2);
    backdrop-filter : blur(20px);
	box-shadow:0 0 10px rgba(0, 0, 0, .2);
	border-radius: 5px;
	text-align:center;
}
</style>
</head>
<body>
<div id="css">
<h2>스프링 MVC 이진파일 업로드</h2>
<form method="post" action="uploadFormAction" enctype="multipart/form-data">
<%-- 파일 첨부기능인 자료실 기능을 만들 때 주의사항 ) 
	1. method=post 방식으로 사용해야 한다. method속성을 생략하면 기본값이 get방식이다. 
	get방식으로는 파일 첨부 기능을 만들 수 없다. 즉 자료실 기능을 만들 수 없기 때문에 method 속성을 생략하면 안 된다.
	반드시 post로 해야 자료실 기능인 파일 첨부 기능을 만들 수 있다.
	
	2. form 태그 내에 enctype="multipart/form-data" 속성을 지정해야 자료실 기능인 파일첨부를 만들 수 있다. 
 --%>
 <input type="file" name="uploadFile" multiple>
 <%-- 최근 브라우저에서는 multiple 속성을 지원하는데 이를 사용하면 하나의 첨부파일뿐만 아니라 다중 첨부 파일도 처리가 가능하다.
 	이 속성은 IE 10 이상의 버전에서만 지원된다. --%>
 <input type="submit" value="파일 업로드">
</form>
</div>
</body>
</html>
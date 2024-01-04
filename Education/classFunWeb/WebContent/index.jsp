<%@ page contentType="text/html; charset=UTF-8"%>
<%--jsp 주석문 기호 %@ 를 지시자 즉 디렉티브라고 한다.
페이지에 어떤 정의문을 내리는 것을 말한다. 
contentType="text/html;charset=UTF-8"의 의미는 웹브라우저에 출력되는 문자와 태그, 언어 코딩 타입을 utf-8로 설정하라는 의미이다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Fun Web!</title>
<link rel="stylesheet" type="text/css" href="./css/default.css">
</head>
<body>
<div id="wrap">


<header>	<%-- header 태그는 html5에서 추가된 것으로 헤더 즉 상단 부분을 지정할 때 사용한다. --%>

<div id="login"><a href="#">login</a>	|	<a href="./member/join.jsp">Join</a></div>

<div class="clear"></div>

<%-- 회사 로고 --%>
<div id="logo">
<a href="index.jsp">
	<img src="./images/logo.gif" width="265" height="62" alt="Fun Web">
</a></div>

<%--상단 메뉴 --%>
<nav>	<%-- nav 태그 : html5에서 추가된 것으로 메뉴 구성할 때 사용한다. --%>
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="./company/welcome.jsp">Company</a></li>
<li><a href="#">Solutions</a></li>
<li><a href="./center/notice.jsp">Customer Center</a></li>
<li><a href="#">Contact Us</a></li>
</ul>
</nav>
</header>


<div class="clear"></div>

<%--메인 본문 이미지 --%>
<div id="main_img">
<img src="./images/main_img.jpg" width="971" height="282">
</div>

<div class="clear"></div>
<%--메인본문 --%>
<article id="main_cont">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem ..Ut vel est</p>
<p>Lorem ..Ut vel est</p>
<p>Lorem ..Ut vel est</p>
</div>

<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem ... Ut vel est</p>
<p>Lorem ... Ut vel est</p>
<p>Lorem ... Ut vel est</p>
</div>

<div id="payment">
<h3>Web payment Solution</h3>
<p>Lorem ... Ut vel est</p>
<p>Lorem ... Ut vel est</p>
<p>Lorem ... Ut vel est</p>
</div>
</div>

<div class="clear"></div>

<div id="sec_news">

<h3><span class="orange">Security</span> News </h3>
<dl> <%--정의 리스트 태그 --%>
<dt><a href="#">Vivamus ... quis ... nisi</a></dt> <%-- dt : 제목 --%>
<dd><a href="#">Proin ... ante ...risus.</a></dd>	<%-- dd 설명 부분 ... 약간 들여쓰기 들어감! --%>

<dt><a href="#">Vivamus ... quis ... nisi</a></dt> 
<dd><a href="#">Proin ... ante ...risus.</a></dd>

<dt><a href="#">Vivamus ... quis ... nisi</a></dt>
<dd><a href="#">Proin ... ante ...risus.</a></dd>

<dt><a href="#">Vivamus ... quis ... nisi</a></dt> 
<dd><a href="#">Proin ... ante ...risus.</a></dd>
</dl>
</div>

<%--공지 목록 --%>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3> <%-- &amp; 특수문자는 & 기호로 표시 --%>
<table>
<tr>
<td class="contxt"><a href="#">Vivamus ...id... nisi</a></td>
<td> <a href="#">2023.08.08</a></td>
</tr>

<tr>
<td class="contxt"><a href="#">Vivamus ...id... nisi</a></td>
<td> <a href="#">2023.08.08</a></td>
</tr>

<tr>
<td class="contxt"><a href="#">Vivamus ...id... nisi</a></td>
<td> <a href="#">2023.08.08</a></td>
</tr>

<tr>
<td class="contxt"><a href="#">Vivamus ...id... nisi</a></td>
<td> <a href="#">2023.08.08</a></td>
</tr>

<tr>
<td class="contxt"><a href="#">Vivamus ...id... nisi</a></td>
<td> <a href="#">2023.08.08</a></td>
</tr>

</table>

</div>
</article>
<div class="clear"></div> <%-- 유일 아이디로 큰 ui 영역은 id 선택자... class는 범위 안에서 자주 쓰이는데 공통적으로 쓸 때 ..%>

<%--메인하단영역 --%>
<footer>		<%--footer 태그는 html5에서 추가된 것으로 하단영역을 지정할 때 사용 --%>
<hr>
<div id="copy">

All contents CopyRight 2023 FunWeb Inc. all righs reserved<br>
Contact mail: funweb@funwebbiz.com Tel : +82 64 123 4315 Fax +82 64 123 5678
</div>

<div id="social">
<img src="./images/facebook.gif" width="33" height="33" alt="FaceBook">
<img src="./images/twitter.gif" width="33" height="34" alt="Twitter">

</div>

</footer>
</div>
</body>
</html>
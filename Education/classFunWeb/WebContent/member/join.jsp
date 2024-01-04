<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<%-- 서브 메인 이미지 --%>
<div id="sub_img_member"></div>

<div class="clear"></div>

<%-- 서브 메뉴 --%>
<div id="sub_menu">
<ul>
<li><a href="join.jsp">Join Us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</div>

<%-- 서브 메인 본문 --%> <%--회원가입 폼 입력 박스--%>
<div id="sub_main_cont">
	<h1>Join Us</h1>
	<form id="join">
	<fieldset>	<%--fieldset은 폼입력 양식을 그룹화 해서, 그룹 경계선을 만들어 준다. --%>
		<legend>Basic Info</legend> <%-- legend 태그는 fieldset제목을 정의해준다.--%>
		
		<label>User Id</label>
		<input type="text" class="id"> <input type="button" value="IdCheck" class="dub">
		<br>
		<label>Password</label>
		<input type="password" class="pass"><br>
		
		<label>Retype Password</label>
		<input type="password" class="pass"><br>
		
		<label>Name</label>
		<input type="text" class="nick"><br>
		
		<label>E-Mail</label>
		<input type="email" class="email"><br>
		
		<label>Retype E-Mail</label>
		<input type="email" class="email"><br>
	</fieldset>
	
	<%--부가정보 옵션 --%>
	<fieldset>
	<legend>Optional Info</legend>
	<label>Address</label>
	<input type="text" class="address"><br>
	
	<label>Phone Number</label>
	<input type="tel" class="phone"><br>
	
	<label>Tel Number</label>
	<input type="tel" class="phone"><br>
	</fieldset>
	
	<div class="clear"></div>
	<%--버튼 --%>
	<div id="buttons">
	<input type="button" value="Submit" class="submit">
	<input type="button" value="Cancel" class="cancel">
	</div>
	</form>
</div>

<jsp:include page="../include/footer.jsp" />
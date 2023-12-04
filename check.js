/**
 * 
 */

 
function add(){
	if(frm.v_jumin.value.length==0){
		alert("주민번호 입력하세요!");
		frm.v_jumin.focus();
		return false;
	}
	else{
		alert("투표 성공!");
		document.frm.submit();
		return true;
	}
} 
 
 
 
function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}

function search(){
	document.frm2.submit();
}
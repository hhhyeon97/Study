/**
 * 
 */

 
 
function search(){
	if(frm2.empno.value.length==0){
		alert("사원번호가 입력되지 않았습니다!");
		frm2.empno.focus();
		return false;
	}
	else{
		document.frm2.submit();
		return true;
	}
	
}

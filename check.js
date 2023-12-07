/**
 * 
 */

 
function add(){
	if(frm.v_jumin.value.length==0){
		alert("주민번호를 입력하세요!");
		frm.v_jumin.focus();
		return false;
	}
	else if(frm.v_name.value==0){
		alert("성명을 입력하세요!")
		frm.v_name.focus();
		return false;
	}
	else if(frm.m_no.value==0){
		alert("투표번호를 입력하세요!")
		frm.m_no.focus();
		return false;
	}
	else if(frm.v_time.value.length==0){
		alert("투표시간을 입력하세요!")
		frm.v_time.focus();
		return false;
	}	
	else if(frm.v_area.value.length==0){
		alert("투표장소를 입력하세요!")
		frm.v_area.focus();
		return false;
	}		
	else if(frm.v_confirm.value==0){
		alert("유권자 확인을 입력하세요!")
		frm.v_confirm.focus();
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
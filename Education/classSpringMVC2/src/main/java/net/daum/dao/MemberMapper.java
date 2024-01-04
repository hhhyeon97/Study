package net.daum.dao;

import net.daum.vo.MemberVO;

public interface MemberMapper {

	MemberVO readMember(String userid); // 매개변수 userid로 변경

}

package net.daum.dao;

import net.daum.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m); // public abstract이 생략된 추상메서드 - > {}가 없고, 실행문장이 없다.

}

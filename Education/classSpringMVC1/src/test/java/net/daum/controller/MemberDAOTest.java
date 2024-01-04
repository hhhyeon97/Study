package net.daum.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.daum.dao.MemberDAO;
import net.daum.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class MemberDAOTest {

	@Autowired // 자동 의존성 주입
	private MemberDAO memberDao; 
	
	@Test
	public void testInsertMember() throws Exception {
		MemberVO m = new MemberVO();
		
		m.setUserid("kkk"); //회원 아이디 저장
		m.setUserpw("777"); //회원 비번 저장
		m.setUsername("홍길동"); //회원 이름 저장
		m.setEmail("hong@naver.com"); //회원 이메일 저장
		
		this.memberDao.insertMember(m); //회원저장
		//this. 은 생략 가능함.
		
	}
}

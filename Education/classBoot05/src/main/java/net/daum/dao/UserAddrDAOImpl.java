package net.daum.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.UserAddrVO;

@Repository
public class UserAddrDAOImpl implements UserAddrDAO {

	@Autowired // mybatis 수행하기 위한 거
	private SqlSession sqlSession; //mybatis 쿼리문 수행할 sqlSession 의존성 (DI) 설정 
	
	@Autowired  //jpa 수행하기 위한 거 
	private UserAddrRepository userAddrRepo; // JPA를 수행할 Repository 의존성 주입
	
	
	@Override
	public void insertUserAddr(UserAddrVO useraddr) {
		//this.sqlSession.insert("useraddr_in", useraddr); // insert()메서드가 mybatis에서는
														//레코드를 저장해준다. 
		
		// =======위 주석한 부분이 mybatis 관련 아래가 jpa 관련 =========
		
		System.out.println("\n===========> JPA로 이름과 주소 저장");
		this.userAddrRepo.save(useraddr); // this. 생략 가능
	}//이름과 주소 저장 
	
	
	
	
}

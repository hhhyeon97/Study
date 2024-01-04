package net.daum.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updatePoint(String sender, int point) {	//복수개의 피라미터 인자값을 전달할 때는 Map 쓰기 !
		Map<String,Object> pm = new HashMap<>();
		pm.put("sender",sender); //sender 키이름에 보낸 사람 저장
		pm.put("point",10); //point.xml에서는 키이름인 point를 참조하여 값을 가져온다.
		
		this.sqlSession.update("pointUp",pm); //pointUp은 point.xml에서 사용할 유일 아이디명
		
	} // 메세지를 보낸 사람에게 10점 업데이트 
	
}

package net.daum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import net.daum.vo.UserAddrVO;

public interface UserAddrRepository extends JpaRepository<UserAddrVO, Integer> {
														// 제네릭타입에는 기본형 못 들어가므로 참조형으로 넣어주는 것 ! 					

}

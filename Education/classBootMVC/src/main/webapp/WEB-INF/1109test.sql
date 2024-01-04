--1109 tbl_test 테이블 관련 
--test_seq 설정 수정
alter sequence test_seq nocache;
alter sequence test_seq nocycle;

select * from tbl_test;

-- ORA-01841 오류 후 date로 수정 
alter table tbl_test modify (test_regdate date);

--1110

/*
[문제 1] 스프링의 중요한 특징으로 뽑히는 1순위는 ‘의존성 주입’과 관련된 내용입니다. 
그 다음으로 뽑히는 특징은 역시 AOP(Aspect Oriented Programming)라는 기능입니다.
AOP와 더불어 데이터베이스 처리에 가장 중요한 트랜잭션 처리를 함으로써 데이터의 불일치 현상을 제거하고 사이트의 신뢰도를 올릴 수 있습니다.
그러면 다음과 같은 절차에 의해서 AOP를 통한 트랜잭션을 적용해보시길 바랍니다.
 작업수행 순서) 1. 컬럼명으로 bno,bname,btitle,bcont,bhit,bdate 라 하고 자료형으로 
 number(38), varchar2(20), varchar2(100), varchar2(4000), number(38),date를 
   가지는 tbLBoard25이라는 테이블을 생성합니다. 답안 작성은 하지 않습니다.
2. net.daum.controller 패키지에  TestBoardController.java 스프링 컨트롤러 클래스에서 
tbLBoard25테이블에 레코드를 저장하고, 페이징이 안되는 게시판 목록보기를 구현한 다음, 
조회수 증가와 내용보기를 aop_cont 매핑주소 하나에 구현합니다. 조회수 증가와 내용보기 코드만 답안 작성 기술합니다. 
*/

create table tblBoard25(
bno number(38) primary key
,bname varchar2(20) not null
,btitle varchar2(100) not null
,bcont varchar2(4000) not null
,bhit number(38) not null
,bdate date
);

create sequence tbl_board25_seq
  start with 1
  increment by 1
  nocache;


select * from tblBoard25;


commit;



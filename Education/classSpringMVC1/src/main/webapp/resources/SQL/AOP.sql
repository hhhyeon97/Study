

-- 스프링 AOP와 트랜잭션 실습을 위한 샘플 테이블 설계(생성)
create table tbl_user(

    uid2 varchar2(50) primary key --회원아이디 --uid는 오라클이 사용중이라 변경해줌.
    ,upw varchar2(100) not null --비번
    ,uname varchar2(20) not null --회원이름
    ,upoint number(38) default 0 -- 메세지가 보내지면 포인트 점수 10점 업데이트 
);

insert into tbl_user (uid2,upw,uname) values('user00','12345','홍추추');
insert into tbl_user (uid2,upw,uname) values('user01','56789','이동동');

select * from tbl_user order by uid2 asc;
-- 내가 트랜잭션 설정 하기 전에 한 번 더 테스트 잘 못 해서 안 맞음 지금 ... 이거 해결하려면 ? 

--tbl_message 테이블 생성 
create table tbl_message(
    mid number(38) primary key
    ,targetid varchar2(50) not null --외래키(foreign key)추가 설정  = > tbl_user 테이블의 uid2 컬럼 레코드 아이디값만 참조해 저장됨.
    ,sender varchar2(50) not null --메세지를 보낸 사람
    ,message varchar2(4000) --보낸 메세지
    ,senddate timestamp --보낸 날짜 
);

select * from tbl_message order by mid asc;

delete from tbl_message where mid=4;
delete from tbl_message where mid=3;

commit;

--targetid 외래키 추가 설정
alter table tbl_message add constraint tbl_message_targetid_fk
foreign key(targetid) references tbl_user(uid2);

-- mid_no_seq 시퀀스 생성
create sequence mid_no_seq
start with 1    --1부터 시작
increment by 1  --1씩 증가
nocache     --임시 메모리 사용 x
nocycle;    --시퀀스 최대값 번호 발생 후 번호값 발생 안 함. 다시 처음부터 반복 안 함.


--mid_no_seq 다음 시퀀스 번호값 확인
select mid_no_seq.nextval as "다음 시퀀스 번호값"from dual;


--오토커밋이 안 되므로 직접 커밋 해주어야 함!
commit;

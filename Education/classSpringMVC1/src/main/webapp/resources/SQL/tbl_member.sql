
--0905

--tbl_member 테이블 생성
create table tbl_member(
    userid varchar2(50) primary key --회원아이디
    ,userpw varchar2(100) not null --회원 비밀번호
    ,username varchar2(50) not null --회원 이름
    ,email varchar2(100) --이메일
    ,regdate timestamp default sysdate -- default sysdate 제약 조건이 설정되어서 해당 컬럼에 굳이
    --레코드를 저장하지 않아도 기본 날짜값이 저장된다.
);

select * from tbl_member order by userid asc;

commit;



-- 스프링 시큐리티에서 지정된 테이블을 생성
create table users(
    username varchar2(50) primary key -- 회원 아이디
    ,password varchar2(50) not null --회원 비밀번호
    ,enabled char(1) default '1'
);


insert into users(username,password) values('user00','pw00');
insert into users(username,password) values('member00','pw00');
insert into users(username,password) values('admin00','pw00');

select * from users order by username; --아이디를 기준으로 오름차순 정렬

commit;


-- authorities 테이블 생성
create table authorities(
    username varchar2(50) not null --회원 아이디 - > 외래키로 추가 설정
    ,authority varchar2(50) not null --아이디에 부여된 권한 
    ,constraint authorities_username_fk  foreign key(username) references users(username)
    -- 외래키 설정 : username 컬럼은 주인 테이블인 users의 username 기본키 컬럼을 참조하고 있다. 결국 users의 회원아이디값만 저장됨. 주종관계 설정
);

insert into authorities(username,authority) values('user00','ROLE_USER');
insert into authorities(username,authority) values('member00','ROLE_MANAGER');
insert into authorities(username,authority) values('admin00','ROLE_MANAGER');
insert into authorities(username,authority) values('admin00','ROLE_ADMIN');

commit;

select * from authorities order by username;

-- 고유 인덱스 설정 
create unique index idx_auth_username on authorities(username,authority);

-- tbl_member 테이블 생성

drop table tbl_member;



-- 위 테이블들은 시큐리티 내장 테이블 정석대로 간 것이고 지금 만드는 tbl_member는 사용자 정의로 만드는거라서 컬럼명은 일치 하지 않아도 괜찮음?!
create table tbl_member(       -- > 주인 테이블 

    userid varchar2(50) primary key --회원 아이디
    ,userpw varchar2(200) not null --회원 비밀번호
    ,username varchar2(100) not null --회원 이름
    ,regdate timestamp default sysdate --등록 날짜
    ,updatedate timestamp default sysdate --수정 날짜
    ,enabled char(1) default '1'
);

select * from tbl_member order by userid;

-- 권한 부여 테이블 ( 종속 테이블 ) 

create table tbl_member_auth(
    userid varchar2(50) not null -- 아이디, 외래키 추가 설정
    ,auth varchar2(100) not null --아이디에 부여된 권한 
    ,constraint tbl_member_auth_userid_fk foreign key(userid) references tbl_member(userid) --외래키 설정
    );


select * from tbl_member_auth order by userid;

delete from tbl_member_auth;

commit;


--★ 0919 자동로그인 관련 

--스프링 시큐리티 자동로그인 정보를 유지하는 테이블 -- > 스프링 부트 + JPA + 시큐리티에서도 동일하게 사용되는 테이블 
create table persistent_logins(
username varchar2(64) not null --회원아이디
,series varchar2(64) primary key --비번
,token varchar2(64) not null --토큰 정보
,last_used timestamp not null --로그인 한 날짜 시간
);

select * from persistent_logins order by username;



















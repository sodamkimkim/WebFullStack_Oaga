-- 언어 설정 확인 명령어
show variables like 'character_set%';
show variables like 'c%';

-- 자바 프로그램에서 스프링 DB접속하는 전용 유저 생성
-- 비밀번호 정책이 낮으면 접근 불가
create user 'ten'@'%' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'%';
flush privileges;

create user 'ten'@'localhost' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'localhost';
flush privileges;

use mysql;
select user, host from user;

-- 데이터 베이스 생성
create database blog;
use blog;

-- -----------위는 참고 코드

create user 'oagaadmin'@'%' identified by 'asd123';
grant all privileges on *.* to 'oagaadmin'@'%';
flush privileges;

create user 'oagaadmin'@'localhost' identified by 'asd123';
grant all privileges on *.* to 'oagaadmin'@'localhost';
flush privileges;

use mysql;
select user, host from user;

create database oaga;
use oaga;

desc user;
select * from user;
desc review;
select * from review;
desc reply;
select * from reply;

select count(*) from review group by userId having userId = 2;

-- 좋아요 수 변경 쿼리
update user set likes = '23' where id = 1;
update user set likes = '37' where id = 2;


-- 좋아요가 많은 순서대로 user 정보 가져오는 쿼리문
select * from user order by likes desc limit 4;




-- 베스트 리뷰 출력createDate
select * from review order by count desc limit 6;
-- 베스트 리뷰어 출력
select * from user order by likes desc limit 5;

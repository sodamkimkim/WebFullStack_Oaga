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

select * from review;
select * from reply;

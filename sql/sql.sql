-- 언어 설정 확인 명령어
SHOW VARIABLES LIKE 'character_set%';
SHOW VARIABLES LIKE 'c%';

-- 자바 프로그램에서 스프링 DB접속하는 전용 유저 생성
-- 비밀번호 정책이 낮으면 접근 불가
CREATE USER 'ten'@'%' IDENTIFIED BY '1q2w3e4r5t!';
GRANT ALL PRIVILEGES ON *.* TO 'ten'@'%';
FLUSH PRIVILEGES;

CREATE USER 'ten'@'localhost' IDENTIFIED BY '1q2w3e4r5t!';
GRANT ALL PRIVILEGES ON *.* TO 'ten'@'localhost';
FLUSH PRIVILEGES;

USE mysql;
SELECT user, host FROM user;

-- 데이터 베이스 생성
CREATE DATABASE blog;
USE blog;

-- -----------위는 참고 코드

CREATE USER 'oagaadmin'@'%' IDENTIFIED BY 'asd123';
GRANT ALL PRIVILEGES ON *.* TO 'oagaadmin'@'%';
FLUSH PRIVILEGES;

CREATE USER 'oagaadmin'@'localhost' IDENTIFIED BY 'asd123';
GRANT ALL PRIVILEGES ON *.* TO 'oagaadmin'@'localhost';
FLUSH PRIVILEGES;

USE mysql;
SELECT user, host FROM user;

CREATE DATABASE oaga;
USE oaga;

DESC user;
SELECT * FROM user;
DESC review;
SELECT * FROM review;
DESC reply;
SELECT * FROM reply;

SELECT COUNT(*) FROM review GROUP BY userId HAVING userId = 2;

-- 좋아요 수 변경 쿼리
UPDATE user SET likes = '23' WHERE id = 1;
UPDATE user SET likes = '37' WHERE id = 2;

-- username으로 자기 리뷰 가져오기
SELECT r.*, u.username AS username  FROM review AS r
LEFT JOIN user AS u ON r.userId = u.id
WHERE u.username = 1;



-- 좋아요가 많은 순서대로 user 정보 가져오는 쿼리문
SELECT * FROM user ORDER BY likes DESC LIMIT 4;




-- 베스트 리뷰 출력createDate
SELECT * FROM review ORDER BY count DESC LIMIT 6;
-- 베스트 리뷰어 출력
SELECT * FROM user ORDER BY likes DESC LIMIT 5;

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


desc user;
select * from user;
desc review;
select * from review;
desc reply;
select * from reply;
desc follow;
select * from follow;


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


INSERT INTO area values(1,'서울',"아무거나",'https://picsum.photos/id/237/200/300');
INSERT INTO area values(2,'부산',"아무거나",'https://picsum.photos/id/237/200/300');
INSERT INTO area values(3,'대구',"아무거나",'https://picsum.photos/id/237/200/300');
INSERT INTO area values(4,'제주도',"아무거나",'https://picsum.photos/id/237/200/300');
INSERT INTO area values(5,'인천',"아무거나",'https://picsum.photos/id/237/200/300');


INSERT INTO areagu values(1,'아무거나',"강남구",'https://picsum.photos/id/237/200/300',"ㅇㅁㄴ",1);
INSERT INTO areagu values(6,'아무거나',"마포구",'https://picsum.photos/seed/picsum/200/300',"ㅇㅁㄴ",1);
INSERT INTO areagu values(2,'아무거나',"서구",'https://picsum.photos/seed/picsum/200/300',"ㅇㅁㄴ",2);
INSERT INTO areagu values(7,'아무거나',"해운대구",'https://picsum.photos/200/300?grayscale',"ㅇㅁㄴ",2);
INSERT INTO areagu values(11,'아무거나',"광안리",'https://picsum.photos/200/300?grayscale',"ㅇㅁㄴ",2);
INSERT INTO areagu values(12,'아무거나',"기장",'https://picsum.photos/200/300?grayscale',"ㅇㅁㄴ",2);


INSERT INTO guinfo values(1,'강남',"GUINFO","가나다라마바사아자차카타파하",now(),'https://picsum.photos/200/300/?blur',"강남대로","1");
INSERT INTO guinfo values(2,'강남',"GUINFO","딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스",now(),'https://picsum.photos/200/300/?blur',"강남대로 2","1");
INSERT INTO guinfo values(9,'마포',"GUINFO","가나다라마바사아자차카타파하",now(),'https://picsum.photos/200/300/?blur',"강남대로","6");
INSERT INTO guinfo values(10,'강남',"GUINFO","가나다라마바사아자차카타파하",now(),'https://picsum.photos/200/300/?blur',"강남대로10","1");
INSERT INTO guinfo values(3,'해운대',"GUINFO","가나다라마바사아자차카타파하",now(),'https://picsum.photos/200/300/?blur',"좌1","7");
INSERT INTO guinfo values(4,'해운대',"GUINFO","가나다라마바사아자차카타파하",now(),'https://picsum.photos/200/300/?blur',"우1","7");



INSERT INTO restaurant values(1,'강남대로2',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스1",1);
INSERT INTO restaurant values(2,'강남대로2',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스2",1);
INSERT INTO restaurant values(3,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스2",7);
INSERT INTO restaurant values(7,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스7",7);
INSERT INTO restaurant values(8,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스8",7);
INSERT INTO restaurant values(9,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",now(),'https://picsum.photos/200/300/?blur',"딜리셔스9",7);
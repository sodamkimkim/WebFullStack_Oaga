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
DESC follow;
SELECT * FROM follow;

select * from review where userId in(1, 2);

SELECT * FROM area WHERE area LIKE "%부%";

SELECT * FROM user WHERE userNickName LIKE '%%' AND role = 'USER';

DROP DATABASE oaga;

SELECT COUNT(*) FROM review GROUP BY userId HAVING userId = 2;

-- 좋아요 수 변경 쿼리
UPDATE user SET likes = '23' WHERE id = 1;
UPDATE user SET likes = '37' WHERE id = 2;

-- username으로 자기 리뷰 가져오기
SELECT r.*, u.username AS username  FROM review AS r
LEFT JOIN user AS u ON r.userId = u.id
WHERE u.username = 1;

select * from user where oauth = "kakao";

-- 신규 리뷰 순
SELECT * FROM review ORDER BY createDate DESC LIMIT 6;

-- 좋아요가 많은 순서대로 user 정보 가져오는 쿼리문
SELECT * FROM user ORDER BY likes DESC LIMIT 4;

-- 임시저장 데이터가 있는지 확인
SELECT * FROM review WHERE userId = 1 AND isWriting = 'ING';

-- 임시저장 리뷰 제외하고 가져오기
SELECT * FROM review WHERE isWriting = "DONE";

-- 베스트 리뷰 출력createDate
SELECT * FROM review ORDER BY count DESC LIMIT 6;
-- 베스트 리뷰어 출력
SELECT * FROM user ORDER BY likes DESC LIMIT 5;

SELECT * FROM area;
SELECT * FROM areagu;

SELECT * FROM guinfo;
DESC area;

INSERT INTO area VALUES(1,'서울','<img class="area_img" src="https://cdn.pixabay.com/photo/2016/11/02/14/32/lotte-world-tower-1791802_960_720.jpg">');
INSERT INTO area VALUES(2,'부산','<img class="area_img" src="https://cdn.pixabay.com/photo/2021/02/07/18/38/bridge-5992305_960_720.jpg">');
INSERT INTO area VALUES(3,'대구','<img class="area_img" src="https://cdn.pixabay.com/photo/2018/11/26/01/59/korea-3838655_960_720.jpg">');
INSERT INTO area VALUES(4,'제주도','<img class="area_img" src="https://cdn.pixabay.com/photo/2019/09/17/02/20/jeju-4482313_960_720.jpg">');
INSERT INTO area VALUES(5,'인천','<img class="area_img" src="https://cdn.pixabay.com/photo/2017/10/01/09/41/temple-2804716_960_720.jpg">');
INSERT INTO area VALUES(6,'대전','<img class="area_img" src="https://cdn.pixabay.com/photo/2017/08/22/13/44/city-2669015_960_720.jpg">');
INSERT INTO area VALUES(7,'광주','<img class="area_img" src="https://cdn.pixabay.com/photo/2022/02/21/05/18/mountain-7025791_960_720.jpg">');
INSERT INTO area VALUES(8,'울산','<img class="area_img" src="https://cdn.pixabay.com/photo/2019/05/16/09/47/homigot-4206783_960_720.jpg">');
INSERT INTO area VALUES(9,'세종','<img class="area_img" src="https://cdn.pixabay.com/photo/2017/02/22/07/03/gwanghwamun-2088592_960_720.jpg">');
INSERT INTO area VALUES(10,'경기','<img class="area_img" src="https://cdn.pixabay.com/photo/2017/10/09/02/45/korea-2832271_960_720.jpg">');
INSERT INTO area VALUES(11,'강원','<img class="area_img" src="https://cdn.pixabay.com/photo/2019/10/30/07/41/mt-seoraksan-4588906_960_720.jpg">');
INSERT INTO area VALUES(12,'충북','<img class="area_img" src="https://cdn.pixabay.com/photo/2018/02/17/13/08/the-body-of-water-3159920_960_720.jpg">');
INSERT INTO area VALUES(13,'충남','<img class="area_img" src="https://cdn.pixabay.com/photo/2016/08/17/20/05/korea-1601370_960_720.jpg">');
INSERT INTO area VALUES(14,'경북','<img class="area_img" src="https://cdn.pixabay.com/photo/2016/11/02/02/44/dokdo-1790322_960_720.jpg">');
INSERT INTO area VALUES(15,'경남','<img class="area_img" src="https://cdn.pixabay.com/photo/2018/11/16/01/57/unmunsa-3818596_960_720.jpg">');
INSERT INTO area VALUES(16,'전북','<img class="area_img" src="https://cdn.pixabay.com/photo/2018/05/20/13/48/daedunsan-3415802_960_720.jpg">');
INSERT INTO area VALUES(17,'전남','<img class="area_img" src="https://cdn.pixabay.com/photo/2015/11/27/07/19/republic-of-korea-1065103_960_720.jpg">');


INSERT INTO areagu VALUES(1,"강남구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/10/22/04/05/gangnam-3764454_960_720.jpg">',1);
INSERT INTO areagu VALUES(2,"마포구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/10/07/10/06/sky-3729560_960_720.jpg">',1);
INSERT INTO areagu VALUES(3,"서구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/09/10/16/00/gamcheon-cultural-village-6613543_960_720.jpg">',2);
INSERT INTO areagu VALUES(4,"해운대구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/11/26/08/20/haeundae-beach-3838960_960_720.jpg">',2);
INSERT INTO areagu VALUES(5,"광안리",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2014/09/14/17/49/bokeh-445213_960_720.jpg">',2);
INSERT INTO areagu VALUES(6,"기장",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2020/04/15/10/54/busan-5046149_960_720.jpg">',2);
INSERT INTO areagu VALUES(7,"동구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2020/04/15/10/58/busan-5046161_960_720.jpg">',2);
INSERT INTO areagu VALUES(8,"서귀포",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2020/02/02/03/41/jeju-island-4811937_960_720.jpg">',4);
INSERT INTO areagu VALUES(9,"애월",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2017/09/14/06/33/jeju-2748095_960_720.jpg">',4);
INSERT INTO areagu VALUES(10,"동구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2019/12/17/01/37/korea-4700537_960_720.jpg">',3);
INSERT INTO areagu VALUES(35,"달서구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/08/23/03/26/south-korea-3625168_960_720.jpg">',3);
INSERT INTO areagu VALUES(36,"가평",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/10/03/02/07/autumn-3720332_960_720.jpg">',5);
INSERT INTO areagu VALUES(37,"파주",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2022/04/17/00/00/tulips-7137147_960_720.jpg">',5);

INSERT INTO areagu VALUES(11,"동구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2017/11/11/11/20/expo-2938862_960_720.jpg">',6);
INSERT INTO areagu VALUES(12,"중구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/04/05/22/56/flowers-6154818_960_720.jpg">',6);
INSERT INTO areagu VALUES(13,"동구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/11/26/10/09/puppy-6825548_960_720.jpg">',7);
INSERT INTO areagu VALUES(14,"서구",'<img class="areagu_img" src="https://post-phinf.pstatic.net/MjAyMjA0MDRfMzgg/MDAxNjQ5MDQ4NDg3NDgw.6ONdJxsxZqZFMkFPQckXfep9rlTbqkOboCDUsSlOJHMg.fB6m17REVw1w-uRVG_UjFpLCYA9SSY6CxXt7LPB21z0g.JPEG/d_%ED%8F%AC%EC%B6%A9%EC%82%AC_1.jpg?type=w1200">',7);
INSERT INTO areagu VALUES(15,"중구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2014/09/12/06/08/sea-442399_960_720.jpg">',8);
INSERT INTO areagu VALUES(16,"남구",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2019/09/29/12/49/nature-4513276_960_720.jpg">',8);
INSERT INTO areagu VALUES(17,"반곡동",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/08/18/23/59/sejong-city-3615772_960_720.jpg">',9);
INSERT INTO areagu VALUES(18,"소담동",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2019/07/12/05/39/sejong-city-4331956_960_720.jpg">',9);
INSERT INTO areagu VALUES(19,"수원시",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/11/09/11/04/mars-3804300_960_720.jpg">',10);
INSERT INTO areagu VALUES(20,"성남시",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/11/07/13/27/lake-6776331_960_720.jpg">',10);
INSERT INTO areagu VALUES(21,"춘천",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2015/05/22/04/42/chuncheon-778289_960_720.jpg">',11);
INSERT INTO areagu VALUES(22,"강릉",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2017/04/03/11/14/gangneung-2198026_960_720.jpg">',11);
INSERT INTO areagu VALUES(23,"청주",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/05/26/12/25/sunset-north-hotel-saturn-cheongju-attractions-events-photo-3431254_960_720.jpg">',12);
INSERT INTO areagu VALUES(24,"제천",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/04/28/09/25/waterfall-6213490_960_720.jpg">',12);
INSERT INTO areagu VALUES(25,"서산",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2015/09/23/08/10/haemieupseong-953103_960_720.jpg">',13);
INSERT INTO areagu VALUES(26,"보령",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2015/02/19/10/43/boryeong-641943_960_720.jpg">',13);
INSERT INTO areagu VALUES(27,"포항",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2022/02/08/03/15/hand-7000662_960_720.jpg">',14);
INSERT INTO areagu VALUES(28,"경주",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2015/01/08/14/11/night-view-593026_960_720.jpg">',14);
INSERT INTO areagu VALUES(29,"통영",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/01/28/16/03/lighthouse-5958376_960_720.jpg">',15);
INSERT INTO areagu VALUES(30,"김해",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2020/04/06/09/19/hanok-5008918_960_720.jpg">',15);
INSERT INTO areagu VALUES(31,"전주",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2015/04/02/14/15/hanok-village-703824_960_720.jpg">',16);
INSERT INTO areagu VALUES(32,"군산",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/05/27/21/02/beach-3434586_960_720.jpg">',16);
INSERT INTO areagu VALUES(33,"목표",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2021/11/25/00/12/seagull-6822392_960_720.jpg">',17);
INSERT INTO areagu VALUES(34,"여수",'<img class="areagu_img" src="https://cdn.pixabay.com/photo/2018/10/21/04/05/night-view-3762230_960_720.jpg">',17);



INSERT INTO guinfo VALUES(1,'강남',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"강남대로","dsa",1);
INSERT INTO guinfo VALUES(2,'강남',"GUINFO","딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스딜리셔스",NOW(),'https://picsum.photos/200/300/?blur',"강남대로 2","dsa","1");
INSERT INTO guinfo VALUES(9,'마포',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"강남대로","dsa","6");
INSERT INTO guinfo VALUES(10,'강남',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"강남대로10","dsa","1");
INSERT INTO guinfo VALUES(3,'해운대',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"좌1","dsa","7");
INSERT INTO guinfo VALUES(4,'해운대',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"우1","dsa","7");
INSERT INTO guinfo VALUES(5,'서귀포',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"중앙동","dsa","3");
INSERT INTO guinfo VALUES(6,'서귀포',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"정방동","dsa","3");
INSERT INTO guinfo VALUES(7,'가평',"GUINFO","어서오에요",NOW(),'https://picsum.photos/200/300/?blur',"선촌리","dsa","5");
INSERT INTO guinfo VALUES(8,'가평',"GUINFO","빠지빠지빠지빠지",NOW(),'https://picsum.photos/200/300/?blur',"사룡리","dsa","5");
INSERT INTO guinfo VALUES(11,'광안리',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"우12","dsa","11");
INSERT INTO guinfo VALUES(12,'광안리',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"우13","dsa","11");
INSERT INTO guinfo VALUES(13,'판교',"GUINFO","가나다라마바사아자차카타파하",NOW(),'https://picsum.photos/200/300/?blur',"강남대로","dsa","1");

select * from restaurant where name like "%%";
select * from guinfo where name like "%%";

INSERT INTO restaurant VALUES(1,'강남대로2',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스1", 'https://picsum.photos/200/300/?blur' ,1);
INSERT INTO restaurant VALUES(2,'강남대로2',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스2",'https://picsum.photos/200/300/?blur',1);
INSERT INTO restaurant VALUES(3,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스2",'https://picsum.photos/200/300/?blur',7);
INSERT INTO restaurant VALUES(7,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스7",'https://picsum.photos/200/300/?blur',7);
INSERT INTO restaurant VALUES(8,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스8",'https://picsum.photos/200/300/?blur',7);
INSERT INTO restaurant VALUES(9,'해운대 좌1',"RESTAURANT","전통뭐시뭐시기",NOW(),'https://picsum.photos/200/300/?blur',"딜리셔스9",'https://picsum.photos/200/300/?blur',7);

SELECT * FROM restaurant;
SELECT * FROM guinfo;

DELETE  FROM guinfo WHERE name = "dasdas@@@";
SELECT * FROM restaurant WHERE name LIKE '%강%';

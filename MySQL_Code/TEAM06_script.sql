drop database team06;
CREATE DATABASE team06;
USE team06;

grant all privileges on *.* to 'team06'@'localhost' with grant option;
flush privileges;

CREATE TABLE TOUR
(
id int primary key,
city varchar(255),
name varchar(255) unique not null,
ticket varchar(30),
phone_num varchar(255),
holiday varchar(10),
website varchar(255),
open_closed varchar(30)
);

CREATE TABLE TravelAgency
(
id int primary key,
name varchar(255) unique,
phone_num varchar(255),
website varchar(255),
satisfaction int
);

CREATE TABLE Restaurant
(
tour_name varchar(255), FOREIGN KEY (tour_name) REFERENCES TOUR (name) ON DELETE CASCADE ON UPDATE CASCADE,
name varchar(255) primary key,
address varchar(255),
foodtype varchar(255),
price varchar(50),
reviewNum int
);


create table User(
    id varchar(30) primary key,
    pw varchar(30),
    nickname varchar(30),
    role varchar(25),
    phone varchar(30)
);

create table TourComment(
   user_id varchar(30),FOREIGN KEY (user_id) REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE,
    tour_id int, FOREIGN KEY (tour_id) REFERENCES TOUR (id) ON DELETE CASCADE ON UPDATE CASCADE,
    comment varchar(100),
    score int
);




CREATE TABLE CITY(
   id int primary key auto_increment,
    name varchar(45)
);

CREATE TABLE Hotels(
   id int primary key auto_increment,
    name varchar(45),
    city_id int, FOREIGN KEY (city_id) REFERENCES CITY (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    address varchar(45),
    website varchar(100),
    tel varchar(45)
);

CREATE TABLE HotelComment(
   hotel_id int, FOREIGN KEY (hotel_id) REFERENCES Hotels (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    user_id varchar(45), FOREIGN KEY (user_id) REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE,
    comment varchar(100),
    score int
);

CREATE TABLE Festival(
   fest_name varchar(45) primary key,
   city_id int, FOREIGN KEY (city_id) REFERENCES CITY (id) ON DELETE CASCADE ON UPDATE CASCADE,
    date varchar(45),
    price int,
    exp varchar(255)
);

CREATE INDEX idx ON Restaurant (foodtype);

INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (0, '서울특별시', '경복궁', '유료', '02-3700-3900', '화','http://www.royalpalace.go.kr/','9am~5pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (1, '서울특별시', '종묘', '유료', '02-765-0195', '화','http://jm.cha.go.kr/','9am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (2, '서울특별시', '남산골한옥마을', '무료', '02-2261-0517', '주말','https://www.hanokmaeul.or.kr/','9am~9pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (3, '서울특별시', '서울시립미술관본관', '무료', '02-2124-8800', '월','https://sema.seoul.go.kr/','10am~8pm');


INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (4, '경기도', '광명동굴', '유료', '070-4277-8902', '월','http://www.gm.go.kr/cv','9am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (5, '경기도', '캐리비안베이', '유료', '031-320-5000', '화','http://www.everland.com/caribbean/','10am~5pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (6, '경기도', '김치스쿨', '유료', '02-308-9688', '','http://kimchischool.com/intro/introComing','');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (7, '경기도', '에버랜드', '유료', '031-320-5000', '없음','http://www.everland.com/web/everland/main.html','10am~8pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (8, '경기도', '한국민속촌', '유료', '031-288-0000', '없음','http://www.koreanfolk.co.kr/','9:30am~5:30pm');

INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (9, '강원도', '엘리시안강촌-스키장', '유료', '033-260-2000', '시즌만','http://elysian.co.kr/gangchon/ski/ski_Introduction.asp','');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (10, '강원도', '오죽헌 시립박물관', '유료', '033-660-3301', '없음','http://www.gn.go.kr/museum/index.do','9am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (11, '강원도', '석굴암', '유료', '054-746-9933', '없음','http://seokguram.org','6:30am~6pm');


INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (12, '경상북도', '불국사', '유료', '054-746-9913', '없음','http://www.bulguksa.or.kr/','7am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (13, '경상북도', '안동 시립민속박물관', '유료', '054-821-0649', '없음','https://www.andong.go.kr/fm/main.do','9am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (14, '경상북도', '안동국제탈춤페스티벌', '유료', '033-738-3000', '','http://www.maskdance.com/','');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (15, '경상북도', '하회마을', '유료', '054-853-0109', '','http://www.hahoe.or.kr/','9am~6pm');


INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (16, '제주특별자치도', '민속자연사박물관', '유료', '064-710-7708', '월','www.jeju.go.kr/museum/index.htm','9am~5:30pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (17, '제주특별자치도', '한라산국립공원', '무료', '064-713-9950', '없음','http://www.jeju.go.kr/hallasan/index.htm','없음');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (18, '제주특별자치도', '성산일출봉', '유료', '064-783-0959', '','http://www.visitjeju.net','7:30am~7pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (19, '제주특별자치도', '정방폭포', '유료', '064-733-1530', '','http://www.visitjeju.net','9am~6pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (20, '서울특별시', '트릭아이미술관', '유료', '02-3144-6300', '','http://www.trickeye.com/','9am~9pm');

INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (21, '경기도', '서울랜드', '유료', '02-509-6000', '','https://www.seoulland.co.kr/gate/gate.asp','9:30am~10pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (22, '강원도', '남이섬유원지', '유료', '031-580-8114', '','https://namisum.com/','7:30am~9:30pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (23, '제주특별자치도', '천지연폭포', '유료', '064-733-1528', '','http://www.visitjeju.net','9am~9:30pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (24, '경기도', '가평레일파크', '유료', 031-582-7788, '','http://www.gprailpark.comt','9am~5pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (25, '경기도', '통일전망대', '유료', '033-682-0088', '','http://www.tongiltour.co.kr/','9am~4pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (26, '제주특별자치도', '한화아쿠아플라넷제주', '유료', '1833-7001', '','http://www.aquaplanet.co.kr/jeju/index.jsp','10am~7pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (27, '경기도', '고양원마운트', '유료', '1566-2232', '','https://onemount.co.kr','10am~5pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (28, '경기도', 'KINTEX', '유료', '031-810-8114', '','http://www.kintex.com/','10am~5pm');
INSERT INTO TOUR (id, city, name, ticket, phone_num, holiday, website, open_closed) 
VALUES (29, '서울특별시', '덕수궁', '유료', '02-771-9951', '','http://www.deoksugung.go.kr/','9am~6pm');




INSERT INTO TravelAgency (id, name, phone_num, website, satisfaction) 
VALUES (0, '하나투어', '1577-1233', 'https://www.hanatour.com/',638);
INSERT INTO TravelAgency (id, name, phone_num, website, satisfaction) 
VALUES (1, '모두투어', '1544-5252', 'https://www.modetour.com/',637);
INSERT INTO TravelAgency (id, name, phone_num, website, satisfaction) 
VALUES (2, '인터파크투어', '1588-3443', 'https://www.tour.interpark.com',621);
INSERT INTO TravelAgency (id, name, phone_num, website, satisfaction) 
VALUES (3, '노랑풍선', '1544-2288', 'https://www.ybtour.co.kr/',620);
INSERT INTO TravelAgency (id, name, phone_num, website, satisfaction) 
VALUES (4, '여행박사', '070-7017-2100', 'https://www.drtour.com',617);

INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('경복궁', '삼청동수제비', '서울 종로구 삼청로 101-1', '한식', '1만원 대 (2인)', 1817);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('경복궁', '봉피양', '서울 종로구 자하문로 20', '한식','3만원 대 (2인)', 91);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('경복궁', '다운타우너', '서울 종로구 북촌로 6-4', '양식','2만원 대 (2인)', 383);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('경복궁', '소금집델리', '서울 종로구 북촌로4길 19', '양식','2만원 대 (2인)', 27);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('경복궁', '깡통만두', '서울 종로구 북촌로2길 5-6', '한식','2만원 대 (2인)', 872);


INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('한국민속촌', '수담 보라민속촌점', '경기 용인시 기흥구 용구대로1900번길 3', '한식', '2만원 대 (2인)', 173);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('한국민속촌', '두부마당 민속촌점', '경기 용인시 기흥구 민속촌로 75', '한식','3만원 대 (2인)', 164);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('한국민속촌', '도원', '경기 용인시 기흥구 용구대로 1859', '중식당','2만원 대 (2인)', 67);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('한국민속촌', '큰마당감자탕', '경기 용인시 기흥구 한보라1로 5', '한식','2만원 대 (2인)', 106);


INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('엘리시안강촌-스키장', '명물닭갈비', '강원 춘천시 남산면 강촌로 67', '닭갈비', '2만원 대 (2인)', 111);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('엘리시안강촌-스키장', '강촌우미숯불닭갈비', '강원 춘천시 남산면 강촌로 159', '닭갈비','2만원 대 (2인)', 424);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('엘리시안강촌-스키장', '샘토참숯닭갈비강촌점', '강원 춘천시 남산면 강촌로 159', '닭갈비','2만원 대 (2인)', 340);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('엘리시안강촌-스키장', '원조중앙닭갈비막국수강촌점', '강원 춘천시 남산면 강촌로 112', '닭갈비','3만원 대 (2인)', 105);



INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('불국사', '불국사식당',	'경상북도 경주시 진현동 64-1',	'한식',	'2만원 대(2인)',	7);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('불국사', '청산식당',	'경상북도 경주시 진현동 64-1 KR',	'한식',	'1만원 대(2인)',	29);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('불국사', '부산식당',	'경상북도 경주시 진현동 63-34',	'한식',	'3만원 대(2인)',	12 );
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('불국사', '불국사 여행',	'경상북도 경주시 불국동 불국신택지7길 6',	'한식',	'2만원 대(2인)',	0);

INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('성산일출봉',	'경미네집(경미휴게소)',	'제주특별자치도 서귀포시 특별자치도 성산읍 일출로 259 KR',	'한식',	'2만원 대(2인)',	500);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('성산일출봉', '대돈'	,'제주시 KR특별자치도 제주시 관덕로15길 29',	'흑돼지',	'4만원 대(2인)',59);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('정방폭포',	'동해미락',	'제주특별자치도 서귀포시 송산동 72-1',	'해산물',	'4만원 대(2인)',	181);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('정방폭포', '88burger',	'제주특별자치도 서귀포시 서귀동 동문로 63','햄버거',	'2만원 대(2인)',	451);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('정방폭포', '정방횟집',	'제주특별자치도 서귀포시 서귀동 101-4',	'해산물',	'5만원 대(2인)',	6);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('한화아쿠아플라넷제주',	'제주시 새우리'	,'제주특별자치도 서귀포시 성산읍 성산읍 환해장성로 913',	'한식',	'2만원 대(2인)',	163);

INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('서울랜드',	'봉덕칼국수',	'경기도 과천시 과천동 642',	'한식',	'2만원 대(2인)',	420);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('서울랜드', '롯데리아 서울랜드2호점',	'경기도 과천시 막계동 33',	'패스트푸드',	'1만원 대(2인)',	166);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('서울랜드', '모두의쌀국수',	'경기도 과천시 중앙동 새술막길 39','베트남'	,'1만원 대(2인)',	24);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('고양원마운트', '단팥소 고양원마운트점',	'대화동 2606 고양 원 마운트 1F 132 일산동구 고양시 경기도'	,'빵','1만원 대(2인)',	10);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('고양원마운트', '아웃백스테이크하우스 일산원마운트점',	'경기도 고양시 일산서구 대화동 한류월드로 300'	,'스테이크',	'6만원 대(2인)',	142);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('하회마을', '솔밭식당', '경북 안동시 풍천면 전서로 214-6', '한식', '2만원 대 (2인)', 64);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('하회마을', '시월애단팥빵', '경북 안동시 풍천면 전서로 196', '베이커리','5천원 대 (2인)', 72);
INSERT INTO Restaurant (tour_name, name, address, foodtype, price, reviewNum) 
VALUES ('하회마을', '이화식당', '경북 안동시 풍천면 전서로 214-6', '한식','3만원 대 (2인)', 21);


INSERT INTO User (id, pw, nickname,role,phone) 
VALUES ('sbpark422', '1111', '수빈', '일반인','010-1223-4567');
INSERT INTO User (id, pw, nickname,role,phone) 
VALUES ('88burger', '1111', '88burger', '관리자','010-8888-8888');
INSERT INTO User (id, pw, nickname,role,phone) 
VALUES ('hyewon', '1234', '혜원','일반인','010-2210-5936');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('minji', '7890', '민','일반인','010-3212-2322');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('dayeong', '1111', '다영','일반인','010-2324-8977');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('sbKing', '1111', '킹왕짱수비니','일반인','010-2364-6543');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('hello', '1111', 'hello','일반인','010-4543-2342');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('wonsun', '1111', 'wonsun','일반인','010-4322-2839');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('dbdbdb', '1111', '데베응','일반인','010-1232-1231');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('jonggang', '1111', '종강언제','일반인','010-3443-2321');
INSERT INTO User (id, pw, nickname,role,phone)
VALUES ('TEAM06', '1111', 'TEAM06','일반인','010-6666-6666');


INSERT INTO CITY (id, name) VALUES (1, '서울특별시');
INSERT INTO CITY (id, name) VALUES (2, '경기도');
INSERT INTO CITY (id, name) VALUES (3, '강원도');
INSERT INTO CITY (id, name) VALUES (4, '경상북도');
INSERT INTO CITY (id, name) VALUES (5, '제주특별자치도');

INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (1, 'JW 메리어트 호텔 서울', 1, '서울 서초구 신반포로 176', 'http://jwmarriotthotelseoul.kr','02-6282-6262');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (2, '더 플라자', 1, '서울 중구 소공로 119', 'https://www.hoteltheplaza.com','02-771-2200');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (3, '포시즌스호텔서울', 1, '서울 종로구 새문안로 97', 'http://www.fourseasons.com/kr/seoul','02-771-0500');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (4, '신라스테이 광화문', 1, '서울특별시 종로구 삼봉로 71', 'http://www.shillastay.com/gwanghwamun/index.do','02-6060-9000');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (5, '롯데호텔 서울', 1, '서울특별시 중구 을지로 30', 'https://www.lottehotel.com/seoul-hotel/ko.html','02-771-1000');

INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (6, '용인 센트럴 코업 호텔', 2, '경기도 용인시 처인구 중부대로 1216', 'http://www.yongincoop.co.kr','031-336-1100');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (12, '라마다 용인 호텔', 2, '경기 용인시 처인구 포곡읍 마성로 420', 'http://ramadayongin.com/','031-8097-6500');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (13, '호텔 더숨 포레스트', 2, '경기 용인시 처인구 포곡읍 성산로 633', 'http://www.hotelthesoom.com/','1522-2777');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (14, '리디자인 호텔', 2, '경기 용인시 기흥구 동백3로11번길 43', 'http://www.leedesignhotel.com/','031-284-3435');

INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (7, '베스트웨스턴 제주호텔', 5, '제주 제주시 도령로 27', 'http://www.bestwesternjeju.com/','064-797-6000');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (8, '제주 신라 호텔', 5, '제주 서귀포시 중문관광로72번길 75', 'http://www.shilla.net/jeju/','064-735-5114');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (9, '골든튤립 제주성산호텔', 5, '제주 서귀포시 성산읍 일출로 31', 'http://www.goldentulipjeju.co.kr/','064-744-7500');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (10, '호텔 리젠트 마린 더 블루', 5, '제주 제주시 서부두2길 20', 'http://hotelrmblue.com/',null);
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (11, '더 베스트 제주 성산', 5, '제주 서귀포시 성산읍 동류암로 26', NULL, null);

INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (15, '세인트존스 경포 호텔', 3, '강원 강릉시 창해로 307', 'https://stjohns.co.kr/', '033-660-9000');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (16, '정동진 썬크루즈', 3, '강원 강릉시 강동면 헌화로 950-39', 'http://www.esuncruise.com/', '033-610-7000');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (18, '스카이베이 경포호텔', 3, '강원 강릉시 해안로 476', 'http://www.skybay.co.kr/', '033-923-2000');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (17, '라마다 앙코르 정선 호텔', 3, '강원 정선군 사북읍 지장천로 583', NULL, null);

INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (19, '켄싱턴 리조트 경주', 4, '경북 경주시 보문로 182-29', 'http://www.kensingtonresort.co.kr/', '054-748-8400');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (20, '코모도 호텔 경주', 4, '경북 경주시 보문로 422 코모도호텔', 'http://www.commodorehotel.co.kr/', '054-745-7701');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (21, '힐튼 호텔 경주', 4, '경북 경주시 보문로 484-7', 'http://www.hiltongyeongju.co.kr/', '054-745-7788');
INSERT INTO Hotels (id, name, city_id, address, website, tel)
VALUES (22, '경주 지지 관광호텔', 4, '경북 경주시 태종로699번길 3', 'http://www.gghotel.co.kr/', '054-701-0090');


INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (4, 'minji', '늦게 도착하고 일찍 나가서 아쉽지만 위치도 서비스도 만족합니다', 4);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (4, 'hyewon', '부모님 방문하셨는데 만족하셨습니다', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (4, 'sbpark422', '편안하게 지내다와요', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (5, 'minji', '다들 너무 친절하고 조식도 맛있게 잘먹었어요..', 4);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (5, 'minji', '친절하고 좋았는데 창문 쪽이 너무 춥더리구요', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (5, 'sbpark422', '생각치도 않앗는데 방도 업글해주시고 타워뷰에 요구사항 준비도 미리 해주셔서 감사했습니다 ', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (7, 'hyewon', '공항에서 멀지 않은 거리이고 이가격에 이렇게 깔끔하고 편리한 숙소를 이용할수 있어서 좋았습니다', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (7, 'minji', '객실 내부 강화마루로 되어있어 먼지도 냄새도 없어 좋았습니다', 4);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (7, 'sbpark422', '벌써 3번째 제주도 여행인데...이번처음으로10개월 아가랑 오다보니 호텔에 이것저것 신경 많이 썻어요!!', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (8, 'minji', '직원들이 모두 친절해서 좋았습니다. 머무는동안 기분 좋게 즐길수 있었습니다.', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (8, 'minji', '부대시설-추운날씨에도 수영이 가능한 풀 조식-종류가 다양하고 맛있음', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (9, 'hyewon', '주차장이 넘 협소했습니다', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (9, 'sbpark422', '방이 넓고 개끗하고 좋아요.', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (10, 'minji', '바다뷰로 예약했는데 거의 안보였어요', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (10, 'hyewon', '깨끗하고 침구류가 편했습니다', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (10, 'sbpark422', '위치는 주변에 가게가 많아 먹을 곳 찾기는 좋고 이동거리도 짧고 좋았습니다', 4);

INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (12, 'hyewon', '직원분들이 좀 상냥했으면 좋겠네요', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (12, 'sbpark422', '조용하고 편안하고 친절했습니다~ 에버랜드 다녀오기도 좋구요 강추합니다~^^', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (12, 'minji', '침구 관리나 교체에 신경써주시면 좋겠습니다.', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (13, 'minji', '에버랜드와 가깝고 시설도 깨끗하니 좋아요', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (13, 'minji', '잠자리 편햇어요', 4);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (13, 'hyewon', '차가있다면 좋지만 걸어가기엔 좀 먼 거리였어요~', 3);

INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (15, 'hyewon', '가격대비 호텔 안의 시설 및 청결이 별로 였습니다.', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (15, 'minji', '체크인시간이 늦어요ㅜㅜ... 공사중이여서, 조금 불편했어요', 3);

INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (15, 'TEAM06', '가격대비 호텔 안의 시설 및 청결이 별로 였습니다.', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (15, 'TEAM06', '그럼에도 불구하고 로비 직원은 친절했고, 방 안은 구조며 시설물이 세련되고 좋았고 오션뷰는 정말 좋았다.', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (15, 'TEAM06', '체크인시간이 늦어요ㅜㅜ... 공사중이여서, 조금 불편했어요', 3);


INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (21, 'sbpark422', '직원들은 친절하며 객실도 쾌적합니다.', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (21, 'minji', '처음 배정받은 방이 저층에 뷰가 막힌 답답한 방이었음', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (21, 'hyewon', '가을의 경주는 아름다웠고 힐튼 호텔은 보문호에 가까워 주변 경관이 좋으며 여행하기에도 편리했습니다. ', 5);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (22, 'sbpark422', '터미널에서 가깝고, 관광지에 매우 가깝습니다', 4);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (22, 'minji', '굳이 꼽자면 카펫바닥이었던것 나머지는 다 괜찮았어요!', 3);
INSERT INTO hotelcomment (hotel_id, user_id, comment, score)
VALUES (22, 'hyewon', '터미널에서도 가깝고 시설도 괜찮았어요! ', 4);

INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('제40회 서울무용제',1,'2019.10.12 ~ 2019.11.29',20000,'서울무용제는 우수한 창작무용 공연을 통하여 대한민국 무용예술의 진흥에 기여하고자 설립된 무용제로서, 1979년 대한민국무용제로 발복하여 2019년 제40회를 맞이하는 서울대표예술축제이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '성균관과 반촌',1,	'2019.11.08 ~ 2020.03.01',	0,	'성균관과 반촌이라는 지역의 특수성, 그리고 성균관 유생과 공노비 반인들의 이야기에 관한 전시이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서점의날',1,	'2019.11.11',	0,	'방문하는 사람들’을 연상케 하는 날짜로, 전국 서점과 서점인들의 자긍심을 고취시키고 지역서점을 활성화하기 위해 제정되었다. ');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울카페쇼',1,'2019.11.07 ~ 2019.11.10',	18000,	'코엑스에서 개최되는 서울카페쇼는 3,500여개의 글로벌 커피 브랜드가 참여하는 아시아 최대의 카페 전문 전시회이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '서울김장문화제',1	,'2019.11.01 ~ 2019.11.03',	0	,'잊혀지고 있는 우리 고유의 나눔과 정을 계승하고 김장을 문화제로 구현하여 서울을 대표하는 글로벌 나눔문화 축제로 발전시켜오고 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울불교박람회',	1	,'2019.11.14 ~ 2019.11.17',	5000	,'한국 전통문화 산업의 중추인 불교문화와 산업을 새롭게 조명하고 산업과 문화, 철학을 담은 박람회이다.'   );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '서울억새축제',	1	,'2019.10.18 ~ 2019.10.24',	0	,'생태공원으로 조성되어 야생 동식물 보호를 위해 야간에는 출입이 통제되는 하늘공원을 야간개장하여 삶에 지친 도시민들에게 은빛 억새물결 사이를 거닐며 삶의 여유를 느낄 수 있는 기회를 제공한다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '정동야행',	1	,'2019.10.25 ~ 2019.10.26',0,'근대 역사의 시작이자 근대 문화유산일번지인 정동에서 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '메이커 페어'	,1,	'2019.10.19 ~ 2019.10.20',0,'메이커 페어는 메이커들이 모여서 직접 만든 것을 보여주고 설명하는, 만드는 사람들의 축제다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '선인장페스티벌',	1	,'2019.10.09 ~ 2019.10.15',	0	,'선인장관, 다육식물관, 다육식물 공예작품전, 선인장 다육식물 신품종 및 재배기술 전시, 선인장 일러스트 작품전, 선인장 정원, 포토존 등의 행사가 준비되어 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울빛초롱축제',	1	,'2019.11.01 ~ 2019.11.17',	0	,'매년 250만 명 이상의 국내외 관람객이 방문하는 국내 최대 동계 대표 축제이다.'  );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울 역사문화의 달',	1	,'2019.10.01 ~ 2019.10.31',	0	,'서울시 25개 자치구 모든 곳에서 33가지 역사문화 관련 행사들을 만날 수 있다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( 'RUN ON SEOUL',	1	,'2019.09.29',	50000,	'2019 런온 서울은 2011년부터 뉴발란스에서 진행하는 러닝 대회로 올해가 9번째 행사이다. 참가자들은 서울을 배경으로 여의도 공원에서 출발해 서강대교를 따라 한강 변을 질주하는 로드레이스를 펼친다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('염리동 소금축제',	1	,'2019.09.28',	0	,'소금마을로 널리 알려진 마포구 염리동(동장:추용호)이 오는 9월 28일 오전 11시부터 오후 6시까지 마포아트센터 앞 광장에서 특별한 축제를 개최한다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('육의전 축제',	1	,'2019.09.27 ~ 2019.09.28',	0	,'육의전이 있던 종로거리가 관수동 상패․휘장거리, 세운상가, 종로 의료기기 거리, 광장시장, 창신동 문구완구거리・인장거리・수족관거리로 이어지고 있다는 의미를 살려 상가별 특성을 알리고 체험하는 프로그램과 다양한 공연, 전시 프로그램도 즐길 수 있는 축제다.'  );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울뮤직페스티벌',	1,	'2019.09.28 ~ 2019.10.06'	,0,	'다양한 공연이 이어지는 뮤직페스티벌이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서리풀페스티벌',	1	,'2019.09.21 ~ 2019.09.28',	0	,'차 없는 반포대로에서 펼쳐지는 야간 뮤직 퍼레이드와, 서초구 51개 공연장에서 진행되는 다채로운 음악축제이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('서울디저트페어',	1	,'2019.10.19 ~ 2019.10.20',	5000	,'흔히 접하기 힘든 이색 디저트를 선보일 예정이며, 세계 각국의 길거리 음식을 맛볼 수 있는 \'푸드존\' 취향을 저격하는 핸드메이드\'수공예존\' 까지 한 전시장에서 만나 볼 수 있다. ');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('별빛정원우주 별빛축제',	2	,'2019.01.01 ~ 2019.12.31',	12000	,'빛과 자연을 테마로 하는 문화공간으로 낮에는 다양한 식물과 꽃을 볼 수 있고 밤에는 빛의 향연을 볼 수 있다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '아인스월드 빛축제',	2	,'2019.01.01 ~ 2019.12.31',	10000	,'아인스월드에서 야간에 상설개장하는 행사로써 할리우드 영화조명 노하우가 담긴 국내 최초의 테마형 조명시스템인 4way lighting system과 LED 직간접 조명시스템을 더해, 주변 수목조명과 더불어 건축물의 느낌을 더욱 수려하고 환상적으로 연출한다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '별빛따라 두메향기',	2	,'2019.01.01 ~ 2019.12.31',	6000	,'경기도 양평 양서면에 위치한 산나물 테마공원 두메향기에서 연중상시운영하는 별빛축제 행사이다. 약 5만평의 숲 속 테마정원 곳곳에 LED전구를 활용하여 환상적인 포토존들과 함께 낮과는 또 다른 두메향기의 매력을 느낄 수 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '퍼스트가든 빛축제',	2,	'2019.01.01 ~ 2019.12.31',	8000	,'퍼스트가든의 아름다운 정원에 해가 지면 수십만개의 전구가 빛을 발하기 시작한다. 마치 은하수 아래를 걷는듯한 토스카나길, 천사가 날아다니는 토스카나 광장 등 정원마다 다른 주제로 사계절의 대표 별자리를 비롯한 다양한 별자리가 지상에 내려앉은 모습을 볼 수 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '몽땅구이 축제	',2,	'2019.09.02 ~ 2019.12.02',0,		'가을의 풍요로움을 만낏하며 가을에 나는 농산물을 몽땅 구워먹는 구이축제로, 9월2일부터 12월02일까지 92일간 진행된다.' );

INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '서울랜드 겨울 빛축제',	2	,'2019.11.15 ~ 2020.03.01',0,'서울랜드 겨울 빛축제 \'루나 해피 홀리데이즈\'는 서울에서 가장 가까운 빛 축제로, 매일 밤 서울랜드의 28만 2250㎡의 넓은 공간 전체가 거대한 빛의 공연장으로 새롭게 변신해 환상적인 분위기의 라이트닝 공연이 펼쳐진다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '파주장단콩축제',	2	,'2019.11.2 ~ 2019.11.24',	0	,'웰빙 명품으로 전래되는 파주장단콩과 지역농특산물의 우수성을 널리 홍보하여 소비촉진의 기반마련 및 지역경제 활성화에 기여할 것이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('파주 송어축제',	2	,'2019.12.21 ~ 2020.02.09',	13000,'송어얼음낚시체험을 하며 가족과 연인과 함께 즐거운 겨울추억을 만들 수 있다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('양주 눈꽃축제',	2	,'2019.12.27 ~ 2020.02.09',	12000	,'눈썰매장을 이용하는 양주시의 축제이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '명성황후숭모제',	2	,'2019.11.17',	0	,'우리역사의 한시대를 장식했던 명성황후의넋을 위로하고 왜곡된 명성황후의 올바른 인식과 업적을 재조명함으로써 찬란하고 뿌리깊은 우리 민족문화의 얼을 되살려 전통문화를 함께 느끼며 계승, 발전시킬 수 있는 축제이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( 'FCI 국제 도그쇼',	2	,'2019.11.09 ~ 2019.11.10',	0	,'도그쇼는 세계애견연맹(FCI)에서 규정한 견종 표준에 근거하여 FCI 회원국 및 미국 AKC의 해외 유명 심사위원을 비롯, 국내 심사위원을 초청하여 심사한다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '유권자 정치페스티벌',	2	,'2019.10.25 ~ 2019.10.26',0,'유권자와 정치인이 참여하는 소통과 화합의 축제이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '수원정보과학축제',	2	,'2019.10.18 ~ 2019.10.19',	0	,'10월 18일부터 19일까지 수원 컨벤션 센터에서 \'2019 경기과학축전 & 제16회 수원정보과학축제\'가 개최된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '화성 인삼축제',	2	,'2019.10.12 ~ 2019.10.13',	0	,'재미와 건강까지 챙길 수 있는 화성 인삼축제는 내국인 뿐만 아니라 외국인까지 관심있어하는 인삼에 대한 축제이다. 다양한 체험을 할 수 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '고양가을축제',	2	,'2019.09.28 ~ 2019.10.13',	0	,'일산 호수공원과 고양 꽃전시관 일원에서 진행되는 축제이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('속초 알도루묵 축제',	3	,'2019.11.15 ~ 2019.11.25',0,'11월 15일부터 ~ 25일까지 속초 이마트 앞 주차장 (속초청초회센타 앞)에서 2019 속초알도루묵축제가 열린다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('오크밸리 3D 라이팅쇼',	3	,'2018.12.24 ~ 2019.12.31',	20000	,'내 발걸음만이 소리가 되어 메아리처럼 되돌아오는 자연 그대로의 숨길에 밤이 내리면 아름다운 조명과 신비한 이야기가 있는 환상적인 세계가 펼쳐진다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '고니골빛 축제',	3	,'2019.11.15 ~ 2020.02.16',	5000	,'2019 원주 고니골빛축제 대한민국 구석구석 원주 양잠테마단지 고니골에서 겨울 동안 빛축제가 열린다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('평창송어축제',	3	,'2019.12.21 ~ 2020.02.02',0,		'평창군 진부면에서는 2019년 12월 21일부터 2020년 2월 2일까지 <평창송어축제>를 개최한다.'  );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '정동진 해맞이축제',	3	,'2019.12.31 ~ 2020.01.01',	0	,'2019년 12월 31일 동해안 최고의 해넘이, 해돋이 명소인 정동진에서 새해 기원과 새 출발을 다짐하는 행사 정동진 해맞이 축제가 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '홍천강 꽁꽁축제',	3	,'2020.01.03 ~ 2020.01.19',		0,'매년 겨울 홍천송어와 함께하는 홍천강 꽁꽁축제가 대한민국 대표 건강놀이터 홍천에서 펼쳐진다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('태백산눈꽃축제',	3	,'2020.01.10 ~ 2020.01.19',	0	,'대형눈조각전시, 개막행사, 눈꽃등반대회 및 눈미끄럼틀 등 각종 체험행사가 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '홍천사과축제',	3	,'2019.11.01 ~ 2019.11.03',0,'11월 1일부터 홍천군 토리숲에서 사과축제가 개막된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('평창고랭지김장축제',	3	,'2019.11.01 ~ 2019.11.11',0,'평창고랭지김장축제위원회(위원장 김용래)는 ‘2019 평창고랭지김장축제’를 오는 11월 1일(금)부터 11일(월)까지 11일간 강원도 평창군 진부면 오대천 축제장에서 개최한다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '치악산 배축제	',3	,'2019.11.01 ~ 2019.11.03',	0	,'원주 원예농협 하나로클럽 광장에서 치악산 배 축제가 개최된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '양양연어축제',	3	,'2019.10.24 ~ 2019.10.27',30000,'연어축제는 2019년 10월 24일부터 27일까지 양양 남대천에서 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('고성통일명태축제',	3	,'2019.10.17 ~ 2019.10.20',	0,'명태의 본 고장이자 대한민국 최고의 명태 황금어장이었던 강원도 고성군을 알리기 위해 \'제21회 고성통일명태축제\'가 개최된다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '라프 별빛축제	',5	,'2019.11.01 ~',	5000	,'제주도 야간명소로 알려진 제주 라프(LAF)는 상설 운영 중이나 많은 분들에게 더 좋은 추억을 선사하기 위해서 시즌 테마 축제로 구분하여 운영하고 있다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '휴애리 동백축제',	5	,'2019.11.15 ~ 2020.02.02',	13000	,'서귀포시 남원읍에 위치한 휴애리는 제주도민과 제주를 찾는 관광객에게 보다 나은 볼거리를 제공하기 위해 11월 15일부터 휴애리 동백축제를 진행 한다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '최남단방어축제',	5	,'2019.11.21 ~ 2019.11.25',	0	,'최남단 방어축제\'는 제주의 대표적 해양문화축제로써 매년 11월 제주바다의 대명사인 방어를 테마로 한 특산물 축제이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '한림공원 국화축제',	5	,'2019.11.08 ~ 2019.11.24',	12000	,'올해로 26회를 맞이하는 \“한림공원 국화축제\”에서는 올 봄부터 사랑과 정성을 다해 정성껏 가꾸어온 50여종 10,000여 점의 국화 작품이 어우러져 “아름다운 국화 정원”을 만들 예정이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '제주등불축제',	5	,'2020.03.12 ~ 2020.03.15',	0	,'마을별로 늦겨울에서 초 봄 사이 목야지 들판에 불을 놓았던 ‘방애’라는 제주의 옛 목축문화를 현대적 감각에 맞게 재현하여 관광 상품화한 문화관광축제이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '청초밭 메밀꽃 축제	',5	,'2019.10.21 ~ 2019.11.10',	0,	'청초밭 메밀꽃은 10월 21일 월요일부터 관람 가능하다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '제주올레걷기축제',	5	,'2019.10.31 ~ 2019.11.02',0, '제주올레걷기축제는 제주의 자연이 가장 빛나는 계절, 가을에 열린다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('한경 위풍당당 페스티벌',	5	,'2019.10.19 ~ 2019.10.20',0,	'신창해안도로 바다목장리조트 일원에서 개최된다. ');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('혼인지축제',	5	,'10.19 ~ 2019.10.20',	0,'2019년 10월19일부터 20일까지 양일간 지역주민들에게 역사와 전통을 계승하고 관광객들에게 제주의 고유한 문화와 미풍양속을 관광자원화 하고자 \"제10회 혼인지축제"를 서귀포시 성산읍 온평리에 위치한 혼인지에서 개최된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('제주국제실험예술제',5,'2019.10.09 ~ 2019.10.20',0,'제주탐나라공화국, 서귀포문화빳데리충전소, 협재해변, 취다선리조트, 홍익제주호텔에서 진행된다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '탐라문화제',	5	,'2019.10.09 ~ 2019.10.13',	0	,'탐라문화제는 지난 1962년 문화예술인들이 참여한 순수예술단체인 제주예총이 주최하여 \'제주예술제\'라는 이름으로 탄생되었다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '경주어린이합창페스티벌',	4	,'2019.12.07  2019.12.07',	0	,'경주 예술의전당 화랑홀에서 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '전국 영어한마당 축제',	4	,'2019.10.26 ~ 2019.10.26',	0	,'전국의 초중학생들이 영어로 자신의 생각을 표현하고 즐겁게 노래를 부르는 축제의 장이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('청송 사과축제',	4	,'2019.10.30 ~ 2019.11.03',	0	,'7년 연속 경상북도 최우수 축제이며, 문화체육관광부 육성축제로 지정된 청송사과축제는 대한민국 대표브랜드 청송사과의 우수성을 널리 알리고자 함이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('포항구룡포 과메기 축제',	4	,'2019.11.09 ~ 2019.11.10',	0	,'올해 22회째 개최하는 역사깊은 축제로, 볼거리 가득한 동해용왕 퍼레이드를 시작으로 과메기 요리대회, 과메기 홍보대사 선발대회 등 볼거리 즐길거리 가득한 대회와, 과메기 시식행사, 과메기 요리 전시관, 과메기 보물찾기 등이 진행된다. ');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '기계 농특산물축제',	4	,'2019.11.09',	0	,'포항시에서 지역의 각종 우수 농·특산물 판매, 유통으로 지역경제 활성화에 기여하고자 11월 9일 하루 새마을발상지 운동장에서 2019 기계 농·특산물축제를 개최한다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('영주 소백산철쭉제',	4	,'2020.05.23 ~ 2020.05.24',	0	,'붉은여우의 소백산 철쭉 꽃나들이\' 로 소백산과 철쭉제의 아름다움과 자연생태계의 소중함을 알리는 행사이다.' );
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '경주세계문화엑스포',	4	,'2019.10.11 ~ 2019.11.24',0,	'경주엑스포공원에서 진행된다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ( '어린이디자인페스티벌',	4	,'2019.10.25 ~ 2019.10.27',0,'미래 사회의 구성원인 어린이들의 창의적이고 융합적인 역략을 갖춘 인재양성을 위한 2019 대한민국 어린이디자인산업 공모전을 개최함으로서 어린이의 문제해결 능력과 디자인에 대한 인식변화를 위한 창의력 배양으로 지역사회에 필요한 인재 육성을 위한 행사이다.');
INSERT INTO Festival(fest_name, city_id, date, price, exp)
VALUES ('경북영주 풍기인삼축제',	4	,'2019.10.12 ~ 2019.10.20',0,		'천년건강! 풍기인삼!의 주제로 개최하는 인삼향 그윽한 축제장에는 볼거리와 즐길거리, 그리고 인삼캐기체험과 먹을거리 등 다양한 프로그램이 있는 축제이다.' );


INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbpark422', 0, '고궁의 멋짐 킹왕짱', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hyewon', 1, '멋있어요.!', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('minji', 2, '주변에 맛집이 많아요!', 3);


INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbpark422', 0, '고궁의 멋짐 킹왕짱', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hyewon', 1, '멋있어요.!', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('minji', 2, '주변에 맛집이 많아요!', 2);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('wonsun', 0, '대박 멋있어요', 4);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dbdbdb', 1, '멋있어요.!', 2);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('jonggang', 2, '볼게 많네요~~', 5);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dayeong', 0, '이렇게 아름다운 곳이', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbKing', 1, '너무 좋은 추억이에요!', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hello', 2, '우와아아아아', 4);




INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dayeong', 3, '다음에 또오고싶어요', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbKing', 4, '좋네요 아주 !!', 4);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hello', 5, 'ㅎㅎㅎ엄청 마음에 들어요', 3);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('wonsun', 3, '갔다와서 많이 행복해졌어요', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dbdbdb', 4, '멋있어요.!', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('jonggang', 5, '정말 또오고싶어요!', 3);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('wonsun', 6, '아주 멋있네요', 4);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dbdbdb', 7, '신기방기!', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('jonggang', 8, 'so gorgeous', 2);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbpark422', 9, 'Amazing', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hyewon', 10, '우와 진짜 이렇게 멋진 곳이 다있네요', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('minji', 11, '가족들이랑 오기 너무 좋아요', 4);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('wonsun', 6, '굳굳굳', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dbdbdb', 7, '만족스럽네요', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('jonggang', 8, '힐링여행이었어요', 4);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbpark422', 9, '이야아아아 너무 좋아요', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hyewon', 10, '아주 힐링이 됐어요', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('minji', 11, '우아~~너무너무 맘에 들어요', 3);



INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dayeong', 23, '진짜 이렇게 아름다운 곳이!!', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbKing', 24, '하나같이 다 너무 멋있어요', 4);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hello', 25, '너무 좋아요', 5);








INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dayeong', 12, '!!!!완전 대박', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('sbKing', 13, 'ㅎㅎㅎ너무 좋아요', 4);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('hello', 14, '짱짱짱이에요', 5);

INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('wonsun', 15, '다음에 또 방문할게요', 3);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('dbdbdb', 16, '멋있어요.!', 5);
INSERT INTO TourComment (user_id, tour_id, comment, score) 
VALUES ('jonggang', 17, '주변에 먹을데도 많아요!', 4);


SELECT * FROM TOUR;
SELECT * FROM TourComment;
SELECT * FROM TravelAgency;
SELECT * FROM Restaurant;
SELECT * FROM User;
SELECT * FROM CITY;
SELECT * FROM Hotels;
SELECT * FROM hotelcomment;
SELECT * FROM festival;


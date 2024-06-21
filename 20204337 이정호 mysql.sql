-- 2024 05-26 20204337 이정호
USE school;

CREATE TABLE 학과(
번호 INTEGER NOT NULL,
이름 VARCHAR(50),
PRIMARY KEY(번호));

CREATE TABLE 교수(
번호 INTEGER NOT NULL,
이름 VARCHAR(30),
학과번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학과번호) REfERENCES 학과(번호));


CREATE TABLE 학생
(번호 INTEGER NOT NULL,
이름 VARCHAR(30),
주소 VARCHAR(50),
학년 INTEGER,
키 INTEGER,
몸무게 INTEGER,
별명 VARCHAR(20),
별명이유 VARCHAR(50),
학과번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학과번호) REFERENCES 학과(번호));

CREATE TABLE 과목(
번호 INTEGER NOT NULL,
이름 VARCHAR(30),
학점 INTEGER,
교수번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(교수번호) REFERENCES 교수(번호));

CREATE TABLE 등록(
번호 INTEGER NOT NULL,
등록일 DATETIME,
학생번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(학생번호) REFERENCES 학생(번호));

CREATE TABLE 수강(
등록번호 INTEGER NOT NULL,
과목번호 INTEGER NOT NULL,
중간성적 DECIMAL(6,2),
기말성적 DECIMAL(6,2),
PRIMARY KEY(등록번호,과목번호),
FOREIGN KEY(등록번호) REFERENCES 등록(번호),
FOREIGN KEY(과목번호) REFERENCES 과목(번호));


INSERT INTO 학과 VALUES (1,'국문과');
iNSERT INTO 학과 VALUES (2,'연극영화과');
iNSERT INTO 학과 VALUES (3,'영문과');
iNSERT INTO 학과 VALUES (4,'의류학과');
iNSERT INTO 학과 VALUES (5,'전산학과');
iNSERT INTO 학과 VALUES (6,'철학과');


INSERT INTO 교수 VALUES (1,'김태길',6);
INSERT INTO 교수 VALUES (2,'김봉남',4);
INSERT INTO 교수 VALUES (3,'조정래',1);
INSERT INTO 교수 VALUES (4,'이문열',1);
INSERT INTO 교수 VALUES (5,'안성기',2);
INSERT INTO 교수 VALUES (6,'장미희',2);
INSERT INTO 교수 VALUES (7,'김영걸',2);
INSERT INTO 교수 VALUES (8,'남기찬',3);
INSERT INTO 교수 VALUES (9,'이종만',5);


INSERT INTO 학생 VALUES (1,'조용필',NULL,4,166,56,'작은거인','작은 체구 불구 폭발적인 가창력 때문에',1);
INSERT INTO 학생 VALUES (2,'임성훈',NULL,4,168,NULL,NULL,NULL,6);
INSERT INTO 학생 VALUES (3,'이수만','SM엔터테이먼트',4,NULL,NULL,NULL,NULL,5);
INSERT INTO 학생 VALUES (4,'임예진',NULL,3,NULL,NULL,NULL,NULL,2);
INSERT INTO 학생 VALUES (5,'원미경',NULL,3,NULL,NULL,NULL,NULL,1);
INSERT INTO 학생 VALUES (6,'박수홍',NULL,2,183,65,'허우대','키가 큰 것을 비유하여',3);
INSERT INTO 학생 VALUES (7,'안칠현','SM엔터테이먼트',1,178,65,NULL,NULL,2);
INSERT INTO 학생 VALUES (8,'김태희',NULL,1,165,45,'헤드뱅잉','수업시간에 졸때 낙차가 너무 커서',4);
INSERT INTO 학생 VALUES (9,'한채영', '스타제이엔터테이먼트',1,172,47,'바비인형','시원하게 생긴 서구적인 마스크 때문에',2);
INSERT INTO 학생 VALUES (10,'박수애','스타제이엔터테이먼트',1,168,46,'리틀 정윤희',NULL,1);
INSERT INTO 학생 VALUES (11,'허영란',NULL,1,162,43,'까치','눈동자가 까치 닮아서',2);
INSERT INTO 학생 VALUES (12,'정윤호','SM엔터테이먼트',1,184,66,'꼬비',NULL,2);
INSERT INTO 학생 VALUES (13,'권보아','SM엔터테이먼트',1,162,45,NULL,NULL,1);
INSERT INTO 학생 VALUES (14,'문근영','나무엑터스',1,165,45,'국민 여동생','귀여운 여동생 이미지 때문에',3);


INSERT INTO 과목 VALUES (1,'문학의 이해',2,3);
iNSERT INTO 과목 VALUES (2,'대화의 기법',2,4);
iNSERT INTO 과목 VALUES (3,'연극개론',3,5);
iNSERT INTO 과목 VALUES (4,'한국영화사',3,6);
iNSERT INTO 과목 VALUES (5,'애니메이션 개론',3,7);
iNSERT INTO 과목 VALUES (6,'영어회화실습',1,8);
iNSERT INTO 과목 VALUES (7,'현대사회와 패션',2,2);
iNSERT INTO 과목 VALUES (8,'의복과 첨단과학',2,2);
iNSERT INTO 과목 VALUES (9,'데이터베이스',3,9);
iNSERT INTO 과목 VALUES (10,'프로그래밍 언어',3,9);


INSERT INTO 등록 VALUES (2006101,'2006-02-20',1);
INSERT INTO 등록 VALUES (2006102,'2006-02-20',2);
INSERT INTO 등록 VALUES (2006103,'2006-02-21',3);
INSERT INTO 등록 VALUES (2006104,'2006-02-21',4);
INSERT INTO 등록 VALUES (2006105,'2006-02-21',5);
INSERT INTO 등록 VALUES (2006106,'2006-02-21',6);
INSERT INTO 등록 VALUES (2006107,'2006-02-22',7);
INSERT INTO 등록 VALUES (2006108,'2006-02-22',8);
INSERT INTO 등록 VALUES (2006109,'2006-02-23',9);
INSERT INTO 등록 VALUES (2006110,'2006-02-23',10);
INSERT INTO 등록 VALUES (2006111,'2006-02-23',11);
INSERT INTO 등록 VALUES (2006112,'2006-02-23',12);
INSERT INTO 등록 VALUES (2006113,'2006-02-23',13);
INSERT INTO 등록 VALUES (2006114,'2006-02-23',14);
INSERT INTO 등록 VALUES (2005101,'2005-02-21',1);
INSERT INTO 등록 VALUES (2005102,'2005-02-21',2);
INSERT INTO 등록 VALUES (2005103,'2005-02-21',3);
INSERT INTO 등록 VALUES (2005104,'2005-02-22',4);
INSERT INTO 등록 VALUES (2005105,'2005-02-23',5);
INSERT INTO 등록 VALUES (2005106,'2005-02-24',6);
INSERT INTO 등록 VALUES (2005201,'2005-08-22',1);
INSERT INTO 등록 VALUES (2005202,'2005-08-22',2);
INSERT INTO 등록 VALUES (2005203,'2005-08-24',3);
INSERT INTO 등록 VALUES (2005204,'2005-08-24',4);
INSERT INTO 등록 VALUES (2005205,'2005-08-24',5);
INSERT INTO 등록 VALUES (2005206,'2005-08-24',6);
INSERT INTO 등록 VALUES (2004101,'2004-02-23',1);
INSERT INTO 등록 VALUES (2004102,'2004-02-24',2);
INSERT INTO 등록 VALUES (2004103,'2004-02-25',3);
INSERT INTO 등록 VALUES (2004104,'2004-02-25',4);
INSERT INTO 등록 VALUES (2004105,'2004-02-26',5);
INSERT INTO 등록 VALUES (2004201,'2004-08-23',1);
INSERT INTO 등록 VALUES (2004202,'2004-08-25',2);
INSERT INTO 등록 VALUES (2004203,'2004-08-26',3);
INSERT INTO 등록 VALUES (2004204,'2004-08-26',4);
INSERT INTO 등록 VALUES (2004205,'2004-08-26',5);
INSERT INTO 등록 VALUES (2003101,'2003-02-17',1);
INSERT INTO 등록 VALUES (2003102,'2003-02-18',2);
INSERT INTO 등록 VALUES (2003103,'2003-02-20',3);
INSERT INTO 등록 VALUES (2003201,'2003-08-25',1);
INSERT INTO 등록 VALUES (2003202,'2003-08-28',2);
INSERT INTO 등록 VALUES (2003203,'2003-08-28',3);

insert into 수강 values (2006101,1,90,95);
insert into 수강 values (2006101,2,83,98);
insert into 수강 values (2006102,1,95,90);
insert into 수강 values (2006102,6,90,95);
insert into 수강 values (2006102,7,85,80);
insert into 수강 values (2006103,9,90,95);
insert into 수강 values (2006103,10,75,83);
insert into 수강 values (2006104,3,95,90);
insert into 수강 values (2006104,4,90,95);
insert into 수강 values (2006105,1,55,65);
insert into 수강 values (2006105,2,85,75);
insert into 수강 values (2006106,6,95,90);
insert into 수강 values (2006107,3,90,95);
insert into 수강 values (2006107,4,55,65);
insert into 수강 values (2006108,2,95,90);
insert into 수강 values (2006108,3,85,80);
insert into 수강 values (2006108,7,90,95);
insert into 수강 values (2006108,8,77,78);
insert into 수강 values (2006109,3,85,80);
insert into 수강 values (2006109,4,90,95);
insert into 수강 values (2006110,1,75,95);
insert into 수강 values (2006110,2,90,95);
insert into 수강 values (2006111,3,55,65);
insert into 수강 values (2006111,4,95,88);
insert into 수강 values (2006112,3,90,95);
insert into 수강 values (2006112,4,85,80);
insert into 수강 values (2006113,1,90,95);
insert into 수강 values (2006113,3,75,75);
insert into 수강 values (2006114,6,90,93);
insert into 수강 values (2005101,3,90,95);
insert into 수강 values (2005101,9,83,98);
insert into 수강 values (2005102,3,95,90);
insert into 수강 values (2005102,9,90,95);
insert into 수강 values (2005103,3,85,80);
insert into 수강 values (2005103,1,90,95);
insert into 수강 values (2005104,1,75,83);
insert into 수강 values (2005105,3,95,90);
insert into 수강 values (2005106,1,90,95);
insert into 수강 values (2005106,2,55,65);
insert into 수강 values (2005106,3,85,75);
insert into 수강 values (2005201,4,95,90);
insert into 수강 values (2005201,10,90,95);
insert into 수강 values (2005202,4,55,65);
insert into 수강 values (2005202,10,95,90);
insert into 수강 values (2005203,4,85,80);
insert into 수강 values (2005203,2,90,95);
insert into 수강 values (2005204,2,77,78);
insert into 수강 values (2005205,4,85,80);
insert into 수강 values (2005206,4,90,95);
insert into 수강 values (2005206,5,75,95);
insert into 수강 values (2004101,5,90,95);
insert into 수강 values (2004102,5,55,65);
insert into 수강 values (2004103,5,95,88);
insert into 수강 values (2004104,5,90,95);
insert into 수강 values (2004105,5,85,80);
insert into 수강 values (2004105,6,90,95);
insert into 수강 values (2004201,6,75,75);
insert into 수강 values (2004202,2,90,93);
insert into 수강 values (2004203,6,90,95);
insert into 수강 values (2004204,6,83,98);
insert into 수강 values (2004205,6,95,90);
insert into 수강 values (2003101,7,90,95);
insert into 수강 values (2003102,7,85,80);
insert into 수강 values (2003103,7,90,95);
insert into 수강 values (2003201,8,75,83);
insert into 수강 values (2003202,8,95,90);
insert into 수강 values (2003203,8,90,95);

select * from 학생;
select * from 학과;
select * from 등록;
select * from 교수;
select * from 수강;
select * from 과목;

-- 2024-05-22 20204337 이정호

CREATE TABLE 과목_교양(
번호 INTEGER NOT NULL,
이름 VARCHAR(30),
학점 INTEGER,
교수번호 INTEGER NOT NULL,
PRIMARY KEY(번호),
FOREIGN KEY(교수번호) REFERENCES 교수(번호));

select * from 과목_교양;

Insert INTO 과목_교양 SELECT * FROM 과목 where 학점 <=2;

UPDATE 과목 SET 이름 = '과목명' WHERE 번호 = 1;

-- 2024-05-27 20204337 이정호

create database madang;

use madang;

DROP TABLE IF EXISTS Orders ;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Imported_Book; 

CREATE TABLE Book (
  bookid      INTEGER PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INTEGER 
);

CREATE TABLE  Customer (
  custid      INTEGER PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(50),
  phone       VARCHAR(20)
);

CREATE TABLE Orders (
  orderid INTEGER PRIMARY KEY,
  custid  INTEGER ,
  bookid  INTEGER ,
  saleprice INTEGER ,
  orderdate DATE,
  FOREIGN KEY (custid) REFERENCES Customer(custid),
  FOREIGN KEY (bookid) REFERENCES Book(bookid)
);
 
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));

-- 2024-05-29 20204337 이정호

-- 테이블의 모든 열의 검색
select 번호, 이름, 주소, 학년, 키, 몸무게, 별명, 별명이유, 학과번호
From 학생;

-- 특정열만 선택적으로 검색

select 이름, 별명, 주소, 학년
from 학생;

select 이름 AS 성명, 주소 AS '현재 주소지' From 학생;

select 학년 From 학생;

-- 2024-06-03 20204337 이정호

-- 학생 테이블에 저장된 모든 데이터를 검색하라
select 번호, 이름, 주소, 학년, 키 ,몸무게, 별명, 별명이유, 학과번호 from 학생;

-- 학생 테이블에 저장된 데이터 중에서 이름, 별명, 주소, 학년 정보만 검색하라
select 이름, 별명, 주소, 학년 from 학생;

-- 학생테이블에서 이름 열의 별명은 성명으로, 주소 열의 별명은 현재 주소지로 부여하여 검색하라
select 이름 as 성명,  주소 as '현재 주소지' from 학생;
select 이름 성명, 주소 '현재 주소지' from 학생;

-- 학생 테이블에서 학년을 검색
select 학년 from 학생;

-- 학생 테이블에서 학년을 검색하되, 중복되는 학년은 한번만 출력
select distinct 학년 from 학생;

-- 학생 테이블에서 키가 165 미만인 학생에 대해서만 모든 열을 검색
select * from 학생 where 키 < 165;

-- 학생 테이블에서 1학년이면서 키가 170 이상인 학생에 대해서만 이름, 별명, 주소, 키, 몸무게를 검색하라
select 이름, 별명, 주소, 키, 몸무게 from 학생 where 학년 = 1 and 키 > 170;

-- 학생 테이블에서 1학년이거나 키가 170 이상인 학생에 대해서만 이름, 별명, 주소, 키, 몸무게를 검색
select 이름, 별명, 주소, 키, 몸무게 from 학생 where 학년 = 1 or 키 >170;

-- 학생테이블에서 체중이 45부터 50 사이인 학생의 이름, 주소, 키, 몸무게 열에 저장된 데이터를 출력
select 이름, 주소, 키, 몸무게 from 학생 where 몸무게 between 45 and 50;

-- in 연산자를 사용하여 학생테이블에서 2학년과 3학년 학생의 이름, 번호, 학년을 검색하라
select 이름, 번호, 학년 from 학생 where 학년 in(2,3);

-- 학생 테이블에서 박씨 성을 가진 학생의 모든 열에 저장된 데이터를 검색
select * from 학생 where 이름 like '박%';

-- 학생 테이블에서 성이 김씨이거나 이씨이거나 박씨인 학생의 모든열에 저장된 데이터를 검색
select * from 학생 where 이름 like '[김이박]%';

-- 학생 테이블에서 성이 김씨이거나 이씨이거나 박씨가 아닌 학생의 모든열에 저장된 데이터를 검색
select * from 학생 where 이름 like '[^김이박]%';

-- 학생테이블에서 이름, 별명, 학년, 주소를 검색
select 이름, 별명, 학년, 주소 from 학생 ;

-- 학생테이블에서 별명이 없는 학생의 이름, 별명, 학년, 주소를 검색
select 이름, 별명, 학년, 주소 from 학생 where 별명 is null;

-- 학생테이블에서 체중데이터가 있는 학생의 이름, 별명, 학년, 키, 몸무게를 검색
select 이름, 별명, 학년, 키, 몸무게 from 학생 where 몸무게 is not null and 몸무게 > 0;

-- 학생테이블에서 모든열에 저장된 데이터를 검색하되, 이름 가나다순으로 정렬하여 출력
select * from 학생 order by 이름;

-- 학생테이블에서 모든 열에 저장된 데이터를 검색하되, 키를 기준으로 내림차순으로 정렬하여 출력
select * from 학생 order by 키 desc;

-- 학생테이블에서 모든열에 저장된 데이터를 검색하되, 키를 기준으로 오름차순으로 정렬하여 출력
select * from 학생 where 학년 = 1 order by 키;

-- 학생 테이블에서 몸무게가 적은 순으로 이름, 키, 몸무게를 검색
-- order by 절을 이용한 정렬 결과에서 null은 오름차순일 경우에 가장 먼저 검색되고, 내림차순일 경우에 가장 나중에 검색된다.
select 이름, 키, 몸무게 from 학생 order by 몸무게;

-- 1학년 학생의 이름, 별명, 학년, 키, 몸무게를 검색하되, 키를 기준으로 먼저 내림차순 정렬한 다음에 키가 같은 학생에 한하여 다시 몸무게를 기준으로 오름차순 정렬하여 출력
 select 이름, 별명, 학년, 키, 몸무게 from 학생 where 학년 = 1 order by 키 desc, 몸무게;
 
 -- 학생테이블에서 학번, 이름, 주소를 검색하되, select 절의 두번재 열인 이름을 오름차순으로 정렬
 select 번호, 이름, 주소 from 학생 order by 2;
 
 -- 2024-06-05 20204337 이정호
 
 -- 학생수는 몇명인가?
 select count(*) from 학생;
 
 -- 임씨 성을 가진 학생중에서 키 정보가 있는 학생의 수를 검색
 select count (키) as '키 정보 있는 학생의 수' from 학생 where 이름 like '임%';
 
 -- 임씨 성을 가지고 키 데이터가 존재하는 학생의 수를 검색
 select count(*) from 학생 where 이름 like '임%' and 키 is not null;
 
 -- 수강테이블에서 과목번호가 1인 
 select avg(중간성적) as '중간성적평균' 
 from 수강 
 where 과목번호 = 1;
 
 -- 
 select 과목번호,  avg(기말성적) as '기말성적평균' 
 from 수강
 group by 과목번호;

--
select 과목번호, count(*) as '등록학생수', avg(기말성적) as '기말성적평균' 
from 수강 
group by 과목번호 having count(*) >= 5;
 
 -- 2024-06-10 20204337 이정호
 
 select * FROM 학생;
 
 SELECT T.번호, T.이름, S.이름
 FROM 학과 as S INNER JOIN 학생 as T 
 on S.번호 = T.학과번호;

SELECT 학생.번호, 학생.이름, 학과.이름
FROM 학과 INNER JOIN 학생
ON 학과.번호 = 학생.학과번호;

-- 키가 180 이상인 학생의 번호, 이름, 키, 소속 학과 이름 출력
SELECT s.번호 AS '학생번호', s.이름 AS '학생이름', s.키 AS '학생키', d.이름 AS '소속학과이름'
FROM 학생 AS s, 학과 AS d
WHERE s.학과번호 = d.번호 AND s.키 > 180;


-- 교수의 번호, 이름, 학과 이름을 출력하라
SELECT s.번호 AS '교수번호', s.이름 AS '교수이름', d.이름 AS '소속학과이름'
FROM 학과 AS d inner join 교수 AS s
on s.학과번호= d.번호;


SELECT d.이름 AS '학과이름', p.이름 AS '교수이름', c.이름 AS '과목이름'
FROM 학과 AS d inner join 교수 AS p
on d.번호 = p.학과번호 inner join 과목 AS c
on p.번호 = c.교수번호;

-- 학과별 개설 과목 목록 정보인 학과 이름, 과목 이름 출력
SELECT d.이름 AS '학과이름', c.이름 AS '과목이름'
FROM 학과 AS d, 교수 AS p, 과목 AS c
WHERE d.번호 = p.학과번호 AND p.번호 = c.교수번호;

SELECT d.이름 AS '학과이름', c.이름 AS '과목이름'
FROM 학과 AS d inner join 교수 AS p
on d.번호 = p.학과번호 inner join 과목 AS c
on p.번호 = c.교수번호;

select 교수.번호, 교수.이름, 학과.소속학과이름
from 교수 inner join 학과
on 교수.번호, 교수.이름;

-- '권보아' 학생의 번호, 이름, 소속 학과 이름 출력
SELECT s.번호 AS '학생번호', s.이름 AS '학생이름', d.이름 AS '소속학과이름'
FROM 학과 AS d, 학생 AS s 
WHERE d.번호 = s.학과번호 AND s.이름 = '권보아';

SELECT s.번호 AS '학생번호', s.이름 AS '학생이름', d.이름 AS '소속학과이름'
FROM 학과 AS d inner join 학생 AS s 
on d.번호 = s.학과번호 
AND s.이름 = '권보아';

-- 키가 180 이상인 학생의 번호, 이름, 키, 소속 학과 이름 출력
SELECT s.번호 AS '학생번호', s.이름 AS '학생이름', s.키 AS '학생키', d.이름 AS '소속학과이름'
FROM 학생 AS s, 학과 AS d
WHERE s.학과번호 = d.번호 AND s.키 > 180;

SELECT s.번호 AS '학생번호', s.이름 AS '학생이름', s.키 AS '학생키', d.이름 AS '소속학과이름'
FROM 학생 AS s inner join 학과 AS d
on s.학과번호 = d.번호 
AND s.키 > 180;

-- 2024-06-11 20204337 이정호 
	
use 축구;

CREATE TABLE stadiumTBL
(
	stadium_id char(3),
	stadium_name varchar(30),
	seat_count int,
	primary key(stadium_id)
);

CREATE TABLE teamTBL
(
	team_id char(3),
	team_name varchar(30),
	region_name varchar(10),
	stadium_id char(3),
	primary key(team_id),
	foreign key(stadium_id) references stadiumTBL(stadium_id)
);

CREATE TABLE playerTBL
(
	player_id int,
	player_name varchar(30),
	team_id char(3),
	primary key(player_id),
	foreign key(team_id) references teamTBL(team_id)
);


INSERT INTO stadiumTBL VALUES('D03', '전주월드컵경기장', 28000);
INSERT INTO stadiumTBL VALUES('B02', '성남종합운동장', 27000);
INSERT INTO stadiumTBL VALUES('C06', '포항스틸야드', 25000);
INSERT INTO stadiumTBL VALUES('D01', '광양전용경기장', 20009);
INSERT INTO stadiumTBL VALUES('B05', '서울월드컵경기장', 66806);
INSERT INTO stadiumTBL VALUES('B01', '인천월드컵경기장', 35000);
INSERT INTO stadiumTBL VALUES('C05', '창원종합운동장', 27085);
INSERT INTO stadiumTBL VALUES('C04', '울산문수경기장', 46102);
INSERT INTO stadiumTBL VALUES('D02', '대전월드컵경기장', 41000);
INSERT INTO stadiumTBL VALUES('B04', '수원월드컵경기장', 50000);
INSERT INTO stadiumTBL VALUES('A02', '광주월드컵경기장', 40245);
INSERT INTO stadiumTBL VALUES('C02', '부산아시아드경기장', 30000);
INSERT INTO stadiumTBL VALUES('A03', '강릉종합경기장', 33000);
INSERT INTO stadiumTBL VALUES('A04', '제주월드컵경기장', 42256);
INSERT INTO stadiumTBL VALUES('A05', '대구월드컵경기장', 66422);
INSERT INTO stadiumTBL VALUES('F01', '대구시민경기장', 30000);
INSERT INTO stadiumTBL VALUES('F02', '부산시민경기장', 30000);
INSERT INTO stadiumTBL VALUES('F03', '일산경기장', 20000);
INSERT INTO stadiumTBL VALUES('F04', '마산경기장', 20000);
INSERT INTO stadiumTBL VALUES('F05', '안양경기장', 20000);

INSERT INTO teamTBL VALUES('K05', '현대모터스', '전북', 'D03');
INSERT INTO teamTBL VALUES('K08', '일화천마', '성남', 'B02');
INSERT INTO teamTBL VALUES('K03', '스틸러스', '포항', 'C06');
INSERT INTO teamTBL VALUES('K07', '드래곤즈', '전남', 'D01');
INSERT INTO teamTBL VALUES('K09', 'FC서울', '서울', 'B05');
INSERT INTO teamTBL VALUES('K04', '유나이티드', '인천', 'B01');
INSERT INTO teamTBL VALUES('K11', '경남FC', '경남', 'C05');
INSERT INTO teamTBL VALUES('K01', '울산현대', '울산', 'C04');
INSERT INTO teamTBL VALUES('K10', '시티즌', '대전', 'D02');
INSERT INTO teamTBL VALUES('K02', '삼성블루윙즈', '수원', 'B04');
INSERT INTO teamTBL VALUES('K12', '광주상무', '광주', 'A02');
INSERT INTO teamTBL VALUES('K06', '아이파크', '부산', 'C02');
INSERT INTO teamTBL VALUES('K13', '강원FC', '강원', 'A03');
INSERT INTO teamTBL VALUES('K14', '제주유나이티드FC', '제주', 'A04');
INSERT INTO teamTBL VALUES('K15', '대구FC', '대구', 'A05');

INSERT INTO playerTBL VALUES(2012137, '이고르', 'K06');
INSERT INTO playerTBL VALUES(2012136, '오비나', 'K10');
INSERT INTO playerTBL VALUES(2012135, '윤원일', 'K02');
INSERT INTO playerTBL VALUES(2012134, '페르난도', 'K04');
INSERT INTO playerTBL VALUES(2012133, '레오', 'K03');
INSERT INTO playerTBL VALUES(2012132, '실바', 'K07');
INSERT INTO playerTBL VALUES(2012131, '무스타파', 'K04');
INSERT INTO playerTBL VALUES(2012130, '에디', 'K01');
INSERT INTO playerTBL VALUES(2012129, '알리송', 'K01');
INSERT INTO playerTBL VALUES(2012128, '쟈스민', 'K08');
INSERT INTO playerTBL VALUES(2012127, '디디', 'K06');

SELECT * FROM playertbl;
SELECT * FROM teamtbl;
SELECT * FROM stadiumtbl;

select count(team_id) from playertbl;

select count(distinct team_id) from playertbl;


SELECT playerTBL.player_name, teamTBL.team_name
FROM playerTBL, teamTBL
WHERE playerTBL.team_id = teamTBL.team_id;

SELECT playerTBL.player_name, teamTBL.team_name
FROM playerTBL INNER JOIN teamTBL
ON playerTBL.team_id = teamTBL.team_id;

SELECT P.player_name, T.team_name
FROM playerTBL P, teamTBL T
WHERE P.team_id = T.team_id;

SELECT P.player_name, T.team_name
FROM playerTBL P INNER JOIN teamTBL T
ON P.team_id = T.team_id;

-- p.position이 없음. (playertbl에 position 추가하면 문제없음)
SELECT P.player_name, T.team_name
FROM playerTBL P, teamTBL T
WHERE P.team_id = T.team_id
AND P.postion = 'GK'
ORDER BY P.back_no;


SELECT P.player_name 선수명, T.region_name 연고지, T.team_name 팀명, S.stadium_name 구장명
FROM playerTBL P, teamTBL T, stadiumTBL S
WHERE P.team_id = T.team_id
AND T.stadium_id = S.stadium_id
ORDER BY 선수명;

-- p.position이 없음. (playertbl에 position 추가하면 문제없음)
SELECT P.player_name 선수명, P.position 포지션, T.region_name 연고지, T.team_name 팀명, S.stadium_name 구장명
FROM playerTBL P INNER JOIN teamTBL T ON P.team_id = T.team_id
INNER JOIN stadiumTBL S ON T.stadium_id = S.stadium_id
ORDER BY 선수명;

CREATE TABLE left_tbl
(
	id int,
	name varchar(10)	
);

CREATE TABLE right_tbl
(
	id int,
	name varchar(10)	
);

INSERT INTO left_tbl VALUE(1, 'ONE'), (2, 'TWO'), (3, 'THREE'), (4, 'FOUR'), (5, 'FIVE');
INSERT INTO right_tbl VALUE(1, '하나'), (3, '셋'), (5, '다섯'), (7, '일곱'), (9, '아홉');

SELECT * FROM left_tbl;
SELECT * FROM right_tbl;

SELECT left_tbl.id, left_tbl.name, right_tbl.name
FROM left_tbl LEFT OUTER JOIN right_tbl
ON left_tbl.id = right_tbl.id;

SELECT left_tbl.id, left_tbl.name, right_tbl.name
FROM left_tbl RIGHT OUTER JOIN right_tbl
ON left_tbl.id = right_tbl.id;

-- MySQL에서 지원하지 않음.
-- SELECT left_tbl.id, left_tbl.name, right_tbl.name
-- FROM left_tbl FULL OUTER JOIN right_tbl
-- ON left_tbl.id = right_tbl.id;

-- MySQL에서의 FULL OUTER JOIN 방법
SELECT *
FROM left_tbl LEFT OUTER JOIN right_tbl
ON left_tbl.id = right_tbl.id
UNION
SELECT *
FROM right_tbl LEFT OUTER JOIN left_tbl
ON left_tbl.id = right_tbl.id;

SELECT left_tbl.name, right_tbl.name
FROM left_tbl CROSS JOIN right_tbl;


SELECT 이름, 키, 몸무게
FROM 학생
WHERE 학년 = (SELECT 학년 FROM 학생 WHERE 이름 = '김태희');

SELECT 이름, 학년, 키, 몸무게
FROM 학생
WHERE 키 > (SELECT AVG(키) FROM 학생 WHERE 학과번호 = 1);

SELECT 이름, 학년, 키, 몸무게
FROM 학생
WHERE 학년 = (SELECT 학년 FROM 학생 WHERE 이름 = '김태희')
AND 키 = (SELECT 키 FROM 학생 WHERE 이름 = '김태희');


SELECT 번호 AS 학번, 이름, 학년, 학과번호
FROM 학생
WHERE 학과번호 IN (SELECT 번호 FROM 학과 WHERE 이름 LIKE '%문과%');
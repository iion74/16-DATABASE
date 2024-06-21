use 약국관리데이터베이스;

-- 약국 테이블 생성
CREATE TABLE 약국 (
약국ID INTEGER NOT NULL,
약국명 VARCHAR(30) NOT NULL,
오픈시간 TIME,
마감시간 TIME,
전화번호 VARCHAR(30),
주소 VARCHAR(30),
PRIMARY KEY(약국ID)
);

-- 직원 테이블 생성
CREATE TABLE 직원(
직원ID INTEGER NOT NULL,
이름 VARCHAR(30),
급여 INTEGER,
주소 VARCHAR(30),
이메일 VARCHAR(30),
전화번호 VARCHAR(30),
소속약국ID INTEGER NOT NULL,
PRIMARY KEY(직원ID),
FOREIGN KEY(소속약국ID) REFERENCES 약국(약국ID)
);

-- 약사 테이블 생성
CREATE TABLE 약사(
약사ID INTEGER NOT NULL,
주소 VARCHAR(30),
전화번호 VARCHAR(30),
주민등록번호 VARCHAR(30),
소속약국ID INTEGER NOT NULL,
PRIMARY KEY(약사ID),
FOREIGN KEY(소속약국ID) REFERENCES 약국(약국ID)
);


-- 공급업체 테이블 생성
CREATE TABLE 공급업체(
공급업체ID INTEGER NOT NULL,
공급업체이름 VARCHAR(30),
공급날짜 DATE,
제조일자 DATE,
전화번호 VARCHAR(30),
사업자등록번호 VARCHAR(30),
PRIMARY KEY(공급업체ID)
);

-- 제품테이블 생성
CREATE TABLE 제품(
제품코드 VARCHAR(30) NOT NULL,
제조일자 DATE,
제품명 VARCHAR(30),
공급업체ID INTEGER NOT NULL,
PRIMARY KEY(제품코드),
FOREIGN KEY(공급업체ID) REFERENCES 공급업체(공급업체ID)
);


-- 창고 테이블 생성
CREATE TABLE 창고(
창고ID INTEGER NOT NULL,
보유재고 INTEGER,
제품코드 VARCHAR(30) NOT NULL,
사용약사 INTEGER NOT NULL, 
PRIMARY KEY(창고ID),
FOREIGN KEY(제품코드) REFERENCES 제품(제품코드),
FOREIGN KEY(사용약사) REFERENCES 약사(약사ID)
);

CREATE TABLE 약(
약ID INTEGER NOT NULL,
약품명 VARCHAR(30),
유통기한 DATE,
약품단가 INTEGER,
형태 VARCHAR(30),
제조사 VARCHAR(30),
위험등급 VARCHAR(30),
조제약사 INTEGER NOT NULL,
PRIMARY KEY(약ID),
FOREIGN KEY(조제약사) REFERENCES 약사(약사ID)
);


-- 병원 테이블 생성
CREATE TABLE 병원(
의사ID INTEGER NOT NULL,
층 INTEGER,
진료과 VARCHAR(30),
진료기록 VARCHAR(30),
PRIMARY KEY(의사ID)
);

-- 환자 테이블 생성
CREATE TABLE 환자(
환자ID INTEGER NOT NULL,
전화번호 VARCHAR(30),
최초방문 DATE,
최종방문 DATE,
이름 VARCHAR(30),
주소 VARCHAR(30),
주민등록번호 VARCHAR(30),
처방받은약 INTEGER NOT NULL,
PRIMARY KEY(환자ID),
FOREIGN KEY(처방받은약) REFERENCES 약(약ID)
);

-- 처방전 테이블 생성
CREATE TABLE 처방전(
처방전ID INTEGER NOT NULL,
진료날짜 DATE,
처방날짜 DATE,
처방의사 INTEGER NOT NULL,
환자ID INTEGER NOT NULL,
PRIMARY KEY(처방전ID),
FOREIGN KEY(처방의사) REFERENCES 병원(의사ID),
FOREIGN KEY(환자ID) REFERENCES 환자(환자ID)
);

-- 약국 테이블 데이터 입력
INSERT INTO 약국 VALUES(1, '순천약국', '09:00', '18:00', '010-1234-5678', '순천시 연향동');
INSERT INTO 약국 VALUES(2, '순천대약국', '09:00', '20:00', '010-9876-5432', '순천시 석현동');

-- 직원테이블 데이터 입력
INSERT INTO 직원 VALUES(1, '장태영', 150, '순천시 석혁동', 'qwe1234@naver.com', '010-1894-3726', 2 );
INSERT INTO 직원 VALUES(2, '송창석', 120, '순천시 연향동', 'rty5678@naver.com', '010-3729-3927', 1 );
INSERT INTO 직원 VALUES(3, '안호영', 100, '순천시 석현동', 'asd9876@naver.com', '010-4628-4729', 2 );
INSERT INTO 직원 VALUES(4, '이주현', 130, '순천시 연향동', 'zxc4321@naver.com', '010-4826-4827', 1 );

-- 약사 테이블 데이터 입력
INSERT INTO 약사 VALUES(100, '순천시 연향동', '010-1234-5678', '771012-2947294', 1);
INSERT INTO 약사 VALUES(200, '순천시 연향동', '010-9876-5432', '751025-1947289', 1);
INSERT INTO 약사 VALUES(300, '순천시 중앙동', '010-3456-1236', '810811-1235533', 2);
INSERT INTO 약사 VALUES(400, '순천시 중앙동', '010-4321-5678', '791120-9566212', 2);

-- 공급업체 테이블 데이터 입력
INSERT INTO 공급업체 VALUES(111, '코오롱제약', '2024-05-01', '2024-04-01', '02-1234-1234', '111-12-12345');
INSERT INTO 공급업체 VALUES(112, '동아제약', '2024-03-15', '2024-02-20', '02-9876-5432', '112-34-56789');
INSERT INTO 공급업체 VALUES(113, '한미의료기', '2024-06-10', '2024-05-12', '02-3456-7890', '113-45-67890');
INSERT INTO 공급업체 VALUES(114, '삼성제약', '2024-01-20', '2023-12-25', '02-6543-2109', '114-56-78901');
INSERT INTO 공급업체 VALUES(115, '한국화이자제약', '2024-04-30', '2024-03-01', '02-2345-6789', '115-67-89012');
INSERT INTO 공급업체 VALUES(116, '보령제약', '2024-02-18', '2024-01-10', '02-7890-1234', '116-78-90123');
INSERT INTO 공급업체 VALUES(117, '한국제약', '2024-07-25', '2024-06-30', '02-8901-2345', '117-89-01234');
INSERT INTO 공급업체 VALUES(118, '경동제약', '2024-09-05', '2024-08-01', '02-4321-0987', '118-90-12345');
INSERT INTO 공급업체 VALUES(119, '대한제약', '2024-08-12', '2024-07-15', '02-8765-4321', '119-01-23456');
INSERT INTO 공급업체 VALUES(120, '헬스케어', '2024-11-28', '2024-10-20', '02-6789-0123', '120-10-34567');
INSERT INTO 공급업체 VALUES(121, '일동제약', '2024-10-02', '2024-09-05', '02-2109-8765', '121-23-45678');
INSERT INTO 공급업체 VALUES(122, '한미약품', '2024-12-15', '2024-11-18', '02-5432-1098', '122-34-56789');
INSERT INTO 공급업체 VALUES(123, '광동제약', '2024-03-05', '2024-02-01', '02-9876-5432', '123-45-67890');
INSERT INTO 공급업체 VALUES(124, '한성약품', '2024-06-22', '2024-05-25', '02-1234-5678', '124-56-78901');
INSERT INTO 공급업체 VALUES(125, '유한양행', '2024-05-14', '2024-04-18', '02-6543-2109', '125-67-89012');
INSERT INTO 공급업체 VALUES(126, '일양약품', '2024-09-30', '2024-08-25', '02-2345-6789', '126-78-90123');
INSERT INTO 공급업체 VALUES(127, '녹십자제약', '2024-11-08', '2024-10-10', '02-7890-1234', '127-89-01234');
INSERT INTO 공급업체 VALUES(128, '대웅제약', '2024-08-17', '2024-07-20', '02-8901-2345', '128-90-12345');
INSERT INTO 공급업체 VALUES(129, '종근당', '2024-01-29', '2023-12-31', '02-4321-0987', '129-01-23456');
INSERT INTO 공급업체 VALUES(130, '동성제약', '2024-04-18', '2024-03-20', '02-8765-4321', '130-10-34567');
INSERT INTO 공급업체 VALUES(131, '코오롱제약', '2024-07-01', '2024-06-01', '02-6789-0123', '131-21-45678');
INSERT INTO 공급업체 VALUES(132, '동아제약', '2024-10-25', '2024-09-30', '02-2109-8765', '132-32-56789');
INSERT INTO 공급업체 VALUES(133, '한미의료기', '2024-12-08', '2024-11-10', '02-5432-1098', '133-43-67890');
INSERT INTO 공급업체 VALUES(134, '삼성제약', '2024-06-13', '2024-05-15', '02-9876-5432', '134-54-78901');
INSERT INTO 공급업체 VALUES(135, '한국화이자제약', '2024-09-04', '2024-08-05', '02-1234-5678', '135-65-89012');
INSERT INTO 공급업체 VALUES(136, '보령제약', '2024-02-09', '2024-01-10', '02-6543-2109', '136-76-90123');
INSERT INTO 공급업체 VALUES(137, '한국제약', '2024-05-29', '2024-04-30', '02-2345-6789', '137-87-01234');
INSERT INTO 공급업체 VALUES(138, '경동제약', '2024-08-18', '2024-07-20', '02-7890-1233', '138-12-04826');

-- 제품 테이플 데이터 입력
INSERT INTO 제품 VALUES('a100', '2024-01-01', 'Paracetamol', 111);
INSERT INTO 제품 VALUES('a101', '2024-01-01', 'Ibuprofen', 112);
INSERT INTO 제품 VALUES('a102', '2024-01-01', 'Aspirin', 113);
INSERT INTO 제품 VALUES('b100', '2024-01-01', 'Loratadine', 111);
INSERT INTO 제품 VALUES('b101', '2024-01-01', 'Cetirizine', 112);
INSERT INTO 제품 VALUES('b102', '2024-01-01', 'Diphenhydramine', 113);
INSERT INTO 제품 VALUES('c100', '2024-01-01', 'Omeprazole', 114);
INSERT INTO 제품 VALUES('c101', '2024-01-01', 'Ranitidine', 131);
INSERT INTO 제품 VALUES('c102', '2024-01-01', 'Simvastatin', 121);
INSERT INTO 제품 VALUES('d100', '2024-01-01', 'Atorvastatin', 120);
INSERT INTO 제품 VALUES('d101', '2024-01-01', 'Metformin', 119);
INSERT INTO 제품 VALUES('d102', '2024-01-01', 'Insulin', 114);
INSERT INTO 제품 VALUES('e100', '2024-01-01', 'Levothyroxine', 121);
INSERT INTO 제품 VALUES('e101', '2024-01-01', 'Amlodipine', 122);
INSERT INTO 제품 VALUES('e102', '2024-01-01', 'Lisinopril', 125);
INSERT INTO 제품 VALUES('f100', '2024-01-01', 'Losartan', 126);
INSERT INTO 제품 VALUES('f101', '2024-01-01', 'Hydrochlorothiazide', 128);
INSERT INTO 제품 VALUES('f102', '2024-01-01', 'Metoprolol', 130);
INSERT INTO 제품 VALUES('g100', '2024-01-01', 'Propranolol', 111);
INSERT INTO 제품 VALUES('g101', '2024-01-01', 'Alprazolam', 112);
INSERT INTO 제품 VALUES('g102', '2024-01-01', 'Lorazepam', 116);
INSERT INTO 제품 VALUES('h100', '2024-01-01', 'Citalopram', 113);
INSERT INTO 제품 VALUES('h101', '2024-01-01', 'Fluoxetine', 119);
INSERT INTO 제품 VALUES('h102', '2024-01-01', 'Escitalopram', 120);
INSERT INTO 제품 VALUES('i100', '2024-01-01', 'Venlafaxine', 123);
INSERT INTO 제품 VALUES('i101', '2024-01-01', 'Tramadol', 111);
INSERT INTO 제품 VALUES('i102', '2024-01-01', 'Codeine', 114);
INSERT INTO 제품 VALUES('j100', '2024-01-01', 'Morphine', 117);
INSERT INTO 제품 VALUES('j101', '2024-01-01', 'Oxycodone', 133);

-- 창고 테이블 데이터 입력
INSERT INTO 창고 VALUES(100, '521','a100', 100);
INSERT INTO 창고 VALUES(101, '124','a101', 200);
INSERT INTO 창고 VALUES(102, '725','a102', 300);
INSERT INTO 창고 VALUES(103, '54','b100', 400);
INSERT INTO 창고 VALUES(104, '34','b101', 100);
INSERT INTO 창고 VALUES(105, '927','b102', 200);
INSERT INTO 창고 VALUES(106, '9572','d100', 300);
INSERT INTO 창고 VALUES(107, '65','d101', 400);
INSERT INTO 창고 VALUES(108, '12','d102', 100);
INSERT INTO 창고 VALUES(109, '40','c100', 200);
INSERT INTO 창고 VALUES(110, '88','c101', 300);
INSERT INTO 창고 VALUES(111, '100','c102', 400);
INSERT INTO 창고 VALUES(112, '531','f100', 100);
INSERT INTO 창고 VALUES(113, '276','f101', 200);
INSERT INTO 창고 VALUES(114, '799','f102', 300);
INSERT INTO 창고 VALUES(115, '200','e100', 400);
INSERT INTO 창고 VALUES(116, '300','e101', 100);
INSERT INTO 창고 VALUES(117, '666','e102', 200);
INSERT INTO 창고 VALUES(118, '29','g100', 300);
INSERT INTO 창고 VALUES(119, '2','g101', 400);
INSERT INTO 창고 VALUES(120, '689','g101', 100);
INSERT INTO 창고 VALUES(121, '156','g102', 200);
INSERT INTO 창고 VALUES(122, '910','h100', 300);
INSERT INTO 창고 VALUES(123, '1000','h101', 400);
INSERT INTO 창고 VALUES(124, '888','h102', 100);
INSERT INTO 창고 VALUES(125, '180','j100', 200);
INSERT INTO 창고 VALUES(126, '17','j101', 300);
INSERT INTO 창고 VALUES(127, '90','j101', 400);
INSERT INTO 창고 VALUES(128, '115','i100', 100);
INSERT INTO 창고 VALUES(129, '449','i101', 200);

-- 약 테이블 데이터 입력
INSERT INTO 약 VALUES(1, '아스피린', '2027-01-01', 30, '알약', 'Bayer', '하', 100);
INSERT INTO 약 VALUES(2, '타이레놀', '2027-02-01', 20, '알약', 'Johnson & Johnson', '하', 100);
INSERT INTO 약 VALUES(3, '이부프로펜', '2027-03-01', 10, '알약', 'Advil', '중', 100);
INSERT INTO 약 VALUES(4, '나프록센', '2027-04-01', 23, '알약', 'Aleve', '하', 100);
INSERT INTO 약 VALUES(5, '로라타딘', '2027-05-01', 45, '알약', 'Claritin', '하', 100);
INSERT INTO 약 VALUES(6, '세트리진', '2027-06-01', 11, '알약', 'Zyrtec', '하', 200);
INSERT INTO 약 VALUES(7, '파모티딘', '2027-07-01', 15, '알약', 'Pepcid', '하', 200);
INSERT INTO 약 VALUES(8, '오메프라졸', '2027-08-01', 19, '알약', 'Prilosec', '하', 200);
INSERT INTO 약 VALUES(9, '란소프라졸', '2027-09-01', 20, '알약', 'Prevacid', '중', 200);
INSERT INTO 약 VALUES(10, '라베프라졸', '2027-10-01', 23, '알약', 'AcipHex', '중', 200);
INSERT INTO 약 VALUES(11, '메트로니다졸', '2027-11-01', 25, '알약', 'Flagyl', '하', 300);
INSERT INTO 약 VALUES(12, '아목시실린', '2027-12-01', 29, '물약', 'Amoxil', '하' ,300);
INSERT INTO 약 VALUES(13, '클로로퀸', '2027-01-15', 50, '알약', 'Sanofi', '하', 300);
INSERT INTO 약 VALUES(14, '아지트로마이신', '2027-02-15', 61, '알약', 'Zithromax', '하', 300);
INSERT INTO 약 VALUES(15, '로바스타틴', '2027-03-15', 70, '알약', 'Mevacor', '하', 300);
INSERT INTO 약 VALUES(16, '아토르바스타틴', '2027-04-15', 21, '알약', 'Lipitor', '하', 400);
INSERT INTO 약 VALUES(17, '심바스타틴', '2027-05-15', 10, '알약', 'Zocor', '중', 400);
INSERT INTO 약 VALUES(18, '로사르탄', '2027-06-15', 10, '알약', 'Cozaar', '중', 400);
INSERT INTO 약 VALUES(19, '발사르탄', '2027-07-15', 11, '알약', 'Diovan', '하', 400);
INSERT INTO 약 VALUES(20, '아밀로디핀', '2027-08-15', 24, '알약', 'Norvasc', '하', 400);
INSERT INTO 약 VALUES(21, '메트포르민', '2027-09-15', 25, '알약', 'Glucophage', '하', 100);
INSERT INTO 약 VALUES(22, '글리메피리드', '2027-10-15', 27, '알약', 'Amaryl', '하', 200);
INSERT INTO 약 VALUES(23, '인슐린', '2027-11-15', 100, '주사제', 'Novo Nordisk', '하', 300);
INSERT INTO 약 VALUES(24, '시타글립틴', '2027-12-15', 41, '알약', 'Januvia', '하', 400);
INSERT INTO 약 VALUES(25, '플루옥세틴', '2027-01-30', 45, '알약', 'Prozac', '하', 100);
INSERT INTO 약 VALUES(26, '세르트랄린', '2027-02-28', 20, '알약', 'Zoloft', '하', 200);
INSERT INTO 약 VALUES(27, '벤라팍신', '2027-03-30', 30, '알약', 'Effexor', '하', 300);
INSERT INTO 약 VALUES(28, '클로나제팜', '2027-04-30', 10, '알약', 'Klonopin', '하', 400);
INSERT INTO 약 VALUES(29, '로라제팜', '2027-05-30', 15, '알약', 'Ativan', '중', 100);
INSERT INTO 약 VALUES(30, '졸피뎀', '2027-06-30', 20, '알약', 'Ambien', '중' ,200);

-- 병원 테이블 데이터 입력
INSERT INTO 병원 VALUES (1, 3, '이비인후과', '감기');
INSERT INTO 병원 VALUES (2, 2, '정형외과', '손가락 골절');
INSERT INTO 병원 VALUES (3, 1, '내과', '소화불량');
INSERT INTO 병원 VALUES (4, 4, '산부인과', '자궁경부암');
INSERT INTO 병원 VALUES (5, 3, '심장내과', '심부전');
INSERT INTO 병원 VALUES (6, 2, '신경외과', '디스크');
INSERT INTO 병원 VALUES (7, 1, '비뇨기과', '요로결석');
INSERT INTO 병원 VALUES (8, 4, '소화기내과', '소화불량');
INSERT INTO 병원 VALUES (9, 3, '이비인후과', '이석증');
INSERT INTO 병원 VALUES (10, 2, '정형외과', '발가락 골절');
INSERT INTO 병원 VALUES (11, 1, '내과', '식도염');
INSERT INTO 병원 VALUES (12, 4, '산부인과', '통증');
INSERT INTO 병원 VALUES (13, 3, '심장내과', '심근경색');
INSERT INTO 병원 VALUES (14, 2, '신경외과', '신경통');
INSERT INTO 병원 VALUES (15, 1, '비뇨기과', '발기부전');
INSERT INTO 병원 VALUES (16, 4, '소화기내과', '위암');
INSERT INTO 병원 VALUES (17, 3, '이비인후과', '중이염');
INSERT INTO 병원 VALUES (18, 2, '정형외과', '골절');
INSERT INTO 병원 VALUES (19, 1, '내과', '고지혈증');
INSERT INTO 병원 VALUES (20, 4, '산부인과', '갑성선');
INSERT INTO 병원 VALUES (21, 3, '심장내과', '고혈압');
INSERT INTO 병원 VALUES (22, 2, '신경외과', '오십견');
INSERT INTO 병원 VALUES (23, 1, '비뇨기과', '혈뇨');
INSERT INTO 병원 VALUES (24, 4, '소화기내과', '소화불량');
INSERT INTO 병원 VALUES (25, 3, '이비인후과', '비염');
INSERT INTO 병원 VALUES (26, 2, '정형외과', '골절');
INSERT INTO 병원 VALUES (27, 1, '내과', '혈압문제');
INSERT INTO 병원 VALUES (28, 4, '산부인과', '가려움증');
INSERT INTO 병원 VALUES (29, 3, '심장내과', '부정맥');
INSERT INTO 병원 VALUES (30, 2, '신경외과', '손목통증');
INSERT INTO 병원 VALUES (31, 1, '비뇨기과', '잔뇨');
INSERT INTO 병원 VALUES (32, 4, '소화기내과', '소화불량');


-- 환자 테이블 데이터 입력
INSERT INTO 환자 VALUES (1, '01012345678', '2022-01-15', '2024-03-21', '이정호', '순천시 가곡동', '011011-1234567', 1);
INSERT INTO 환자 VALUES (2, '01098765432', '2019-06-20', '2022-09-15', '김민지', '순천시 연향동', '970925-3999897', 2);
INSERT INTO 환자 VALUES (3, '01055512345', '2018-03-12', '2021-05-20', '박지성', '순천시 연향동', '880525-1739488', 3);
INSERT INTO 환자 VALUES (4, '01024681012', '2020-11-25', '2023-02-12', '이현진', '순천시 가곡동', '930125-0419201', 4);
INSERT INTO 환자 VALUES (5, '01036925814', '2017-08-18', '2020-01-15', '김다혜', '순천시 가곡동', '900825-1234567', 5);
INSERT INTO 환자 VALUES (6, '01047213579', '2021-04-20', '2024-06-15', '조용진', '순천시 중앙동', '960425-3927493', 6);
INSERT INTO 환자 VALUES (7, '01058394621', '2016-02-12', '2019-03-20', '이수정', '순천시 석현동', '890225-3888462', 7);
INSERT INTO 환자 VALUES (8, '01069475398', '2020-08-20', '2023-01-12', '박찬호', '순천시 가곡동', '950825-3694729', 8);
INSERT INTO 환자 VALUES (9, '01070246813', '2019-09-18', '2022-05-20', '김민기', '순천시 석현동', '920925-3927493', 9);
INSERT INTO 환자 VALUES (10, '01081357946', '2018-01-12', '2021-07-20', '이진우', '순천시 중앙동', '910125-3999287', 10);
INSERT INTO 환자 VALUES (11, '01092475321', '2022-03-15', '2024-09-20', '조성현', '순천시 가곡동', '970325-1739488', 11);
INSERT INTO 환자 VALUES (12, '01103579462', '2017-05-20', '2020-11-12', '김지영', '순천시 연향동', '900525-0419201', 12);
INSERT INTO 환자 VALUES (13, '01114625398', '2020-02-20', '2023-04-15', '이혜령', '순천시 연향동', '940225-1234567', 13);
INSERT INTO 환자 VALUES (14, '01125746813', '2019-01-18', '2022-02-20', '박형준', '순천시 석현동', '930125-3927493', 14);
INSERT INTO 환자 VALUES (15, '01136857946', '2018-09-20', '2021-03-15', '김민수', '순천시 가곡동', '910925-3888462', 15);
INSERT INTO 환자 VALUES (16, '01147925321', '2022-06-20', '2024-12-15', '조혜진', '순천시 가곡동', '980625-3694729', 16);
INSERT INTO 환자 VALUES (17, '01158394621', '2017-02-15', '2020-05-20', '이승현', '순천시 연향동', '900225-3927493', 17);
INSERT INTO 환자 VALUES (18, '01169475398', '2020-10-18', '2023-03-12', '김지현', '순천시 연향동', '950125-3999287', 18);
INSERT INTO 환자 VALUES (19, '01170246813', '2019-04-20', '2022-06-15', '박찬호', '순천시 중앙동', '940925-1739488', 19);
INSERT INTO 환자 VALUES (20, '01181357946', '2018-06-20', '2021-09-20', '이정호', '순천시 조곡동', '920125-0419201', 20);
INSERT INTO 환자 VALUES (21, '01192475321', '2022-09-20', '2024-02-12', '조용진', '순천시 석현동', '970925-1234567', 21);
INSERT INTO 환자 VALUES (22, '01203579462', '2017-03-18', '2020-07-20', '김민지', '순천시 조례동', '900825-3927493', 22);
INSERT INTO 환자 VALUES (23, '01214625398', '2020-05-20', '2023-08-15', '이수정', '순천시 가곡동', '960125-3888462', 23);
INSERT INTO 환자 VALUES (24, '01225746813', '2019-07-20', '2022-04-20', '박지성', '순천시 조곡동', '940925-3694729', 24);
INSERT INTO 환자 VALUES (25, '01236817946', '2018-04-20', '2021-02-15', '김다혜', '순천시 중앙동', '910925-3927493', 25);
INSERT INTO 환자 VALUES (26, '01247925321', '2022-10-20', '2024-04-15', '조성현', '순천시 중앙동', '980225-3999287', 26);
INSERT INTO 환자 VALUES (27, '01258394621', '2017-09-18', '2020-12-20', '이진우', '순천시 연향동', '920125-1739488', 27);
INSERT INTO 환자 VALUES (28, '01269475398', '2020-03-20', '2023-05-20', '김민기', '순천시 중앙동', '950225-0419201', 28);
INSERT INTO 환자 VALUES (29, '01270246813', '2019-02-20', '2022-07-20', '이혜령', '순천시 연향동', '940225-1236758', 29);


-- 처방전 테이블 데이터 입력
INSERT INTO 처방전 VALUES(1893, '2020-03-12', '2020-03-13', 1, 1);
INSERT INTO 처방전 VALUES(1894, '2020-04-15', '2020-04-16', 2, 2);
INSERT INTO 처방전 VALUES(1895, '2020-05-20', '2020-05-21', 3, 3);
INSERT INTO 처방전 VALUES(1896, '2020-06-22', '2020-06-23', 4, 4);
INSERT INTO 처방전 VALUES(1897, '2020-07-18', '2020-07-19', 5, 5);
INSERT INTO 처방전 VALUES(1898, '2020-08-11', '2020-08-12', 6, 6);
INSERT INTO 처방전 VALUES(1899, '2020-09-09', '2020-09-10', 7, 7);
INSERT INTO 처방전 VALUES(1900, '2020-10-14', '2020-10-15', 8, 8);
INSERT INTO 처방전 VALUES(1901, '2020-11-17', '2020-11-18', 9, 9);
INSERT INTO 처방전 VALUES(1902, '2020-12-05', '2020-12-06', 10, 10);
INSERT INTO 처방전 VALUES(1903, '2021-01-12', '2021-01-13', 11, 11);
INSERT INTO 처방전 VALUES(1904, '2021-02-08', '2021-02-09', 12, 12);
INSERT INTO 처방전 VALUES(1905, '2021-03-20', '2021-03-21', 13, 13);
INSERT INTO 처방전 VALUES(1906, '2021-04-07', '2021-04-08', 14, 14);
INSERT INTO 처방전 VALUES(1907, '2021-05-14', '2021-05-15', 15, 15);
INSERT INTO 처방전 VALUES(1908, '2020-01-19', '2020-01-20', 16, 16);
INSERT INTO 처방전 VALUES(1909, '2020-02-28', '2020-02-29', 17, 17);
INSERT INTO 처방전 VALUES(1910, '2020-03-25', '2020-03-26', 18, 18);
INSERT INTO 처방전 VALUES(1911, '2020-04-10', '2020-04-11', 19, 19);
INSERT INTO 처방전 VALUES(1912, '2020-05-30', '2020-05-31', 20, 20);
INSERT INTO 처방전 VALUES(1913, '2020-06-19', '2020-06-20', 21, 21);
INSERT INTO 처방전 VALUES(1914, '2020-07-25', '2020-07-26', 22, 22);
INSERT INTO 처방전 VALUES(1915, '2020-08-08', '2020-08-09', 23, 23);
INSERT INTO 처방전 VALUES(1916, '2020-09-15', '2020-09-16', 24, 24);
INSERT INTO 처방전 VALUES(1917, '2020-10-22', '2020-10-23', 25, 25);
INSERT INTO 처방전 VALUES(1918, '2020-11-05', '2020-11-06', 26, 26);
INSERT INTO 처방전 VALUES(1919, '2020-12-18', '2020-12-19', 27, 27);
INSERT INTO 처방전 VALUES(1920, '2021-01-07', '2021-01-08', 28, 28);
INSERT INTO 처방전 VALUES(1921, '2021-02-15', '2021-02-16', 29, 29);
INSERT INTO 처방전 VALUES(1922, '2021-03-09', '2021-03-10', 30, 29);

SELECT * FROM 약국;
SELECT * FROM 직원;
SELECT * FROM 약사;
SELECT * FROM 공급업체;
SELECT * FROM 제품;
SELECT * FROM 창고;
SELECT * FROM 약;
SELECT * FROM 병원;
SELECT * FROM 환자;
SELECT * FROM 처방전;


-- 예제 --

-- 환자 중 환자ID가 10인 고객의 최초방문, 최종방문일을 출력하라
SELECT 최초방문, 최종방문
FROM 환자
WHERE 환자ID = 10;

-- 약 중 조제약사가 200인 약의 약품명과 형태를 출력하라
SELECT 약품명, 형태
FROM 약
WHERE 조제약사 = 200;

-- 약 테이블의 약품들의 유통기한에 대한 데이터를 검색하라
SELECT 약ID, 약품명, 유통기한
FROM 약;

-- 환자 테이블에서 김씨 성을 가진 환자의 이름과 처방받은약을 검색하라
SELECT 이름, 처방받은약
FROM 환자
WHERE 이름 LIKE '김%';

-- 창고테이블에서  보유재고가 100개가 넘는 제품코드와 보유재고를를 검색하되, 보유재고가 적은순으로 정렬하여 검색하라
SELECT 제품코드, 보유재고
FROM 창고
WHERE 보유재고 > 100
ORDER BY 보유재고;

-- 환자가 병원에서 진료를 받은 층이 2층 이하이고 진료과와 진료기록을 검색하되,
-- 진료과의 이름을 기준으로 내림차순으로 정렬한 후 같은 진료과에 한해 진료기록의 이름을 기준으로 오름차순으로 정렬한다
SELECT 진료과, 진료기록
FROM 병원
WHERE 층 <= 2
ORDER BY 진료과 DESC, 진료기록;

-- 약품단가가 가장 비싼 약의 약품명과 유통기한을 보이시오
select 약품명, 유통기한
from 약
where 약품단가 = (select MAX(약품단가)
			    from 약);
                
-- 직원의 직원ID와 이름과 약국명을 보이시오
select 직원.직원ID, 직원.이름, 약국.약국명
from 직원 inner join 약국
on 직원.소속약국ID = 약국.약국ID;
                

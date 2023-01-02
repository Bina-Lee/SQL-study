--Relational Database : 관계형 DB RDB / RDB MS

--Structured Query Language
--구조 질문 언어

/*
CREATE TABLE example(
  column1 INTEGER,
  colum2 VARCHAR(50),
  column3 DATE NOT NULL,
  PRIMARY KEY (column1, column2)
);

ALTER TABLE example ADD ~~~ // 추가

TRUNCATE TABLE example; //sheet내용삭제

DROP TABLE example; //sheet 삭제

SELECT *
  FROM Book
  WHERE price ~~ //read
  
INSERT INTO example ~~~ //Write

UPDATE example //수정
 
DELETE FROM example ~~ //삭제
*/

-------------------
/*
MySQL / MariaDB
MySQL Workbench

사용할 예정
/*
--------------------
/*
MySQL Workbench에서
setup new connection
->Advanced -> Others : useSSL=0 추가
->Secure Socket Layer를 사용하지 않음
//암호화 사용하지 않음
*/

----------------------

-- RDBMS - DB - Table

/*
Create new database

Charset/Collation : uft8 / uft8_general_ci

///////////

NN Not Null
UN Unsigned
AI Auto Increment 자동입력
PK Primary Key 각 raw를 구분할 수 있는 요소
ZF Zero Fill %04d\
*/

-------

/*
Data Type

INT 4
MEDIUMINT 3
SMALLINT 2
TINYINT 1 byte
BIGINT 8 byte

INT(5) 
--: 5자리 ZF

FLOAT 4 byte
DOUBLE 8 btte

TIMESTAMP : data and time in UTC

DATETIME : timezone과 상관없이 저장가능
*/

---------------------------

insert / select - write / read

----------------------------

INSERT INTO building_temperature(building_id, temperature, reg_data)
VALUES(1,10,'2023-01-02 23:25:00');

INSERT INTO building_temperature(building_id, temperature, reg_data)
VALUES(1,12,'2023-01-02 23:26:00');

SELECT * FROM building_temperature;

----------

INSERT INTO building_temperature(building_id, temperature, reg_data)
VALUES(1,10,'2023-01-02 23:25:00'),(1,12,'2023-01-02 23:26:00');
--여러개 동시에 입력

--------

SELECT * FROM building_temperature limit 2;
--2개만 보여

---------

Ctrl + Enter : 그 줄만 실행

------------------------------

Commments

-- sample sentance
/*
sample sentance
*/

------------------------------

SELECT building_id,temperature FROM building_temperature;

//////////////////////////////

pin tab 알아서 잘 쓰세용

//////////////////////////

names with `backtick`

SELECT `building_id`,`temperature` FROM `building_temperature`;
--의미를 명확하게 함

////////////////////////////

--sort

select * from building_temperature order by `building_id`;
--기본값은 오름차순

select * from building_temperature order by `building_id` asc;
--오름차순

select * from building_temperature order by `building_id` desc;
--내림차순

desc llimit 1;
--내림차순 1개 -> 가장 큰 값만 추출

select * from building_temperature order by `building_id` asc, `rid` desc;

--조건문
select * from building_temperature where `reg_data` < '2021-12-06 12:30:00';
select * from building_temperature where `reg_data` < '2021-12-06 12:30:00' order by `building_id` desc;

--Select 문법 순서
--select from where ~~~~~~~~~~~~~

////////////

--비교연산자 : '=' 하나만 사용하면 됨
-- < > <= >= = != <>(같지않다?) 

select * from building_temperature where `reg_data` < '2021-12-06 12:30:00' and `building_id` = 1;
--비즈니스 툴이기 때문에 연산자 이런거 안쓰고
--and같은걸로 문법 구성

select * from building_temperature where `building_id` in (1,8,9);

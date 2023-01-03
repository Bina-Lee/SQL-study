--select 선택할건데
--from 어떤 파일에서
--where 어떤(condition check)
--order by : sorting, desc asc

-----------------------

--Subquery
--서브쿼리
--  select문

select * from building_temperature;
select * from building_temperature where `temperature` >= 15;
-->>
select * from building_temperature where `temperature` >= (select temperature from buildiing_temperature where `building_id` = 9);

-- 서브쿼리에서 두개이상의 값을 반환시킬 경우 에러 발생

-->>
-- any(OR) (=some) / all(AND)
select * from building_temperature where `temperature` >= all (select temperature from buildiing_temperature where `building_id` = 9);
select * from building_temperature where `temperature` >= any (select temperature from buildiing_temperature where `building_id` = 9);
select * from building_temperature where `temperature` >= some (select temperature from buildiing_temperature where `building_id` = 9);

-----------------------------------

--테이블 생성, 서브쿼리를 이용한 테이블 생성
create table temp_table(select * from building_temperature where `building_id` > 1);

-------------------------------

--drop table : 테이블 삭제
--truncate : 테이블 내용만 삭제

--------------------------------------

--distinct (unique, 중복요소는 하나만)
select building_id from building_temperature;
-->>
select distinct building_id from building_temperature;

--aggregate function (집합함수, 통계계산)
select `temperature`from building_temperature
-->>
--평균, 최대, 최소
select avg(`temperature`), max(`temperature`), min(`temperature`) from building_temperature
--표준편차, 분산
select stddev(`temperature`), var_samp(`temperature`)from building_temperature
select stddev(`temperature`) as '온도 표준편차', var_samp(`temperature`) as '온도 분산' from building_temperature
-->>뭔지 보여주기 쉬움
select count(*) from building_temperature; -- 반환하는 데이터 수만 반환
-->>응용
select count(distinct building_id) from building_temperature;

-------------------------------------

--예제
--빌딩 1의 평균 온도보다 같거나 높았던 빌딩을 모두 출력
select * from building_temperature where `temperature` >= (select avg(`temperature`) from building_temperature where `building_id` = 1);

select * from building_temperature where `temperature` >= (select avg(`temperature`) from building_temperature where `building_id` = 1) and `building_id <> 1;

-------------------------------------

--group by
--빌딩별로 평균온도 출력
select building_id, avg(temperature) from building_temperature; -- 전체 평균 하나만 반환
select building_id, avg(temperature) from building_temperature group by `building_id`; -- 그룹별로 묶어서 평균 반환

--having : aggregate function이 들어간 조건
--where에서는 aggregate function 사용이 어려움

--ex)평균 온도가 12도보다 높았던 빌딩 번호
select building_id, avg(temperature from building_temperature group by `building_id` having avg(`temperature`) ? 12.0;

select building_id, avg(temperature from building_temperature group by `building_id` with rollup;
--전체평균도 반환함

--------------------------------

--SQL query 'join'
--Relational Database

-------------------------------------

-- query code

select * from Building_Temperature;

-- Building_Info table creation
use `2022.01.02`;
create table Building_Info
(
	rid int auto_increment primary key, -- 자동증감, 키값
    building_id smallint unique, -- 중복안되도록
    building_name varchar(100)
);

insert into Building_Info values(null, 1, '연구동'), (null, 3, '기숙사'), (null, 8, '식당'), (null, 9, '체육관');

select * from Building_Info;

alter table `Building_Info` auto_increment=10; -- 10부터 증가
insert into Building_Info values(null, 2, '수영장'); -- rid가 10으로 시작하는걸 볼 수 있음
select * from Building_Info;

-- insert ignore
insert ignore into Building_Info values(null, 4, '기초연구동');
insert ignore into Building_Info values(null, 4, '기초연구동'); --  두번째는 중복이므로 값 적용 안됨

-------------------------------------

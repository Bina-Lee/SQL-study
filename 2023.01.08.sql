select * from building_info;

update `building_info` set `building_name`='첨단연구동' where `building_id`=1;
-- 그러면 여러개를 동시에는 못바꾸나?
-- 아래에 답이 나온듯 함

alter table `building_info`
add max_capacity smallint unsigned;

update `building_info` set `max_capacity`=200;
-- 초기값 전부 200
-- 아니면 where 사용해야됨
-- unsigned로 만들었는데 음수 넣으려고 시도하면
-- 그냥 0을 넣어버림 ㅋㅋ

update `building_info` set `max_capacity`=`max_capacity`*2 where `building_name`='식당';

insert into `building_info` values(null,1,'자연연구동',200)
on duplicate key update `building_name`='자연연구동';

-- 주의
delete from `building_info` where `max_capacity`>200;

-- -----------------------------------------

-- join
-- left join, right join
-- join more than two table

select * from building_info;
select * from building_temperature;
select * from building_humidity;

select *
from building_info join building_temperature
on building_info.building_id=building_temperature.building_id;

select building_info.building_name, building_temperature.temperature, building_temperature.reg_date
from building_info join building_temperature
on building_info.building_id=building_temperature.building_id;

-- ailias
-- 별칭
select a.building_name, b.temperature, b.reg_date
from building_info a join building_temperature b
on a.building_id=b.building_id;

select a.building_name, b.humidity, b.reg_date
from building_info a join building_humidity b
on a.building_id=b.building_id;

select *
from building_info a left join building_temperature b
on a.building_id=b.building_id;
-- 왼쪽은 조건에 부합하지 않더라도 select
-- 대신 right에 값이 없으면 NULL
-- right는 반대

-- 3중 join
select *
from building_info a
	join building_temperature b on a.building_id=b.building_id
    join building_humidity c on a.building_id=c.building_id;
-- and 조건임 모두 충족해야 표시됨

select *
from building_info a
	join building_temperature b on a.building_id=b.building_id
    join building_humidity c on a.building_id=c.building_id and b.reg_date=c.reg_date;

-- ----------------------------------------------

-- Create Table

use database_name;
drop table if exists tbl_neme;
create table if not exists tbl_name
(
	-- col_name data_type[not null | null][default value][auto_increment][unique key \ primary key][comment 'string'],
    -- col_name data_type[not null | null][default value][auto_increment][unique key \ primary key][comment 'string'],
    -- ~~~~~~~~~~~~~~~~~~~~~~~
    -- col_name data_type[not null | null][default value][auto_increment][unique key \ primary key][comment 'string']
);

-- --------------------------------------------------

use database_name;
create table if not exists building_in_out(
	rid int auto_increment primary key comment '데이터 일련번호',
    building_id smallint unsigned comment '건물 고유번호',
    reg_data timestamp default current_timestamp comment '측정시간',
    -- current_timestamp 현 시간 상수
    num_in smallint unsigned default 0 comment '건물 입장 인원',
    num_out smallint unsigned default 0 comment '건물 퇴장 인원',
    sensor_id varchar(20) null comment '센서 이름'
	sensor_hash varchar(40) unique comment '센서 해쉬값'
);

insert into building_in_out (building_id, num_in, num_out, sensor_hash)
values(1,10,3,'sabfd9393');


#날짜 : 2022/08/30
#이름 : 전인준
#내용 : SQL 연습문제2

#실습2-1
create database `java2_bank`;
create user 'java2_admin2'@'%' identified by '1234';
grant all privileges on `java2_bank`.* to 'java2_admin2'@'%';
flush privileges;

#실습2-2
create table `bank_customer` (
	`c_no`	 	char(14) primary key,
	`c_name` 	varchar(20) not null,
	`c_dist` 	int 		not null default 0,
	`c_phone`	varchar(20) not null unique,
	`c_addr`	varchar(100)   
);

create table `bank_account`(
	`a_no`			varchar(11) primary key default '000-00-0000',
	`a_item_dist`	char(2)		not null,
	`a_item_name`	varchar(20)	not null,
	`a_c_no`		varchar(14)	not null,
	`a_balance`		int			not null default 0,
	`a_open_date`	date		not null
);

create table `bank_transaction`(
	`t_no`			int 	auto_increment primary key,
	`t_a_no`		char(11)	not null,
	`t_dist`		int			not null,
	`t_amount`		int			not null default 0,
	`t_datetime`	datetime	not null
);

#실습2-3
insert into `bank_customer` value ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
insert into `bank_customer` value ('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구');
insert into `bank_customer` value ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
insert into `bank_customer` value ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
insert into `bank_customer` value ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
insert into `bank_customer` value ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
insert into `bank_customer` value ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
insert into `bank_customer` value ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
insert into `bank_customer` value ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `bank_account` value ('101-11-1001', 's1', '자유저축예금', '730423-1000001', 420000, '2005-07-21');
insert into `bank_account` value ('101-11-1003', 's1', '자유저축예금', '870830-1000004', 53000, '2007-02-17');
insert into `bank_account` value ('101-11-2001', 's1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14');
insert into `bank_account` value ('101-11-2002', 's1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30');
insert into `bank_account` value ('101-11-2003', 's1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07');
insert into `bank_account` value ('101-12-1002', 's2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13');
insert into `bank_account` value ('101-13-1005', 's3', '주택청약예금', '941127-1000006', 720800, '2012-10-15');
insert into `bank_account` value ('101-21-1004', 'l1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25');
insert into `bank_account` value ('101-22-1006', 'l2', '예금담보대출', '730423-1000001', 25000, '2013-12-11');
insert into `bank_account` value ('101-23-1007', 'l3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

insert into `bank_transaction` value (0, '101-11-1001', 1, 50000, now());
insert into `bank_transaction` value (0, '101-11-1003', 2, 120000, now());
insert into `bank_transaction` value (0, '101-11-2001', 2, 300000, now());
insert into `bank_transaction` value (0, '101-12-1002', 1, 1000000, now());
insert into `bank_transaction` value (0, '101-11-1001', 3, default, now());
insert into `bank_transaction` value (0, '101-13-1005', 1, 200000, now());
insert into `bank_transaction` value (0, '101-11-1001', 1, 450000, now());
insert into `bank_transaction` value (0, '101-11-2002', 2, 32000, now());
insert into `bank_transaction` value (0, '101-11-2003', 3, default, now());
insert into `bank_transaction` value (0, '101-11-1003', 1, 75000, now());

#실습2-4
select * from `bank_account`;

#실습2-5
select * from `bank_customer`;

#실습2-6
select * from `bank_transaction`;

#실습2-7
select `c_name`, `c_no` from `bank_customer`;

#실습2-8
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습2-9
select distinct `a_item_dist`, `a_item_name` FROM `bank_account`;

#실습2-10
select * from `bank_account` where `a_balance` >= 1000000 and `a_item_name` = '자유저축예금';

#실습2-11
select * from `bank_customer` where `c_addr` like '경기도%';

#실습2-12
SELECT * FROM `bank_customer` WHERE `c_dist` = 2;

#실습2-13
select * from `bank_transaction` where `t_dist` = 2;

#실습2-14
#실습2-15
#실습2-16
#실습2-17
#실습2-18
#실습2-19
#실습2-20
#실습2-21
#실습2-22
#실습2-23
#실습2-24
#실습2-25
#실습2-26
#실습2-27
#실습2-28
#실습2-29
#실습2-30

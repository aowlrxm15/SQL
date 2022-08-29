#날짜 : 2022/08/29
#이름 : 전인준 
#내용 : SQL 연습문제 1

#실습 1-1
create database `java2_shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습 1-2
create table `customer` (
	`custid` varchar(10) primary key,  
    `name`	 varchar(10) not null,
    `hp` 	 varchar(13) default null,
    `addr`	 char(100)	 default null,
    `rdate`  date not null
);

create table `product`(
	`prodno`	int auto_increment	primary key,
	`prodname`	varchar(10) not null,
	`stock`		int		default 0,
	`price`		int		default null,
	`company`	varchar(20) not null
);

create table `order`(
	`orderno`		int auto_increment primary key,
	`orderid`		varchar(10) not null,
	`orderproduct`	int not null,
	`ordercount`	int default 1,
	`orderadte` 	datetime not null
);

#실습 1-3
insert into `customer`  value ('c101', '김유신', '010-1234-1001', '김해시 봉황동', now());
insert into `customer`  value ('c102', '김춘추', '010-1234-1002', '경주시 보문동', now());
insert into `customer`  value ('c103', '장보고', '010-1234-1003', '완도군 청산면', now());
insert into `customer`  value ('c104', '강감찬', '010-1234-1004', '서울시 마포구', now());
insert into `customer`	(`custid`, `name`, `rdate`) value ('c105', '이성계', now());
insert into `customer`  value ('c106', '정철', '010-1234-1006', '경기도 용인시', now());
insert into `customer`  (`custid`, `name`, `rdate`) value ('c107', '허준', now());
insert into `customer`  value ('c108', '이순신', '010-1234-1008', '서울시 영등포구', now());
insert into `customer`  value ('c109', '송상현', '010-1234-1009', '부산시 동래구', now());
insert into `customer`  value ('c112', '정약용', '010-1234-1010', '경기도 광주시', now());

insert into `product` value ('새우깡', '5000', '1500', '농심');
insert into `product` value ('초코파이', '2500', '2500', '오리온');
insert into `product` value ('포카칩', '3600', '1700', '오리온');
insert into `product` value ('양파링', '1250', '1800', '농심');
insert into `product` value ('죠리퐁', '2200', null, '크라운');
insert into `product` value ('마카렛트', '3500', '3500', '롯데');
insert into `product` value ('뿌셔뿌셔', '1650', '1200', '오뚜기');

insert into `order` value ('c102', '3', '2', now());
insert into `order` value ('c101', '4', '1', now());
insert into `order` value ('c108', '1', '1', now());
insert into `order` value ('c109', '6', '5', now());
insert into `order` value ('c102', '2', '1', now());
insert into `order` value ('c101', '7', '3', now());
insert into `order` value ('c110', '1', '2', now());
insert into `order` value ('c104', '2', '4', now());
insert into `order` value ('c102', '1', '3', now());
insert into `order` value ('c107', '6', '1', now());

#실습 1-4
select * from `customer`;

#실습 1-5
select `custid`, `name`, `hp` from `customer`;

#실습 1-6
select * from `product`;
#실습 1-7
#실습 1-8
#실습 1-9
#실습 1-10
#실습 1-11
#실습 1-12
#실습 1-13
#실습 1-14
#실습 1-15
#실습 1-16
#실습 1-17
#실습 1-18
#실습 1-19
#실습 1-20
#실습 1-21
#실습 1-22
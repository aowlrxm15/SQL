# 날짜 : 2022/08/31
# 이름 : 전인준
# 내용 : SQL 연습문제3

#실습3-1
create database `java2_College`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on java2_College.* to 'java2_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
	`stdNo`		varchar(8)  not null primary key,
	`stdName`	char(20)  	not null,
	`stdHp`		char(13) 	not null unique,
	`stdYear`	int		 	not null,
	`stdAddress`char(100) 	default null
);

create table `Lecture`(
	`lecNo`		int			not null primary key,	
	`lecName`	char(20)	not null,
	`lecCredit`	int			not null,
	`lecTime`	int			not null,
	`lecClass`	varchar(10) default null
);

create table `Register`(
	`regStdNo`		varchar(8) not null,
	`regLecNo`		decimal(5) not null,
	`regMidScore`	int		   default null,
	`regFinalScore` int		   default null,
	`regTotalScore` int		   default null,
	`regGrade`		varchar(1) default null
);

#실습3-3
insert into `Student` value ('20201016', '김유신', '010-1234-1001', 3, default);
insert into `Student` value ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` value ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` value ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` value ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` value ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` value ('159', '인지행동심리학', 3, 40, '본304');
insert into `Lecture` value ('167', '운영체제론', 3, 25, '본805');
insert into `Lecture` value ('234', '중급 영문법', 3, 20, '본201');
insert into `Lecture` value ('239', '세법개론', 3, 40, '본204');
insert into `Lecture` value ('248', '빅데이터 개론', 3, 20, '본801');
insert into `Lecture` value ('253', '컴퓨팅사고와 코딩', 2, 10, '본802');
insert into `Lecture` value ('349', '사회복지 마케팅', 2, 50, '본301');

insert into `Register` value('20201126', '234', default, default, default, default);
insert into `Register` value('20201016', '248', default, default, default, default);
insert into `Register` value('20201016', '253', default, default, default, default);
insert into `Register` value('20201126', '239', default, default, default, default);
insert into `Register` value('20210216', '349', default, default, default, default);
insert into `Register` value('20210326', '349', default, default, default, default);
insert into `Register` value('20201016', '167', default, default, default, default);
insert into `Register` value('20220416', '349', default, default, default, default);

#실습3-4
select * from `lecture`;

#실습3-5
select * from `student`;

#실습3-6
select * from `register`;

#실습3-7
select * from `student` where `stdYear`=3;

#실습3-8
select * from `lecture` where `lecCredit`=2;

#실습3-9
update `Register` set  `regMidScore`= 36, `regFinalScore`= 42 where `regStdNo` = '20201126' and `regLecNo` = 234;
update `Register` set  `regMidScore`= 24, `regFinalScore`= 62 where `regStdNo` = '20201016' and `regLecNo` = 248;
update `Register` set  `regMidScore`= 28, `regFinalScore`= 40 where `regStdNo` = '20201016' and `regLecNo` = 253;
update `Register` set  `regMidScore`= 37, `regFinalScore`= 57 where `regStdNo` = '20201126' and `regLecNo` = 239;
update `Register` set  `regMidScore`= 28, `regFinalScore`= 68 where `regStdNo` = '20210216' and `regLecNo` = 349;
update `Register` set  `regMidScore`= 16, `regFinalScore`= 65 where `regStdNo` = '20210326' and `regLecNo` = 349;
update `Register` set  `regMidScore`= 18, `regFinalScore`= 38 where `regStdNo` = '20201016' and `regLecNo` = 167;
update `Register` set  `regMidScore`= 25, `regFinalScore`= 58 where `regStdNo` = '20220416' and `regLecNo` = 349;

select * from `Register`;

#실습3-10
update `Register` set
	`regTotalScore`= `regMidScore` + `regFinalScore`,
    `regGrade` = if(`regTotalScore` >=90, 'A',
				 if(`regTotalScore` >=80, 'B',
				 if(`regTotalScore` >=70, 'C',
				 if(`regTotalScore` >=60, 'D', 'F'))));

#실습3-11
select * from `register` order by `regTotalScore` desc;

#실습3-12
select * from `register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습3-13
select * from `Lecture` where `lectime`>=30;

#실습3-14
select  `lecName`, `lecClass` from `Lecture` ;

#실습3-15
select `stdno`, `stdname` from `Student`;

#실습3-16
SELECT * FROM `Student` WHERE `stdAddress` IS NULL;

#실습3-17
SELECT * FROM `Student` WHERE `stdAddress` LIKE '%부산%';

#실습3-18
select * from `student` as a 
left join `register` as b
on a.stdno = b.regStdNo;

#실습3-19
select * from `student` as a, `register` as b where a.stdno = b.regstdno;

#실습3-20
SELECT `stdName`, `stdNo`, `regLecNo` 
FROM `Student` AS a 
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo WHERE `regLecNo`=349;

#실습3-21
select 
	`stdNo`,
	`stdName`,
    count(`stdNo`) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) as `평균`
from `Student` as a
join `Register` as b
on a.stdNo = b.regStdNo
GROUP BY `stdNo`;

#실습3-22
select * from `Register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

#실습3-23
SELECT 
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `register` as a join `lecture` as b on a.regLecNo = b.lecNo;

#실습3-24
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
WHERE `lecName`='사회복지 마케팅';

#실습3-25
select
	`regStdNo`,
	`lecName`
from `Register` AS a JOIN `Lecture` AS b on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습3-26
select * from `Student` as a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo;

#실습3-27
select
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
order by `regTotalScore` desc;

#실습3-28
SELECT
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where `reggrade` = 'F';

#실습3-29
SELECT 
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where `regTotalScore` >= 60
group by `stdno`;


#실습3-30
SELECT 
`stdNo`,
`stdName`,
GROUP_CONCAT(`lecName`) AS `신청과목`,
GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
group by `stdno`;
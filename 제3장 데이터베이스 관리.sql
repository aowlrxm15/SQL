#날짜 : 2022/08/25
#이름 : 전인준
#내용 : 제3장 데이터베이스 관리

#실습3-1
create database `java2_test_db`;
create user 'java2_tester'@'%' identified by '1234';
grant all privileges on java2_test_db.* to 'java2_tester'@'%';
flush privileges;

#실습3-2

drop user 'java2_tester'@'%';
flush privileges;
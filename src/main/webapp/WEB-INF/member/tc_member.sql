create table tc_member(
	idx int not null auto_increment primary key,
	mid varchar(20) not null unique key,
	pwd varchar(100) not null,
	salt char(8) not null,
	nickName varchar(20) not null unique key,
	name varchar(11) not null,
	tel varchar(15) not null unique key,
	birthday datetime not null default now(),
	email varchar(50) not null,
	address varchar(100),
	level int not null default 1,
	memberDel char(4) not null default 'NO',
	lastVisitDate datetime not null default now()
);

drop table tc_member;
desc tc_member;
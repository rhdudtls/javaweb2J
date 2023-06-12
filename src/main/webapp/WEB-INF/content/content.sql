create table tc_content (
	idx int not null auto_increment primary key,
	title varchar(50) not null unique key,
	place varchar(50) not null,
	startDate datetime not null,
	lastDate datetime not null,
	startTime datetime not null,
	runTime int not null,
	age int not null,
	photo varchar(100) default 'logo.png',
	content text,
	kind varchar(10) not null,
	rsv_type varchar(5) default 'YES'
);

insert into tc_content values(default, '마마무 월드 투어','땡땡 아레나',now(),now(),now(),120,15,default,'마마무 콘서트','콘서트',default);
insert into tc_content values(default, '세븐틴 월드 투어','땡땡 아레나',now(),now(),now(),120,15,default,'세븐틴 콘서트','콘서트',default);
insert into tc_content values(default, '블랙핑크 월드 투어','땡땡 아레나',now(),now(),now(),120,15,default,'블랙핑크 콘서트','콘서트',default);
insert into tc_content values(default, '아이브 월드 투어','땡땡 아레나',now(),now(),now(),120,15,default,'아이브 콘서트','콘서트',default);

ALTER TABLE tc_content modify age varchar(10);
ALTER TABLE tc_content modify startTime varchar(80);
alter table tc_content alter column age varchar(10);
alter table tc_content add price int not null;

select * from tc_content where title = 'test공연' order by idx desc;
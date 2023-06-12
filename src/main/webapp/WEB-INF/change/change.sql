create table tc_change(
	idx int not null auto_increment primary key,
	nickName varchar(20) not null,
	title varchar(50) not null,
	contentInfo varchar(100) not null,
	wantSeat varchar(100) not null,
	openSw varchar(5) not null,
	writeTime datetime default now()
);

alter table tc_change add readNum int default 0;

create table tc_changeReply(
	idx int not null auto_increment primary key,
	changeIdx int not null,
	mid varchar(20) not null,
	nickName varchar(20) not null,
	wDate datetime default now(),
	content text not null
);

alter table tc_changeReply add secret varchar(5) not null;

select count(distinct c.idx) as cnt from tc_change c, tc_changeReply r where r.nickName = '길동길동' and c.idx = r.changeIdx;
select c.*, datediff(c.writeTime, now()) as day_diff, timestampdiff(hour, c.writeTime, now()) as hour_diff,(select count(*) from tc_changeReply where changeIdx=c.idx) from tc_change c, tc_changeReply r where r.nickName = '길동길동' and c.idx = r.changeIdx group by c.idx order by c.idx desc;
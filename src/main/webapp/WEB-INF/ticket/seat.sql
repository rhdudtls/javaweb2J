create table tc_seat(
	idx int not null auto_increment primary key,
	mid varchar(50) not null,
	conIdx int not null,
	seatInfo varchar(10) not null,
	foreign key(conIdx) references tc_content(idx)
);

drop table tc_seat;

alter table tc_seat add mid varchar(50) not null;
alter table tc_seat add startTime varchar(10) not null;
alter table tc_seat add ticketDate varchar(20) not null;

alter table tc_seat drop memIdx;
alter table tc_seat add foreign key(memMid) references tc_member(mid);
delete from tc_seat;
create table tc_ticket (
	idx int not null auto_increment primary key,
	memMid varchar(20) not null,
	conIdx int not null,
	ticketDate varchar(20) not null,
	ticketTime varchar(10) not null,
	ticketSeat varchar(100)not null,
	buyTicketTime datetime default now()
);

alter table tc_ticket add foreign key(memMid) references tc_member(mid);
alter table tc_ticket add foreign key(conIdx) references tc_content(idx);
alter table tc_ticket add foreign key(seatIdx) references tc_seat(idx);

alter table tc_ticket drop seatIdx;

alter table tc_ticket add totalPrice int not null;

select * from tc_ticket where idx = 15;
select *, (select * from tc_content where tc_ticket.memMid = 'ys8846' and tc_ticket.conIdx = tc_content.idx) from tc_ticket where tc_ticket.memMid = 'ys8846';

select tc_content.title, tc_content.place, tc_content.runTime, tc_content.age, tc_content.kind from tc_content,tc_ticket where tc_ticket.memMid = 'ys8846' and tc_ticket.conIdx = tc_content.idx;
select distinct c.title, t.ticketDate, t.ticketTime, t.ticketSeat from tc_ticket t, tc_content c where t.memMid = 'ys8846' and t.conIdx = c.idx;
select distinct c.title, t.ticketDate, t.ticketTime from tc_ticket t, tc_content c where t.memMid = 'ys8846' and t.conIdx = c.idx and t.ticketDate = '2023-6-29 목요일' group by title;


select t.*,c.title from tc_ticket t, tc_content c where t.memMid = 'ys8846' and c.idx = t.conIdx order by idx desc;
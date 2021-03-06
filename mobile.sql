create database mobile;

use mobile;

select * from mobdetails where clock_speed > 2.0 and int_memory >32;



select * from mobilebasic  where int_memory>32;






select * from mobilehardware;
select * from mobilebasic ;
select * from mobilelook;

drop procedure if exists mobfullspecs;
go

/* this procedure list the full details of all the mobiles in the table*/

create procedure mobfullspecs
as 
select	b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id;

go

exec mobfullspecs;





/* this procedue find a specific mobile and its specification with its id*/

drop procedure if exists findId;
go


create procedure findId @Id Int
as 
select  b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
where b.id=@Id;


exec findId @Id=110;


/* this procedure finds the mobiles with the specifications passed as parameter */


drop procedure if exists mobfinder;
go

create procedure mobfinder @memory int =32, @ram int =4,@battery int =800
as
select	b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
where b.int_memory > @memory and b.ram > @ram and b.battery_power >@battery;


exec mobfinder @memory = 32,@ram=8,@battery =900;


/* to find mobile with high specs */
drop procedure if exists findgaming;
go

create procedure findgaming @max int=100
as 
select top (@max) b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
order by int_memory desc,ram desc,battery_power desc;


exec findgaming @max=50;


/* to list the basic information of all the mobiles */
create procedure listbasic
as 
select * from mobilebasic;


exec listbasic;
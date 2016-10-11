/*create view a as (select rank() over (order by pid, time)
	pid, event, time
	from test5);

*/

/*create view another as
select
	rank() over (order by pid, time),
	pid, event, time
from test5;*/

create view t3 as (
select
	rank() over (order by pid, time),
	pid, event, time
from test5);

select e1.prev, e1.event, count(*) 
from 
	eventtransitions as e1,
	(select a1.rank as r1,
			 a2.rank as r2,
			 a1.event as a1_event,
			 a2.event as a2_event,
			 a1.pid as a1_pid,
			 a2.pid as a2_pid
	from t3 as a1, t3 as a2) as temp
where r1 = r2-1
and e1.event = a2_event
and e1.prev = a1_event
and a1_pid = a2_pid
group by e1.prev, e1.event;




/* test 0*/
/*update eventtransitions
	set count = count + 1
from 
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from events) as a 
join
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from events) as b
	on a.rank = b.rank - 1
	where eventtransitions.event = b.event and prev = a.event
	and a.pid = b.pid and b.event != a.event;

*/
/*reset table */
/*
select * from eventtransitions;

update eventtransitions
	set count = 0;
	*/


/*test 1*/

/* update eventtransitions
	set count = count + 1
from 
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from test1) as a 
join
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from test1) as b
	on a.rank = b.rank - 1
	where eventtransitions.event = b.event and prev = a.event
	and a.pid = b.pid;

*/

/* reset table */
/*update eventtransitions
	set count = 0;*/


/*test 3 show that rank has pids grouped together and or ordered in 
increasing amount of time */



/*test3 */

/*update eventtransitions
	set count = count + 1
from 
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from test3) as a 
join
(select rank() over (order by pid, time) as rank,
	pid, event, time
	from test3) as b
	on a.rank = b.rank - 1
	where eventtransitions.event = b.event and prev = a.event
	and a.pid = b.pid;





select rank() over (order by pid, time) as rank,
pid, event, time from test3;*/

/*test 4*/

/*update eventtransitions
	set count = count + 1
from */





/*on a.rank = b.rank - 1
where eventtransitions.event = b.event and eventtransitions.prev = a.event
and a.pid = b.pid;*/



/*reset table */


/*(select rank() over (order by pid, time) as rank,
	pid, event, time
	from test4 as b);*/



/*select * from b;*/



/*and a.pid = b.pid; */

/*update eventtransitions
	set count = 0;

update eventtransitions as e1
	set count = count + 1
	from 
		(
		select a1.rank as r1,
		 a2.rank as r2,
		 a1.event as a1_event,
		 a2.event as a2_event,
		 a1.pid as a1_pid,
		 a2.pid as a2_pid
		  from a as a1, a as a2)
		 as tmp
	where r1 = r2-1
	and e1.event = a2_event
	and e1.prev = a1_event
	and a1_pid = a2_pid;
*/


/*create view a as (select rank() over (order by pid, time)
	pid, event, time
	from test5);

select * from a; */


/*create view b as (select rank() over (order by pid, time)
	pid, event, time
	from test5);
*/

select * from test5;

select e1.prev, e1.event, count(*) 
from 
	eventtransitions as e1,
	(select a1.rank as r1,
			 a2.rank as r2,
			 a1.event as a1_event,
			 a2.event as a2_event,
			 a1.pid as a1_pid,
			 a2.pid as a2_pid within group (order by (a1.time))
	from a as a1, a as a2) as temp
where r1 = r2-1
and e1.event = a2_event
and e1.prev = a1_event
and a1_pid = a2_pid;




/*create view c as (select rank() over (order by pid, time)
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
	from c as a1, c as a2) as temp
where r1 = r2-1
and e1.event = a2_event
and e1.prev = a1_event
and a1_pid = a2_pid
group by e1.prev, e1.event;*/



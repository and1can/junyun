;with cte as( select rank, pid, event, time
	from (
		select rank() over (order by pid, time) as rank,
	    	pid, event, time 
			from events
	) as dt)

select distinct a.rank, a.pid, a.event, a.time, b.rank, b.pid, b.event, b.time
from cte a
left join cte b
on a.pid = b.pid
and a.rank = b.rank - 1 ;
UPDATE eventtransitions e
SET    count = COALESCE(t.count, 0) + t.count
FROM (
   SELECT prev, event, count(*) AS count
   FROM  (
      SELECT lag(pid)   OVER w AS prev_pid, pid
           , lag(event) OVER w AS prev    , event
      FROM   test5
      WINDOW w AS (ORDER BY time)
      ) t
   WHERE   prev_pid = pid  -- only where pid matches
   GROUP   BY prev, event
   ) t
WHERE  e.prev = t.prev
AND    e.event = t.event;
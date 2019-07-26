select gs."sermon_sort" as sermont_sort,
       (select ss."caption" from "sermon_sorts" ss where ss."id"=gs."sermon_sort")as caption,
       count(*)as cnt,
       (select count(*) from "preachers" pr join "preachers_ability" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."sermon_sort") as prch_count,
       (count(*)+0.0)/(select count(*) from "preachers" pr join "preachers_ability" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."sermon_sort") as cof        
from "v_graph_sermons" gs where gs."graphs"=:in_graph group by gs."sermon_sort" order by
     (select count(*) from "preachers" pr join "preachers_ability" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."sermon_sort"), 
     (count(*)+0.0)/(select count(*) from "preachers" pr join "preachers_ability" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."sermon_sort")desc;



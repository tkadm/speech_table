select * from "v_preachers" v where v."id" in(
select pa."preacher" from "preachers_ability" pa where pa."sermon_sorts"=
(select gs."sermon_sort" from "v_graph_sermons" gs where gs."graphs_worship"=:in_worship and gs."sermon_number"=:in_sermon_num));




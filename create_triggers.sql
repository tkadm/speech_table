CREATE TRIGGER "tg_graphs_worships"
AFTER INSERT
ON "graphs_worships"
FOR EACH ROW
begin
 update graphs_worships set ord=
  (select count(*) from graphs_worships w where w.graphs_date=new.graphs_date)
where rowid=new.rowid;  
end;

CREATE TRIGGER "tg_graphs_sermons"
AFTER INSERT
ON "graphs_sermons"
FOR EACH ROW
begin
 update graphs_sermons set sermon_number=
  (select count(*) from graphs_sermons w where w.graphs_worship=new.graphs_worship)
where rowid=new.rowid;  
end;

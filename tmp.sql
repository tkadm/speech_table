select ex."id" as id,ex."parent" as parent, ex."can_ref" as can_ref,ex."caption" as caption, ex."exercise_type" as exercise_type, ex."apparatus" as apparatus,(select et."caption" from "exercise_type" et where et."id"=ex."exercise_type") as exe_type_caption,a.caption as apparatus_caption, a.bar_weight as bar_weight,
(select sw."weight" from "season_weights" sw where sw."exercises"=ex.id and sw."date_"=
(select max(gh.date_) from "season_weights" gh where gh."exercises"=sw."exercises" and gh."date_"<=date('now'))
) as weight
from "exercises" ex left join apparatus a on ex."apparatus"=a.id 

val extract_git_projects : string -> Git_data.git_project_informations list

val get_contributors : string -> string list

val get_commits : string -> Git_data.commit list

val group_commits_by_user : Git_data.commit list -> (string * int) list 

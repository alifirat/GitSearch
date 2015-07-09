(**  [extract_git_projects json] extract all GitHub projects name from 
  the json [json]. *)
val extract_git_projects : string -> Git_data.git_project_informations list

(** [get_contributors json] get the list of contributors contains in [json]. *)
val get_contributors : string -> string list

(** [get_commits json] return the list of commits from [json]. *)
val get_commits : string -> Git_data.commit list

(** [group_commits_by_user l] transform the list [l] to an associative list in 
    which every element represent an author and his commits number.*)
val group_commits_by_user : Git_data.commit list -> (string * int) list 

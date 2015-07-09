(** This module represents the data that we get from the GitHub Api. *)

(** Catch the information that we want from a GitHub project.*)
type git_project_informations = {
  name: string;
  full_name : string;
  description : string
}

(** [create_git_project_informations name full_name desc] return 
    the GitHub project [name], having the description [desc] and the fullname
    [full_name]. *)
val create_git_project_informations:
  string -> string -> string -> git_project_informations

(** For a commit, we deal only with his author, the his and the date of
    his date *)
type commit = {
  author : string;
  message : string;
  time : string;
}

(** [create_commit author m d] return the commit created by [author],
 with the message [m] at the date [d].*)
val create_commit : string -> string -> string -> commit

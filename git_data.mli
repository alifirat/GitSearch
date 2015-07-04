type git_project_informations = {
  name: string;
  full_name : string;
  description : string
}

val create_git_project_informations:
  string -> string -> string -> git_project_informations


type commit = {
  author : string;
  message : string;
  time : string;
}

val create_commit : string -> string -> string -> commit

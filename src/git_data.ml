type git_project_informations = {
  name : string;
  full_name : string;
  description : string;
}

type github_directories = git_project_informations list

let create_git_project_informations name full_name desc =
  { name = name; full_name = full_name; description = desc}

type commit = {
  author : string;
  message : string;
  time : string
}

let create_commit author m d =
  {author = author; message = m; time = d}


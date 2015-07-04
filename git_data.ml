type git_project_informations = {
  name : string;
  full_name : string;
  description : string;
}

type github_directories = git_project_informations list

let create_git_project_informations name full_name description =
  { name = name; full_name = full_name; description = description}

type commit = {
  author : string;
  message : string;
  time : string
}

let create_commit author message time =
  {author = author; message = message; time = time}


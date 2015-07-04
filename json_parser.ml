open Yojson.Basic.Util

let extract_git_projects responseText =
  let json = Yojson.Basic.from_string responseText in
  let items = json |> member "items" in
  items
  |> to_list
  |> List.map (fun obj ->
      let name = obj |> member "name" |> to_string in 
      let full_name = obj |> member "full_name" |> to_string in
      let description = obj |> member "description" |> to_string in
      Git_data.create_git_project_informations name full_name description)

let get_contributors str =
  let json = Yojson.Basic.from_string str in
  json
  |> to_list
  |> List.map (fun obj -> obj |> member "login" |> to_string)

let take l n =
  let cut_list l limit = 
    List.fold_left (fun (acc,n) commit ->
        if commit.Git_data.author = "NULL"
        then acc,n
        else if n >= limit then acc,n+1
        else commit::acc,n+1) ([], 0) l in
  cut_list l n

let get_commits str = 
  let json = Yojson.Basic.from_string str in
  let l =
    json
    |> to_list 
    |> List.map (fun obj ->        
        try
          let commit = obj |> member "commit" in
          let message = commit |> member "message" |> to_string in
          let date = commit |> member "committer" |> member "date" |> to_string
          in
          let login = obj |> member "committer" |> member "login" |> to_string
          in Git_data.create_commit login message date         
        with Yojson.Basic.Util.Type_error _ ->
          let null = "NULL" in Git_data.create_commit null null null) in   
  fst (take l 100)



                      
  

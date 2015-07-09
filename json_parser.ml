open Yojson.Basic.Util

let extract_git_projects json =
  let json = Yojson.Basic.from_string json in
  let items = json |> member "items" in
  items
  |> to_list
  |> List.map (fun obj ->
      let name = obj |> member "name" |> to_string in 
      let full_name = obj |> member "full_name" |> to_string in
      let description = obj |> member "description" |> to_string in
      Git_data.create_git_project_informations name full_name description)

let get_contributors json =
  let json = Yojson.Basic.from_string json in
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

let get_commits json = 
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
          let null = "NULL" in Git_data.create_commit null null null)
    |> List.rev in 
  fst (take l 100)


let group_commits_by_user l =
  let table =
    List.fold_left (fun table commit ->
        try
          let author = commit.Git_data.author in 
          let v = Hashtbl.find table author in
          Hashtbl.replace table author (v+1);
          table
        with Not_found -> Hashtbl.add table commit.Git_data.author 1; table
      ) (Hashtbl.create 0) l in
  Hashtbl.fold (fun k v acc -> (k, v) :: acc) table []



                      
  

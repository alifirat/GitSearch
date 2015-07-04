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
      Data.create_git_project_informations name full_name description)

let get_contributors str =
  let json = Yojson.Basic.from_string str in
  json
  |> to_list
  |> List.map (fun obj -> obj |> member "login" |> to_string)




                      
  

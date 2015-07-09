open Utils

(** Global github api url (hope that doesn't change!) *)
let github_api_url = "https://api.github.com/"

(** [concat_list data sep] return the concatenation of every element in [data] 
   separated by [sep]. *) 
let concat_list data sep =
  List.map (fun (field,value) -> field ^ sep ^ value) data
  |> String.concat "&"

(** [http_request suffix params] send a HTTP GET request to the URL resulting
    from the concatenation of [github_api_url], the target information [t] and
    the URL parameters [params]. *)
let http_request t params =
  let response = XmlHttpRequest.create () in
  let url = github_api_url ^ t ^ (concat_list params  "=") in
  response##_open(Js.string "GET", Js.string url, Js.bool true);
  response##send (Js.some (Js.string ""));
  response

let search_git_project data = http_request "search/repositories?" data

let search_committers name =
  http_request
    ("repos/" ^ name ^ "/contributors")
    []
    
let search_commits name =
  http_request
    ("repos/" ^ name ^ "/commits?")
    [("per_page","100"); ("until", Date.current_date())] 

  



    
    
    

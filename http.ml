open Utils

let github_api_url = "https://api.github.com/"
  
let concat_parameters data =
  List.map (fun (field,value) -> field ^ "=" ^ value) data
  |> String.concat "&"

let http_request suffix data =
  let response = XmlHttpRequest.create () in
  let url = github_api_url ^ suffix ^ (concat_parameters data) in
  Printf.printf "url = %s\n" url;
  response##_open(Js.string "GET", Js.string url, Js.bool true);
  response##send (Js.some (Js.string ""));
  response

let search_git_project data = http_request "search/repositories?" data

let search_committers full_name = http_request ("repos/" ^ full_name ^ "/contributors") []

let search_commits full_name = http_request ("repos/" ^ full_name ^ "/commits") [] 

  



    
    
    

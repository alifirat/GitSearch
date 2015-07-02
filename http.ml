open Utils

let global_url = "https://api.github.com/search/repositories?q="
  
let concat_parameters data =
  List.map (fun (field,value) -> field ^ "=" ^ value) data
  |> String.concat "&"
  
let http_request request data =
  let response = XmlHttpRequest.create () in
  let url = global_url ^ request ^ "&" ^ (concat_parameters data) in 
  response##_open (Js.string "GET", Js.string url, Js.bool true);
  Printf.printf "url = %s\n" url;
  response##send (Js.some (Js.string ""));
  response 



    
    
    

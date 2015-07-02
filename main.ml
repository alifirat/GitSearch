open Utils

(** [alert_with_response req] show the content of the request [req] 
    in a window. *)
let print_response req = match req##readyState with
  | XmlHttpRequest.DONE ->
    let status = req##status in
    if status = 200
    then Printf.printf "%s\n" (Js.to_string (req##responseText))
    else Printf.printf "error"
  | _ -> () 

           
let () =
  (* let params = [("sort","stars"); ("order","desc")] in  *)
  (* let req = Http.search_github_project "tetris" params in *)
  (* let callback () = print_response req in  *)
  (* req##onreadystatechange <- Js.wrap_callback callback *)

  
  let button_search_id = "user-search-validate" in
  let input_search_id = "user-search" in 
  Js_client.show_github_projects button_search_id input_search_id 


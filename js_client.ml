open Utils

module Html = Dom_html

let get_user_search id =
  let input = get_element_by_id id in
  Js.to_string (input##innerHTML)

let show_github_projects button_search_id input_id =
  let display_github_projects response = match response##readyState with
    | XmlHttpRequest.DONE ->
      if response##status = 200 then
        let table = create_table "results" "project-results" in
        let tr_description = create_tr table "description" in
        create_td tr_description ["Name"; "Description"];
        let l = Json_parser.extract_git_projects
            (Js.to_string response##responseText) in 
        List.iteri (fun i r -> 
            let tr = create_tr table (string_of_int i) in 
            let data = [r.Data.name; r.Data.description] in
            create_td tr data) l;
      else Printf.printf "error"
    | _ -> () in
  
    let button_search = get_element_by_id button_search_id in  
    button_search##onclick <- Html.handler (fun _ ->
        let user_search = input_value input_id in
        Printf.printf "user_search = %s\n" user_search;
        let params = [("sort","stars"); ("order","desc")] in
        let response = Http.http_request user_search params in
        let callback () = display_github_projects response in 
        response##onreadystatechange <- Js.wrap_callback callback;
      Js._true)

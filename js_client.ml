open Utils

module Html = Dom_html

let display_git_project_stats li_id = 
  Printf.printf "%s\n" (Js.to_string li_id)

let display_github_projects response = match response##readyState with
  | XmlHttpRequest.DONE ->
    if response##status = 200 then        
      let ul = create_ul "results" "git_projects" in
      let l = Json_parser.extract_git_projects
          (Js.to_string response##responseText) in 
      List.iter (fun r -> 
          let data = ["Name = ";
                      r.Data.name;
                      " - Description = ";
                      r.Data.description] in
          let li = create_li ul r.Data.full_name data in
          li##onclick <- Html.handler (fun _ ->
              display_git_project_stats li##id;
              Js._true)) l
    else Printf.printf "error"
  | _ -> ()

  
let show_github_projects button_search_id input_id =  
    let button_search = get_element_by_id button_search_id in  
    button_search##onclick <- Html.handler (fun _ ->
        let user_search = input_value input_id in
        Printf.printf "user_search = %s\n" user_search;
        let data = [("q", user_search);("sort","stars"); ("order","desc")] in
        let response = Http.search_git_project data in
        let callback () = display_github_projects response in 
        response##onreadystatechange <- Js.wrap_callback callback;
      Js._true)

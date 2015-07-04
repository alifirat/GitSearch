open Utils

module Html = Dom_html

let display_committers response = match response##readyState with
  | XmlHttpRequest.DONE ->
    if response##status = 200 then        
      let ul = create_ul "repo-contributors" "contributors" in
      Json_parser.get_contributors (Js.to_string response##responseText) 
      |> List.iter (fun author -> 
          let data = ["Login = "; author] in
          let li = create_li ul author in
          create_a li data) 
    else Printf.printf "error"
  | _ -> ()


let display_committers_stats response = match response##readyState with
  | XmlHttpRequest.DONE ->
    if response##status = 200 then
      begin 
        Printf.printf "%s\n" (Js.to_string response##responseText);
        let arr = 
          Json_parser.get_commits  (Js.to_string response##responseText) 
          |> Json_parser.group_commits_by_user
          |> List.map (fun (author, commits) ->
              Js_data.create_pieChart_data author commits)
          |> Array.of_list in        
        let js_arr = Js.array arr in
        Firebug.console##log (js_arr);
        Js.Unsafe.fun_call
          (Js.Unsafe.variable "create_pieChart")
          [|
            Js.Unsafe.inject ((js_arr))              
          |]
      end
    else Printf.printf "error"
  | _ -> ()

  
let show_git_project_stats github_repo =  
  let lcommitters_response = Http.search_committers (Js.to_string github_repo) in
  let callback () = display_committers lcommitters_response in 
  lcommitters_response##onreadystatechange <- Js.wrap_callback callback;
  let committers_stats_response =
    Http.search_commits (Js.to_string github_repo) in
  let callback () = display_committers_stats committers_stats_response in 
  committers_stats_response##onreadystatechange <- Js.wrap_callback callback


let display_github_projects response = match response##readyState with
  | XmlHttpRequest.DONE ->
    if response##status = 200 then        
      let ul = create_ul "github-search-results" "git_projects" in
      let l = Json_parser.extract_git_projects
          (Js.to_string response##responseText) in 
      List.iter (fun r -> 
          let data = ["Name = ";
                      r.Git_data.name;
                      " - Description = ";
                      r.Git_data.description] in
          let li = create_li ul r.Git_data.full_name in
          create_a li data;
          li##onclick <- Html.handler (fun _ ->
              show_git_project_stats li##id;
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

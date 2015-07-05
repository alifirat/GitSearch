open Utils

module Html = Dom_html

let display_committers response = match response##readyState with
  | XmlHttpRequest.DONE ->
    begin match response##status with 
    | 200 ->        
      let ul = create_ul "repo-contributors" "contributors" in
      Json_parser.get_contributors (Js.to_string response##responseText) 
      |> List.iter (fun author -> 
          let str = author in          
          let li = create_li ul author in
          create_a li str) 
    | _ -> Printf.printf "Unexcepted status" end
  | _ -> Printf.printf "Unexcepted state"
    


let display_committers_stats response = match response##readyState with
  | XmlHttpRequest.DONE ->
    begin match response##status with
      | 200 ->
        Js_client_ui.create_menu_tabs "GitSearchTabs";
        let l =
          Json_parser.get_commits (Js.to_string response##responseText) in
        let values = 
          Json_parser.group_commits_by_user l
          |> List.map (fun (author, commits) ->
              Js_data.create_discreteBar_item author (float_of_int commits))
          |> Array.of_list 
          |> Js.array in
        let discreteBar_chart =
          Js_data.create_discreteBar_chart "Commits-impact" values in
        let js_arr = Js.array ([|discreteBar_chart |]) in 
        Js.Unsafe.fun_call
          (Js.Unsafe.variable "create_discreteBar_chart")
          [|
            Js.Unsafe.inject ((js_arr))              
          |];
        let js_arr =
        l
        |> List.mapi (fun i commit ->
            Js_data.create_timeline_data i commit.Git_data.message
              commit.Git_data.time)
        |> Array.of_list
        |> Js.array in
        Js.Unsafe.fun_call
        (Js.Unsafe.variable "create_timeline")
        [|
          Js.Unsafe.inject ((js_arr))              
        |]
      | _ -> Printf.printf "Unexcepted status\n" end
  | _ -> Printf.printf "Unxcepted state\n"

  
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
          let str = String.concat " " ["Name = ";
                      r.Git_data.name;
                      " - Description = ";
                      r.Git_data.description] in
          let li = create_li ul r.Git_data.full_name in
          create_a li str;
          li##onclick <- Html.handler (fun _ ->
              let div_git_projects =get_element_by_id "github-search-results" in
              div_git_projects##style##display <- Js.string "none";
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

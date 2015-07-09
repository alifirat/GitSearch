open Utils
  
module Html = Dom_html

let create_menu_tabs ul_id =
  let div = get_element_by_id "github-repo-stats" in 
  let ul = get_element_by_id ul_id in 
  let li_contributors = create_li ul "tabContributors" in
  li_contributors##className <- Js.string "active";
  li_contributors##onclick <- Html.handler (fun _ -> 
      let div_stats = get_element_by_id "repo-contributors-stats" in
      div_stats##style##display <- Js.string "none";
      let div_contrib = get_element_by_id "repo-contributors" in
      div_contrib##style##display <- Js.string "block";
      let div_timeline = get_element_by_id "repo-timeline" in
      div_timeline##style##display <- Js.string "none";
      Js._true);
  create_a li_contributors "Contributors";
  let li_stats = create_li ul "tabStats" in
  li_stats##onclick <- Html.handler (fun _ ->
      let div_stats = get_element_by_id "repo-contributors-stats" in
      div_stats##style##display <- Js.string "block";
      let div_contrib = get_element_by_id "repo-contributors" in
      div_contrib##style##display <- Js.string "none";
      let div_timeline = get_element_by_id "repo-timeline" in
      div_timeline##style##display <- Js.string "none";
      Js._true);
  create_a li_stats "Chart analysis";
  let li_timeline = create_li ul "tabTimeline" in
  li_timeline##onclick <- Html.handler (fun _ ->
      let div_timeline = get_element_by_id "repo-timeline" in
      div_timeline##style##display <- Js.string "block";      
      let div_stats = get_element_by_id "repo-contributors-stats" in
      div_stats##style##display <- Js.string "none";
      let div_contrib = get_element_by_id "repo-contributors" in
      div_contrib##style##display <- Js.string "none";
      Js._true);
  create_a li_timeline "Timeline"


let add_favorite_button div_id id content =
  let div = get_element_by_id div_id in 
  let a = Html.createA doc in
  a##id <- Js.string id;
  a##rel <- Js.string "sidebar";
  a##textContent <- Js.some (Js.string content);
  a##href <- Js.string "#";
  Dom.insertBefore Html.document##body a (Js.some div)

let add_project_title div_id id title =
  let div = get_element_by_id div_id in
  let h1 = Html.createH1 doc in
  h1##id <- Js.string id;
  h1##textContent <- Js.some (Js.string title);
  h1##style##textAlign <- Js.string "center";
  Dom.insertBefore Html.document##body h1 (Js.some div)

let change_displaying id display =
  let elt = get_element_by_id id in
  elt##style##display <- Js.string display 

let show_element id = change_displaying id "block"

let hide_element div = change_displaying div "none"



open Utils
  
module Html = Dom_html

let create_menu_tabs ul_id =
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


let set_project_title id title =
  let h1 = get_element_by_id id in
  h1##textContent <- Js.some (Js.string title)

let string_of_display display = match display with 
    | `Block -> "block"
    | `None -> "none"

(** [change_displaying id display] set the css property display of the
    element with the id [id] to [display]. *)
let change_displaying id display =
  let elt = get_element_by_id id in
  elt##style##display <- Js.string (string_of_display display)
      
let show_element id = change_displaying id `Block

let hide_element div = change_displaying div `None



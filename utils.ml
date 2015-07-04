open Js

module Html = Dom_html

let doc = Html.document
let win = Html.window

let get_element_by_id id =
  Js.Opt.get (doc##getElementById (Js.string id)) (fun () -> assert false)

let input_value id =
  let input = get_element_by_id id in
  let input = Js.Unsafe.coerce input in 
  Js.to_string (input##value)

let clear_div div_id =
  let div = get_element_by_id div_id in
  Dom.list_of_nodeList (div##childNodes)
  |> List.iter (fun child -> Dom.removeChild div child)

let create_ul div_id ul_id =
  let div = get_element_by_id div_id in
  let ul = Html.createUl doc in
  ul##id <- Js.string ul_id;
  Dom.appendChild div ul;
  ul

let create_li ul li_id data =
  let li = Html.createLi doc in
  li##id <- Js.string li_id;
  let li_content = String.concat " " data in
  li##innerHTML <- Js.string li_content;
  Dom.appendChild ul li;
  li





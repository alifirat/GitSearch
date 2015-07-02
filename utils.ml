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

let create_table div_id table_id =
  let div = get_element_by_id div_id in 
  let table = Html.createTable doc in
  table##id <- Js.string table_id;
  Dom.appendChild div table;
  table

let create_tr table tr_id =
  let tr = Html.createTr doc in
  tr##id <- Js.string tr_id;
  Dom.appendChild table tr;
  tr

let create_td tr l =
  List.iter (fun td_text ->
      let td = Html.createTd doc in
      td##innerHTML <- Js.string td_text;
      Dom.appendChild tr td) l       


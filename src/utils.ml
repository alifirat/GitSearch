open Js

module Html = Dom_html

let doc = Html.document
let win = Html.window

let get_element_by_id id =
  Printf.printf "%s\n" id;
  Js.Opt.get (doc##getElementById (Js.string id)) (fun () -> assert false)

let input_value id =
  let input = get_element_by_id id in
  let input = Js.Unsafe.coerce input in 
  Js.to_string (input##value)

let remove_allChilds id =
  let element = get_element_by_id id in
  Dom.list_of_nodeList (element##childNodes)
  |> List.iter (fun child -> Dom.removeChild element child)


let create_ul div_id ul_id =
  let div = get_element_by_id div_id in
  let ul = Html.createUl doc in
  ul##id <- Js.string ul_id;
  Dom.appendChild div ul;
  ul

let create_li ul li_id =
  let li = Html.createLi doc in
  li##id <- Js.string li_id;
  Dom.appendChild ul li;
  li

let create_a li str =
  let a = Html.createA doc in
  a##textContent <- Js.some (Js.string str);
  Dom.appendChild li a

(* let update_url bookmark_id key value = *)
(*   let url = Js.to_string win##location##href in  *)
(*   let new_url = Js.string (url ^ "#" ^ key ^ "=" ^ value) in *)
(*   ((win##history))##pushState(Js.string "foo",Js.string bookmark_id,Js.some (new_url)) *)


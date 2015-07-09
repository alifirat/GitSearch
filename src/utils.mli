val doc : Dom_html.document Js.t

val win : Dom_html.window Js.t
    
(** [get_element_by_id id] return the element having the identifier [id]. *)
val get_element_by_id : string -> Dom_html.element Js.t

(** [input_value id] return the value of the input element having the identifier 
    [id]. *)
val input_value : string -> string

(** [remove_allChilds id] get the element having the identifier [id] and remove 
    all childs elements into it *)
val remove_allChilds : string -> unit 

(** [create_ul div_id ul_id] create a fresh <ul> element with the identifier 
    [ul_id] into a div having for identifier [div_id] and return the newest ul *)
val create_ul : string ->  string -> Dom_html.uListElement Js.t

(** [create_li ul li_id] create a fresh <li> element, add it into the [ul] and 
    return the newest li element. *)
val create_li : Dom_html.uListElement Js.t -> string -> Dom_html.liElement Js.t

(** [create_a li str] add a <a> element into a <li> element and set the 
     text content of the newest <a> to [str].*)
val create_a : Dom_html.liElement Js.t -> string -> unit

(* val update_url : string -> string -> string -> unit  *)


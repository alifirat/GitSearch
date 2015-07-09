(** [create_menu_tabs ul_id] add a menu tab allowing to a user to choose 
    the kind of stats to show in the <ul> element having the id [ul_id] .*)
val create_menu_tabs: string -> unit 

(** [add_favorite_button div_id id content] add a favorite button in the
    div having the id [div_id] with the textContent [content]. *)
val add_favorite_button : string -> string -> string -> unit

(** [add_project_title div_id id title] display the [title] of a GitHub project 
    in the div with the id [div_id].*)
val add_project_title : string -> string -> string -> unit

(** [show_element id] make visible the html element having for id [id]. *)
val show_element : string -> unit

(** [show_element id] hide the html element having for id [id]. *)
val hide_element : string -> unit

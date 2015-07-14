(** [create_menu_tabs ul_id] add a menu tab allowing to a user to choose 
    the kind of stats to show in the <ul> element having the id [ul_id] .*)
val create_menu_tabs: string -> unit 


(** [set_project_title id title] set the title of the GitHub project's 
    title to [title]. *)
val set_project_title : string -> string -> unit

(** [show_element id] make visible the html element having for id [id]. *)
val show_element : string -> unit

(** [show_element id] hide the html element having for id [id]. *)
val hide_element : string -> unit

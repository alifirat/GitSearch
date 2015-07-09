(** Module representing all JS data that we need to display the chart *)

(** Representing of item of the discreteBar chart*)
class type discreteBar_item = object
  method label : Js.js_string Js.t Js.prop
  method value : float Js.prop
end

(** [create_discreteBar_item lbl value] create JS object with the fields 
    label setting to [lbl] and value to [v]. *)
val create_discreteBar_item : string -> float -> discreteBar_item Js.t

(**  Data representing the global discreteBar chart*)
class type discreteBar_chart = object
  method key: Js.js_string Js.t Js.prop
  method values : discreteBar_item Js.t Js.js_array Js.t Js.prop 
end

(** [create_discreteBar_chart k vls] create JS object with the fields key 
    setting to [k] and values setting to [vls].*)
val create_discreteBar_chart:string ->
  discreteBar_item Js.t Js.js_array Js.t -> 
  discreteBar_chart Js.t

(**  Excepted data for displaying the timeline. *)
class type timeline_data = object
  method id : int Js.prop
  method content : Js.js_string Js.t Js.prop
  method start: Js.js_string Js.t Js.prop
end

(** [create_timeline_data id content start] create JS object with the fields
    id setting to [id], content setting to [cnt] and start setting to [s].*)
val create_timeline_data : int -> string -> string -> timeline_data Js.t


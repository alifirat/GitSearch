class type discreteBar_item = object
  method label : Js.js_string Js.t Js.prop
  method value : float Js.prop
end
   
val create_discreteBar_item : string -> float -> discreteBar_item Js.t

class type discreteBar_chart = object
  method key: Js.js_string Js.t Js.prop
  method values : discreteBar_item Js.t Js.js_array Js.t Js.prop 
end

val create_discreteBar_chart:string ->
  discreteBar_item Js.t Js.js_array Js.t -> 
  discreteBar_chart Js.t
  
class type timeline_data = object
  method id : int Js.prop
  method content : Js.js_string Js.t Js.prop
  method start: Js.js_string Js.t Js.prop
end

val create_timeline_data : int -> string -> string -> timeline_data Js.t


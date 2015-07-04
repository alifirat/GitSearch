class type pieChart_data = object
  method key : Js.js_string Js.t Js.prop
  method y : int Js.prop
end

    
val create_pieChart_data : string -> int -> pieChart_data Js.t


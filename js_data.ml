class type discreteBar_item = object
  method label : Js.js_string Js.t Js.prop
  method value : float Js.prop
end

let empty_discreteBar_item () : discreteBar_item Js.t = Js.Unsafe.obj [| |]

let create_discreteBar_item label value =
  let data = empty_discreteBar_item () in
  data##label <- Js.string label;
  data##value <- value;
  data

class type discreteBar_chart = object
  method key: Js.js_string Js.t Js.prop
  method values : discreteBar_item Js.t Js.js_array Js.t Js.prop 
end

let empty_discreteBar_chart () : discreteBar_chart Js.t = Js.Unsafe.obj [| |]    

let create_discreteBar_chart key values = 
  let chart = empty_discreteBar_chart () in
  chart##key <- Js.string key;
  chart##values <- values;
  chart


class type timeline_data = object
  method id : int Js.prop
  method content : Js.js_string Js.t Js.prop
  method start: Js.js_string Js.t Js.prop
end


let empty_timeline_data () : timeline_data Js.t = Js.Unsafe.obj [| |]

let create_timeline_data id content start =
  let data = empty_timeline_data () in
  data##id <- id;
  data##content <- Js.string content;
  data##start <- Js.string start;
  data
  


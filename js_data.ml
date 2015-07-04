class type pieChart_data = object
  method key : Js.js_string Js.t Js.prop
  method y : int Js.prop
end

let empty_pieChart_data () : pieChart_data Js.t = Js.Unsafe.obj [| |]

let create_pieChart_data label value =
  let data = empty_pieChart_data () in
  data##key <- Js.string label;
  data##y <- value;
  data

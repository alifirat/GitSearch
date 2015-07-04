open Js

let parse_date s =
  Scanf.sscanf s "%d/%d/%d" (fun month day year -> (month,day,year))
    
let parse_time s =
  Scanf.sscanf s "%d:%d:%d %s" (fun hour minute seconds _->
      (hour,minute,seconds))
    
let current_date () = 
  let date = jsnew Js.date_now () in
  let (month,day,year) = parse_date (Js.to_string date##toLocaleDateString()) in
  let (hour,minute,seconds) =
    parse_time (Js.to_string date##toLocaleTimeString()) in
  (string_of_int year) ^ "-" ^ (string_of_int month) ^ "-" ^
  (string_of_int day) ^ "T" ^ (string_of_int hour) ^ ":" ^
  (string_of_int month) ^ ":" ^ (string_of_int seconds) ^ "Z"

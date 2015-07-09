open Utils
           
let () =  
  let button_search_id = "user-search-validate" in
  let input_search_id = "user-search" in 
  Js_client.set_callback_for_search button_search_id input_search_id 


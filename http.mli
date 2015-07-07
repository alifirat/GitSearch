(** [search_git_project data] send a request corresponding to a search of a 
    GitHub project (contains in [data]) and return the resulting response of the 
    server. *)
val search_git_project:(string*string) list->XmlHttpRequest.xmlHttpRequest Js.t

(** [search_commiters name] return the resulting response from the server 
    to the request getting all committers of the project [name]. *)
val search_committers : string -> XmlHttpRequest.xmlHttpRequest Js.t

(** [search_commits name] return the resulting response from the server 
    to the request getting the last 100 commits of the project [name] *)
val search_commits : string ->  XmlHttpRequest.xmlHttpRequest Js.t

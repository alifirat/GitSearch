val http_request: 
  string ->
  (string * string) list ->
  XmlHttpRequest.xmlHttpRequest Js.t

val search_git_project:
  (string * string) list -> XmlHttpRequest.xmlHttpRequest Js.t

val search_committers : string -> XmlHttpRequest.xmlHttpRequest Js.t

val search_commits : string ->  XmlHttpRequest.xmlHttpRequest Js.t

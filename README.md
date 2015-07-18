<h3> Description </h3>

<p>
	GitSearch is an web application allowing to search an GitHub project and to get the following stats :
	<ul>
	  <li>The list of contributors</li>
	  <li>The impact of every contributor based on the last 100 commits</li>
	  <li>A timeline showing the commits and also based on the last 100 commits</li>
	</ul>.
</p>

<h3> Requirements </h3>

<p>To compile this project, you need to have <a href="https://ocaml.org/docs/install.fr.html">Ocaml<a/> plus the following packages : </p>

<ul>  
  <li>ocamlfind</li>
  <li>ocamlc/ocamlopt</li>
  <li>yojson</li>
  <li>js_of_ocaml</li>
  <li>js_of_ocaml.syntax</li>
  <li>camlp4o</li>
</ul>

<p>To install these packages, you can install them with <a href="http://opam.ocaml.org/">OPAM</a>. Enter the following commands : </p>

<ul>
<li>opam install ocamlfind</li>
<li>opam install js_of_ocaml</li>
<li>opam install yojson</li>
<li>opam install camlp4o</li>
</ul>

<h3> Compilation </h3>

Enter the following command in your terminal : 
	  
``$ make``

<h3> Execution </h3>

Open in a web browser the file index.html (located in www)



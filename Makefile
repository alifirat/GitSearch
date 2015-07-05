#*********************************************************************#
#                                                                     #
#                           Objective Caml                            #
#                                                                     #
#            Pierre Weis, projet Cristal, INRIA Rocquencourt          #
#                                                                     #
#  Copyright 1998 Institut National de Recherche en Informatique et   #
#  en Automatique.  Distributed only by permission.                   #
#                                                                     #
#*********************************************************************#


SOURCES = utils.mli utils.ml git_data.mli git_data.ml js_data.mli js_data.ml date.mli date.ml http.mli http.ml json_parser.mli json_parser.ml js_client_ui.mli js_client_ui.ml js_client.mli js_client.ml main.ml
CAMLFIND = ocamlfind
CAMLC = ocamlc
CAMLOPT = ocamlopt
OBJS = $(SOURCES:.ml=.cmo)
OPTOBJS = $(SOURCES:.ml=.cmx)
MLIS = $(SOURCES:.mli=.cmi)
PACKAGES= -package js_of_ocaml -package js_of_ocaml.syntax -package yojson -syntax camlp4o
JS_OF_CAML= js_of_ocaml 
LINKPKG = -linkpkg
EXEC = githubsearch

all: $(EXEC).js

opt : $(EXEC).opt

$(EXEC).js: $(EXEC).byte
	$(JS_OF_CAML) $(EXEC).byte
	mv $(EXEC).js  ./www/js/

$(EXEC).byte: $(MLIS) $(OBJS) 
	$(CAMLFIND) $(CAMLC) $(PACKAGES) -o $(EXEC).byte $(LIBS) $(OBJS) $(LINKPKG)

$(EXEC).opt: $(MLIS) $(OPTOBJS) 
	$(CAMLFIND) $(CAMLOPT) $(PACKAGES) -o $(EXEC) $(LIBS:.cma=.cmxa) $(OPTOBJS)  $(LINKPKG)

.SUFFIXES:

.SUFFIXES: .ml .mli .cmo .cmi .cmx 

.ml.cmo:
	$(CAMLFIND) $(CAMLC) $(PACKAGES) -c $< $(LINKPKG)

.mli.cmi:
	$(CAMLFIND) $(CAMLC) $(PACKAGES) -c $< $(LINKPKG)

.ml.cmx:
	$(CAMLFIND) $(CAMLOPT) $(PACKAGES) -c $< $(LINKPKG)

clean:
	rm -f *.cm[iox] *~ .*~ #*#
	rm -f $(EXEC)
	rm -f $(EXEC).opt
	rm -f *.o



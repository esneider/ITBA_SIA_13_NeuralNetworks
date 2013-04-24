#!/bin/bash

gcc -I. -w -E -x c -o informe_completo.html.bak informe.html
cat informe_completo.html.bak | egrep -v "^#.*$" | sed "s/@/#/g" > informe_completo.html
rm informe_completo.html.bak

gcc -I. -w -E -x c -o anexo_completo.html.bak anexo.html
cat anexo_completo.html.bak | egrep -v "^#.*$" | sed "s/@/#/g" > anexo_completo.html
rm anexo_completo.html.bak

gcc -I. -w -E -x c -o portada_completo.html.bak portada.html
cat portada_completo.html.bak | egrep -v "^#.*$" | sed "s/@/#/g" > portada_completo.html
rm portada_completo.html.bak

coderdojo-processing
====================

Este repo contiene el proyecto de final de curso del grupo Processing del CoderDojo.

Consiste en una instalación interactiva musical con mapping.

El proyecto consta de dos partes

Arduino 
=======

Como soporte físico se han fabricado 4 cajas cortadas con laser.

En el interior de las cajas se han introducido sensores de contacto.

Mediante un arduino se reciben estos datos y se envían al pc


Processing
==========

El software desarrollado en Processing.org recibe los datos y determina qué sensor se ha activado.

Emite un sonido distinto por cada sensor así como se alteran unas visualizaciones mapeadas a las cajas.

Para el mapping se ha utilizado la librería Keystone.

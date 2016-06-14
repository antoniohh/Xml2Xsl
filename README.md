# Xml2Xsl
## Versión 1.1.0.0
## Hojas de Estilos XSL.

### Novedades versión 1.1.0.0.

Lanzamiento del Tutorial.
En desarrollo.

### Implementaciones.

Proyecto HTML5 generado en NetBeans 8.1, con los archivos XML, XSL y Css.

### Descripción.

Tutorial expicativo desarrollo hojas de estilo para documentos estructurados XML.

### Fundamentos.

Las hojas de estilos XSL transforman el contenido de los documentos XML (XSLT),
y les aplican formato (objetos de formato) de cara a su visualización en un navegador.

### Estructura de una hoja de estilo XSL.

> Documento XML con extensión .xsl, en el que se definen las transformaciones a realizar
 mediante una serie de elementos y atributos.

> Incluye el elemento stylesheet, que declara el espacio de nombres para poder utilizar los elementos y atributos XSL: <xsl:stylesheet xmlns:xsl=“http://www.w3.org/TR/WD-xsl”>

> Se utiliza la instrucción de procesamiento xml-stylesheet: <?xml-stylesheet type=“text/xsl” href=“estilo.xsl”>

> la plantilla es el elemento utilizado en la hoja de estilos para realizar las transformaciones.

### Template (Plantilla).

> Establece las transformaciones a realizar en el documento.

> Se definen utilizando el elemento xsl:template.

> A través del atributo match, se establece el patrón, la rama del árbol XML sobre
la que se aplica la plantilla.

> El atributo 'name' que dará nombre a la plantilla para poder ser invocada desde la instrucción
<xsl:call-template name=nombre_de_plantilla>

> El árbol del documento completo utiliza el patrón raíz (/): <xsl:template match=“/”>

> El contenido de la plantilla indican la transformación a realizar sobre el patrón.

> El atributo 'mode' permite que se procese varias veces un elemento especificado
por su nombre completo (XSLT), obteniendo cada vez un resultado distinto.

### Ruta del documento: XPATH.

Otros caracteres empleados para la construcción de patrones son:

```
. Nodo actual.
.. Superior al nodo actual.
| Alternativas (opcion a|opcion b).
// Hace que coincidan los descendientes en vez de los secundarios.
* Todos los elementos.
@ Atributo.
[] Filtro.
$all$ Todos deben cumplir la condición.
$any$ Alguno debe cumplir la condición.
```

### Operadores.

Otros caracteres empleados para la construcción de patrones son:

```
and
or
not()
=
!=
< $lt$
<= $ile$
> $gt$
>= $ige$
```

### Elementos del Template.

Pertenecen al vocabulario XSLT, definido en el espacio de nombres XSL, siendo los
mas comunes:

> xsl:value-of = Inserta el valor de un elemento o atributo en la salida resultante.
Se puede utilizar 'select' para seleccionar el atributo o subelemento.

> xsl:if = Si se cumple la condición establecida en el atributo 'test' se realiza la
transformación.

> xsl:for-each = Util para recorrer los elementos de un documento, y realizar
operaciones con los mismos. Con el atributo 'select' se determina el elemento.
Con 'order-by' ordenamos los datos procesados por el bucle.

> xsl:apply-templates = Aplica, en el lugar donde aparece, el template especificado
para el elemento indicado en el atributo select. Se escribe en el Html para indicar
que en ese punto del documento, se aplicará la transformación definida

> xsl:choose = Permite seleccionar entre varias opciones, las cuales se establecen
con la etiqueta <xsl:when>. Si no cumple ningun 'xsl:when', se ejecutará xsl:otherwise.

### Licencia.

**GNU GENERAL PUBLIC LICENSE** Version 3, 29 June 2007. Ver el archivo LICENSE.

Xml2Xsl.

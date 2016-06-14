<?xml version="1.0" encoding="UTF-8"?>

<!--
Copyright (C) 2016 Antonio Horrillo Horrillo

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->

<!--
    Document   : alumnos.xsl
    Created on : 14 de junio de 2016, 1:36
    Author     : Antonio Horrillo Horrillo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/modulo">
        <!-- Definimos el codigo html para la pagina. -->
        <html>
            <head>
                <!-- Enlazamos el archivo css con los diversos estilos que queremos aplicar.
                El archivo esta dentro de la carpeta css. -->
                <link href="css/estilos.css" type="text/css" rel="stylesheet" />
                <title>Xml - Xsl - Css</title>
            </head>
            <body>
                <!-- Titulo principal. -->
                <h1>Listado de Alumnos</h1>

                <!-- Creamos la tabla de aprobados. -->
                <table>

                    <!-- Agrupamos las celdas de la primera fila. Mostramos los alumnos aprobados. -->
                    <tr class="gris1">
                        <th colspan="4">Aprobados</th>
                    </tr>

                    <!-- Fila con las celdas Nombre, Apellidos, Faltas de asistencia y Calificación Final. -->
                    <tr class="gris2">
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Faltas de asistencia</th>
                        <th>Calificación Final</th>
                    </tr>

                    <!-- Aplicamos las condiciones. -->
                    <xsl:apply-templates select="/modulo/alumno" mode="aprobado" />

                    <!-- Cerramos la tabla de aprobados. -->
                </table>

                <!-- Separamos las tablas. -->
                <br/>
                <br/>

                <!-- Creamos la tabla de suspensos. -->
                <table>

                    <!-- Agrupamos las celdas de la primera fila. Mostramos los alumnos suspensos. -->
                    <tr class="gris1">
                        <th colspan="4">Suspensos</th>
                    </tr>

                    <!-- Fila con las celdas Nombre, Apellidos, Faltas de asistencia y Calificación Final. -->
                    <tr class="gris2">
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Faltas de asistencia</th>
                        <th>Calificación Final</th>
                    </tr>

                    <!-- Aplicamos las condiciones. -->
                    <xsl:apply-templates select="/modulo/alumno" mode="suspenso"/>

                    <!-- Cerramos la tabla de suspensos. -->
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template para filtrar los alumnos suspensos (mode="aprobado"). El atributo mode permite que se procese varias veces
    un elemento especificado por su Nombres completos (XSLT), obteniendo cada vez un resultado distinto. -->
    <xsl:template match="/modulo/alumno" mode="aprobado">

        <!-- Condicion if. Si se cumple la condicion, se muestra el contenido. La Nota debe ser mayor o igual a cinco.-->
        <xsl:if test="datos_academicos/nota&gt;=5">

            <!-- Obtenemos los valores de las celdas de la tabla del XML relacionando. Todos
            los elementos se obtienen y se muestran directamente, excepto el elemento nota,
            el cual, mediante condicion choose y otherwise establecemos su valor. -->
            <tr class="gris3">
                <td>
                    <xsl:value-of select="datos_personales/nombre_alumno/nombre"/>
                </td>
                <td>
                    <xsl:value-of select="datos_personales/nombre_alumno/apellido1"/>
                    <span>&#160;</span>
                    <xsl:value-of select="datos_personales/nombre_alumno/apellido2"/>
                </td>
                <td>
                    <xsl:value-of select="datos_academicos/faltas_asistencia"/>
                </td>
                <td>
                    <!-- En el elemento Final el valor que contiene se convierte a texto cumpliendo las condiciones:
                    Si es mayor o igual a 9 será SOBRESALIENTE, si es menor que 9 y mayor o igual a 7
                    será NOTABLE, si está entre 7 y 6, este último incluido será BIEN, si está entre 6 y 5 será
                    SUFICIENTE y en otro caso INSUFICIENTE.Condiciones para las notas en modo texto -->
                    <xsl:choose>
                        <xsl:when test="datos_academicos/nota&gt;=9 and datos_academicos/nota&lt;=10">
                            <div class="sob">SOBRESALIENTE</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=7 and datos_academicos/nota&lt;9">
                            <div class="not">NOTABLE</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=6 and datos_academicos/nota&lt;7">
                            <div class="bie">BIEN</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=5 and datos_academicos/nota&lt;6">
                            <div class="suf">SUFICIENTE</div>
                        </xsl:when>
                        <!-- En caso de no cumplirse ninguna de las condiciones anteriores, se cumple la siguiente. -->
                        <xsl:otherwise>
                            <div class="ins">INSUFICIENTE</div>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <!-- Template para filtrar los alumnos suspensos (mode="suspenso"). -->
    <xsl:template match="/modulo/alumno" mode="suspenso">

        <!-- Condicion if. Si se cumple la condicion, se muestra el contenido. La Nota debe ser menor a cinco.-->
        <xsl:if test="datos_academicos/nota&lt;5">

            <!-- Obtenemos los valores de las celdas de la tabla del XML relacionando. Todos
            los elementos se obtienen y se muestran directamente, excepto el elemento nota,
            el cual, mediante condicion choose y otherwise establecemos su valor. -->
            <tr class="gris3">
                <td>
                    <xsl:value-of select="datos_personales/nombre_alumno/nombre"/>
                </td>
                <td>
                    <xsl:value-of select="datos_personales/nombre_alumno/apellido1"/>
                    <span>&#160;</span>
                    <xsl:value-of select="datos_personales/nombre_alumno/apellido2"/>
                </td>
                <td>
                    <xsl:value-of select="datos_academicos/faltas_asistencia"/>
                </td>
                <td>
                    <!-- En el elemento Final el valor que contiene se convierte a texto cumpliendo las condiciones:
                    Si es mayor o igual a 9 será SOBRESALIENTE, si es menor que 9 y mayor o igual a 7
                    será NOTABLE, si está entre 7 y 6, este último incluido será BIEN, si está entre 6 y 5 será
                    SUFICIENTE y en otro caso INSUFICIENTE.Condiciones para las notas en modo texto -->
                    <xsl:choose>
                        <xsl:when test="datos_academicos/nota&gt;=9 and datos_academicos/nota&lt;=10">
                            <div class="sob">SOBRESALIENTE</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=7 and datos_academicos/nota&lt;9">
                            <div class="not">NOTABLE</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=6 and datos_academicos/nota&lt;7">
                            <div class="bie">BIEN</div>
                        </xsl:when>
                        <xsl:when test="datos_academicos/nota&gt;=5 and datos_academicos/nota&lt;6">
                            <div class="suf">SUFICIENTE</div>
                        </xsl:when>
                        <!-- En caso de no cumplirse ninguna de las condiciones anteriores, se cumple la siguiente. -->
                        <xsl:otherwise>
                            <div class="ins">INSUFICIENTE</div>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
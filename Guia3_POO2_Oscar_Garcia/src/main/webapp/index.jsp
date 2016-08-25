<%-- 
    Document   : index
    Created on : 08-25-2016, 12:38:35 PM
    Author     : root
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.LugaAcceCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guia 3 POO2</title>
        <link rel="stylesheet" href="css/foundation.css">
        <link rel="stylesheet" href="css/app.css">
    </head>
    <body>
        <div class="row">
            <div class="large-12 column">
                <h1>Guia 3 POO2</h1>
            </div>
        </div>
        <div class="row">
            <div class="medium-centered columns">
                <ul class="tabs" data-tabs id="example-tabs">
                    <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Lugar Acceso</a></li>
                    <li class="tabs-title"><a href="#panel2">Tab 2</a></li>
                    <li class="tabs-title"><a href="#panel3">Tab 3</a></li>
                </ul>
                <div class="tabs-content" data-tabs-content="example-tabs">
                    <div class="tabs-panel is-active" id="panel1">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form>
                                    <h6>Nuevo Registro</h6>
                                    <div class="medium-6 columns">
                                        <label>Lugar Acceso
                                            <input type="text" id="txtlugar" name="txtlugar" placeholder="Lugar Acceso">
                                        </label>
                                    </div>
                                    <div class="medium-6 columns">
                                        <label style="color:white">d</label>
                                        <button type="button" class="success button" onclick="hola()">Guardar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <jsp:useBean id="beanUnidOrgnCtrl" class="com.sv.udb.controlador.LugaAcceCtrl" scope="page"/>
                        <table class="hover">              
                            <thead>
                            <th width="200">Código</th>
                            <th width="200">Lugar Acceso</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${beanUnidOrgnCtrl.consTodo()}" var="fila">
                                    <tr>
                                        <td>${fila.codiLugaAcce}</td>
                                        <td>${fila.nombLugaAcce}</td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <div class="tabs-panel" id="panel2">
                        <p>Suspendisse dictum feugiat nisl ut dapibus.  Vivamus hendrerit arcu sed erat molestie vehicula. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor.  Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor.</p>
                    </div>
                    <div class="tabs-panel" id="panel3">
                        <p>dSuspendisse dictum feugiat nisl ut dapibus.  Vivamus hendrerit arcu sed erat molestie vehicula. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor.  Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor.</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/vendor/jquery-dateFormat.js"></script>
        <script src="js/app.js"></script>
        <script type="text/javascript">
            function hola()
            {
                var idg = $("#txtlugar").val();
                $.ajax({
                    url: 'BodegaServ',
                    data: {nombre: idg},
                    type: 'get',
                    cache: false,
                    success: function (data) {
                        if (data == "a") {
                            alert('El elemento fue correctamente eliminado');
                            recargartabla();
                        }
                    },
                    error: function () {
                        alert('hubo un error al eliminar');
                    }
                });
            }
        </script>
    </body>
</html>

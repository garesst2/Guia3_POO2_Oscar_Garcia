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
            <ul class="tabs" data-tabs id="example-tabs">
                <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Lugar Acceso</a></li>
                <li class="tabs-title"><a href="#panel2">Tab 2</a></li>
                <li class="tabs-title"><a href="#panel3">Tab 3</a></li>
            </ul>
            <div class="tabs-content" data-tabs-content="example-tabs">
                <div class="tabs-panel is-active" id="panel1">
                    <jsp:useBean id="beanUnidOrgnCtrl" class="com.sv.udb.controlador.LugaAcceCtrl" scope="page"/>
                    <table class="hover">              
                        <thead>
                        <th width="200">Código</th>
                        <th width="200">Lugar Acceso</th>
                        </thead>
                        <c:forEach items="${beanUnidOrgnCtrl.consTodo()}" var="fila">
                            <option value="${fila.codiLugaAcce}">${fila.nombLugaAcce}</option>
                        </c:forEach> 
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
        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/vendor/jquery-dateFormat.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>

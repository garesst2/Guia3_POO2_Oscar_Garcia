<%-- 
    Document   : index
    Created on : 08-25-2016, 12:38:35 PM
    Author     : root
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.LugaAcceCtrl"%>
<%@page import="com.sv.udb.controlador.TipoDocuCtrl"%>
<%@page import="com.sv.udb.controlador.TipoGafeCtrl"%>
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
                    <li class="tabs-title"><a href="#panel2">Tipo Documento</a></li>
                    <li class="tabs-title"><a href="#panel3">Tipo Gafete</a></li>
                </ul>
                <div class="tabs-content" data-tabs-content="example-tabs">
                    <div class="tabs-panel is-active" id="panel1">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form name="form1" method="post" action="LugaAcceServ">
                                    <input style="display: none" type="text" id="txtlugarid" name="txtlugarid" placeholder="Lugar Acceso">
                                    <h6>Nuevo Registro</h6>
                                    <div class="medium-6 columns">
                                        <label>Lugar Acceso
                                            <input type="text" id="txtlugar" name="txtlugar" placeholder="Lugar Acceso">
                                        </label>
                                    </div>
                                    <div class="medium-6 columns">
                                        <label style="color:white">d</label>
                                        <input type="submit" id="btnlugar" class="success button" value="Guardar" name="frmLugar">
                                        <input style="display: none" type="submit" id="btnlugar1" class="secondary button" value="Modificar" name="frmLugar">
                                        <input style="display: none" type="submit" id="btnlugar2" class="alert button" value="Eliminar" name="frmLugar">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <jsp:useBean id="beanUnidOrgnCtrl" class="com.sv.udb.controlador.LugaAcceCtrl" scope="page"/>
                        <table class="hover">              
                            <thead>
                            <th width="200">Código</th>
                            <th width="200">Lugar Acceso</th>
                            <th width="200">Accion</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${beanUnidOrgnCtrl.consTodo()}" var="fila">
                                    <tr>
                                        <td id="tr1-<c:out value="${fila.codiLugaAcce}"></c:out>">${fila.codiLugaAcce}</td>
                                        <td id="tr2-<c:out value="${fila.codiLugaAcce}"></c:out>">${fila.nombLugaAcce}</td>
                                        <td><button type="button" class="success button" onclick="lugarselect(<c:out value="${fila.codiLugaAcce}" ></c:out>)" >Seleccionar</button></thd
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <div class="tabs-panel" id="panel2">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form name="form2" method="post" action="TipoDocuServ">
                                    <input style="display: none" type="text" id="txtdocumentoid" name="txtdocumentoid" placeholder="Lugar Acceso">
                                    <h6>Nuevo Registro</h6>
                                    <div class="medium-6 columns">
                                        <label>Tipo Documento
                                            <input type="text" id="txtdocumento" name="txtdocumento" placeholder="Tipo Documento">
                                        </label>
                                    </div>
                                    <div class="medium-6 columns">
                                        <label style="color:white">d</label>
                                        <input type="submit" class="success button" id="btndocumento" value="Guardar" name="frmDocu">
                                        <input style="display: none" type="submit" id="btndocumento1" class="secondary button" value="Modificar" name="frmDocu">
                                        <input style="display: none" type="submit" id="btndocumento2" class="alert button" value="Eliminar" name="frmDocu">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <jsp:useBean id="beantipodocuCtrl" class="com.sv.udb.controlador.TipoDocuCtrl" scope="page"/>
                        <table class="hover">              
                            <thead>
                            <th width="200">Código</th>
                            <th width="200">Tipo Documento</th>
                            <th width="200">Accion</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${beantipodocuCtrl.consTodo()}" var="fila2">
                                    <tr>
                                        <td id="tr21-<c:out value="${fila2.codiTipoDocu}"></c:out>">${fila2.codiTipoDocu}</td>
                                        <td id="tr22-<c:out value="${fila2.codiTipoDocu}"></c:out>">${fila2.nombTipoDocu}</td>
                                        <td><h><button type="button" class="success button" onclick="lugarselect2(<c:out value="${fila2.codiTipoDocu}" ></c:out>)" >Seleccionar</button></td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <div class="tabs-panel" id="panel3">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form name="form3" method="post" action="TipoGafeServ">
                                    <h6>Nuevo Registro</h6>
                                    <input type="text" id="txtgafeid" style="display: none" name="txtgafeid" placeholder="Tipo Gafete">
                                    <div class="medium-6 columns">
                                        <label>Tipo Gafete
                                            <input type="text" id="txtgafe" name="txtgafe" placeholder="Tipo Gafete">
                                        </label>
                                    </div>
                                    <div class="medium-6 columns">
                                        <label style="color:white">d</label>
                                        <input type="submit" class="success button" id="btngafe" value="Guardar" name="frmgafe">
                                        <input style="display: none" type="submit" id="btngafe1" class="secondary button" value="Modificar" name="frmgafe">
                                        <input style="display: none" type="submit" id="btngafe2" class="alert button" value="Eliminar" name="frmgafe">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <jsp:useBean id="beantipogafeCtrl" class="com.sv.udb.controlador.TipoGafeCtrl" scope="page"/>
                        <table class="hover">              
                            <thead>
                            <th width="200">Código</th>
                            <th width="200">Tipo Gafete</th>
                            <th width="200">Accion</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${beantipogafeCtrl.consTodo()}" var="fila3">
                                    <tr>
                                        <td id="tr31-<c:out value="${fila3.codiTipoGafe}"></c:out>">${fila3.codiTipoGafe}</td>
                                        <td id="tr32-<c:out value="${fila3.codiTipoGafe}"></c:out>">${fila3.nombTipoGafe}</td>
                                        <td><h><button type="button" class="success button" onclick="lugarselect3(<c:out value="${fila3.codiTipoGafe}" ></c:out>)" >Seleccionar</button></td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
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
            function lugarselect(id)
            {
                $("#btnlugar").hide();
                $("#btnlugar1").show();
                $("#btnlugar2").show();
                $campo0 = $(""+id).text();
                $campo1 = $("#tr2-" + id).text();
                $("#txtlugarid").val(id);
                $("#txtlugar").val($campo1);
            }
            function lugarselect2(id)
            {
                $("#btndocumento").hide();
                $("#btndocumento1").show();
                $("#btndocumento2").show();
                $campo0 = $(""+id).text();
                $campo1 = $("#tr22-" + id).text();
                $("#txtdocumentoid").val(id);
                $("#txtdocumento").val($campo1);
            }
            function lugarselect3(id)
            {
                $("#btngafe").hide();
                $("#btngafe1").show();
                $("#btngafe2").show();
                $campo0 = $(""+id).text();
                $campo1 = $("#tr32-" + id).text();
                $("#txtgafeid").val(id);
                $("#txtgafe").val($campo1);
            }
        </script>
    </body>
</html>

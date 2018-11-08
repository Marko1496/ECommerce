<%-- 
    Document   : cliente
    Created on : 11/09/2018, 12:20:37 AM
    Author     : barrot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Clientes</title>
        <meta name="description" content="Somos una empresa costarricense apasionada por la buena comida, creamos las mejores peizzas utilizando siempre productos frescos y de calidad.">
        <%@include file="css.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="wrapper">
            <div class="page-header" style="background-image: url('assets/img/pizzas/bg5.jpg')">
                <div class="filter"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 ml-auto mr-auto">
                            <div class="card card-register bg-transparent ml-auto mr-auto">
                                <h3 class="title">Bienvenido</h3>
                                <form action="cliente"  method="post" class="register-form">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Nombre</label>
                                            <input name="nombre" type="text" class="form-control" placeholder="Alice">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Apellido</label>
                                            <input name="apellido" type="text" class="form-control" placeholder="Smith">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Telefono</label>
                                            <input name="telefono" type="number" class="form-control" placeholder="88888888">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Correo</label>
                                            <input name="correo" type="email" class="form-control" placeholder="alice.smith@gmail.com">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Dirección</label>
                                            <textarea name="direccion" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Tarjeta</label>
                                            <input name="num_tarjeta" type="text" class="form-control"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Fecha de Vencimiento</label>
                                            <input  name="fecha_vencimiento" type="text" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Codigo de seguridad</label>
                                            <input name="codigo_seguridad" type="number" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Contraseña</label>
                                            <input name="contrasena" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-danger btn-block btn-round">Registrarse</button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
    <%@include file="js.jsp" %>
</html>

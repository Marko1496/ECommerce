<%-- 
    Document   : Checkout
    Created on : 11/09/2018, 09:37:10 AM
    Author     : mrm96
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="css.jsp"%>
    </head>
    <body class="section-dark">
        <%@include file="header.jsp"%>
        <% if (session.getAttribute("carrito") != null) {
                int subTotal = 0;
                double impuestos = 0;
                double total = 0;
                ArrayList<Item> listaItems = (ArrayList<Item>) session.getAttribute("carrito");
        %>

        <div class="section section-dark">
            <div class="col-md-12">
                <div class="card bg-transparent">
                    <div class="card-header"><h2 class="text-primary"><i class="nc-icon nc-bullet-list-67"></i> Confirmar Orden</h2></div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td class="text-center text-white">ID</td>
                                    <td class="text-center text-white">Nombre</td>
                                    <td class="text-center text-white">Cantidad</td>
                                    <td class="text-center text-white">Precio Unitario</td>
                                    <td class="text-center text-white">Subtotal</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; i < listaItems.size(); i++) {
                                        subTotal = subTotal + listaItems.get(i).getCantidad() * listaItems.get(i).getProducto().getPrecio();%>
                                <tr>
                                    <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getProducto().getId_producto()%></h4></td>
                                    <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getProducto().getNombre()%></h4></td>
                                    <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getCantidad()%></h4></td>
                                    <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getProducto().getPrecio()%></h4></td>
                                    <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getCantidad() * listaItems.get(i).getProducto().getPrecio()%></h4></td>
                                </tr>
                                <%}
                                    impuestos = subTotal * 0.13;
                                    total = subTotal + impuestos;%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-dark container">
            <div class="row">
                <div class="col-md-6">
                    <form method="POST" action="FacturaControl">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="text-white">Nombre en la Tarjeta</label>
                                <input class="form-control" type="text" name="nombre" <% if(session.getAttribute("cliente") != null){%> value="${sessionScope.cliente.getNombre()}" <%}%>/>
                            </div>
                            <div class="col-md-3">
                                <label class="text-white">Numero de Tarjeta</label>
                                <input class="form-control" type="text" name="numero_tarjeta" <% if(session.getAttribute("cliente") != null){%> value="${sessionScope.cliente.getNumero_tarjeta()}" <%}%>/>
                            </div>
                            <div class="col-md-3">
                                <label class="text-white">Codigo de Seguridad</label>
                                <input class="form-control" type="text" name="codigo_seguridad" <% if(session.getAttribute("cliente") != null){%> value="${sessionScope.cliente.getCodigo_seguridad()}" <%}%>/>
                            </div>
                            <div class="col-md-3">
                                <label class="text-white">Fecha de Vencimiento</label>
                                <input class="form-control" type="text" name="fecha_vencimiento" <% if(session.getAttribute("cliente") != null){%> value="${sessionScope.cliente.getFecha_vencimiento()}" <%}%>/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <label class="text-white">Direccion</label>
                                <input class="form-control" type="text" name="direccion" <% if(session.getAttribute("cliente") != null){%> value="${sessionScope.cliente.getDireccion()}" <%}%>/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <input class="btn btn-round btn-info" type="submit" name="pagar" value="pagar" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 offset-md-6">
                    <h4 class="text-primary">Subtotal:<span class="text-white" class="text-muted">₡<%=subTotal%></span> </h4>
                    <h4 class="text-primary">IVA (%13):<span class="text-white" class="text-muted">₡<%=impuestos%></span></h4>
                    <h3 class="text-primary">Total:<span class="text-white" class="text-muted">₡<%=total%></span></h3>
                </div>
            </div>
        </div>

        <% }%>
        <%@include file="footer.jsp"%>
    </body>
    <%@include file="js.jsp"%>
</html>

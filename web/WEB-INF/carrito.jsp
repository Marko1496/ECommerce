<%-- 
    Document   : carrito
    Created on : 09/09/2018, 09:11:41 PM
    Author     : mrm96
--%>

<%@page import="modelo.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <%@include file="css.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="section section-dark">
            <div class="col-md-12">
                <div class="card bg-transparent">
                    <div class="card-header">
                        <h2 class="text-info"><i class="nc-icon nc-cart-simple"></i>  Carrito</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center text-white">Imagen</th>
                                        <th class="text-center text-white">Poducto</th>
                                        <th class="text-center text-white">Cantidad</th>
                                        <th class="text-center text-white">Precio</th>
                                        <th class="text-center text-white">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (session.getAttribute("carrito") != null) {
                                            int subTotal = 0;
                                            double impuestos = 0;
                                            double total = 0;
                                            ArrayList<Item> listaItems = (ArrayList<Item>) session.getAttribute("carrito");
                                            if (listaItems.size() > 0) {
                                                for (int i = 0; i < listaItems.size(); i++) {
                                                    subTotal = subTotal + listaItems.get(i).getProducto().getPrecio() * listaItems.get(i).getCantidad();%>
                                    <tr>
                                        <td>
                                            <div class="card-avatar">
                                                <a><img class="img-thumbnail" style="width:50px; height:50px" src="assets/img/pizzas/<%=listaItems.get(i).getProducto().getImagen()%>" alt="..."></a>
                                            </div>
                                        </td>
                                        <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getProducto().getNombre()%></h4></td>
                                        <td class="text-center"><h4 class="text-primary"><%=listaItems.get(i).getCantidad()%></h4></td>
                                        <td class="text-center"><h3 class="text-primary">Precio: ₡<%=listaItems.get(i).getProducto().getPrecio() * listaItems.get(i).getCantidad()%></h3></td>
                                        <td class="text-center"><a class="btn btn-icon btn-danger" href="?accion=borrar&id_producto=<%=listaItems.get(i).getProducto().getId_producto()%>&id_tamano=<%=listaItems.get(i).getTamano()%>"><i class="nc-icon nc-simple-remove "></i> Borrar</a></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>

                        <%impuestos = subTotal * 0.13;
                            total = subTotal + impuestos;%>
                        <div class="row">
                            <div class="col align-self-start"></div>
                            <div class="col align-self-center"></div>
                            <div class="col align-self-end">
                                <h4 class="text-primary">Subtotal:<span class="text-muted"> ₡<%=subTotal%></span></h4>
                                <h4 class="text-primary">IVA (%13):<span class="text-muted"> ₡<%=impuestos%></span></h4>
                                <h3 class="text-primary">Total:<span class="text-muted"> ₡<%=total%></span></h3>
                                <a class="btn btn-round btn-info" href="Inicio">Seguir Comprando</a>
                                <a class="btn btn-round btn-info" href="Checkout">Pagar</a>
                            </div>
                        </div>


                        <% } else { %>
                        <div>
                            <h1 class="text-danger">No has agregado ningun producto al carrito</h1>
                            <a class="btn btn-round btn-info" href="Inicio">Seguir Comprando</a>
                        </div>
                        <%  } %>
                        <% } else { %>
                        <div>
                            <h1 class="text-danger">No has agregado ningun producto al carrito</h1>
                            <a class="btn btn-round btn-info" href="Inicio">Seguir Comprando</a>
                        </div>
                        <% }%>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <%@include file="js.jsp" %>
</html>

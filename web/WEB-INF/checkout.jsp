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
    </head>
    <body>
        <% if(session.getAttribute("carrito")!= null){
            int subTotal = 0;
            double impuestos = 0;
            double total = 0;
            ArrayList<Item> listaItems = (ArrayList<Item>)session.getAttribute("carrito");
        %>
        <table>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Cantidad</td>
                    <td>Precio Unitario</td>
                    <td>Subtotal</td>
                </tr>
            </thead>
            <tbody>
            <%for (int i = 0; i < listaItems.size(); i++) {
            subTotal = subTotal + listaItems.get(i).getCantidad() * listaItems.get(i).getProducto().getPrecio();%>
                <tr>
                    <td><%=listaItems.get(i).getProducto().getId_producto()%></td>
                    <td><%=listaItems.get(i).getProducto().getNombre()%></td>
                    <td><%=listaItems.get(i).getCantidad()%></td>
                    <td><%=listaItems.get(i).getProducto().getPrecio()%></td>
                    <td><%=listaItems.get(i).getCantidad()*listaItems.get(i).getProducto().getPrecio()%></td>
                </tr>
            <%}
            impuestos = subTotal*0.13;
            total = subTotal + impuestos;%>
            </tbody>
        </table>
        <h4>Subtotal: ₡<%=subTotal%></h4>
        <h4>IVA (%13): ₡<%=impuestos%></h4>
        <h3>Total: ₡<%=total%></h3>
        <form method="POST" action="FacturaControl">
            <label>Nombre en la Tarjeta</label>
            <input type="text" name="nombre" />
            <label>Numero de Tarjeta</label>
            <input type="text" name="numero_tarjeta" />
            <label>Codigo de Seguridad</label>
            <input type="text" name="codigo_seguridad" />
            <label>Fecha de Vencimiento</label>
            <input type="text" name="fecha_vencimiento" />
            <label>Direccion</label>
            <input type="text" name="direccion" />
            <input type="submit" name="pagar" value="pagar" />
        </form>
        <% }%>
    </body>
</html>

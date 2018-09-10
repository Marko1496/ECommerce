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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Carrito</h1>
        <% if(session.getAttribute("carrito")!= null){
            int subTotal = 0;
            double impuestos = 0;
            double total = 0;
            ArrayList<Item> listaItems = (ArrayList<Item>)session.getAttribute("carrito"); 
            for (int i = 0; i < listaItems.size(); i++){
                subTotal = subTotal+listaItems.get(i).getProducto().getPrecio()*listaItems.get(i).getCantidad();%>
                <div style="border: 1px solid black;">
                    <h1><%=listaItems.get(i).getProducto().getNombre()%></h1>
                    <h3>Precio: <%=listaItems.get(i).getProducto().getPrecio()*listaItems.get(i).getCantidad()%></h3>
                    <input type="number" value="<%=listaItems.get(i).getCantidad()%>" />
                </div>
            <% } 
            impuestos = subTotal*0.13;
            total = subTotal+impuestos;%>
            <h4>Subtotal: <%=subTotal%></h4>
            <h4>IVA (%13): <%=impuestos%></h4>
            <h3>Total: <%=total%></h3>
        <% } %>
    </body>
</html>

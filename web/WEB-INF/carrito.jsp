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
            ArrayList<Item> listaItems = (ArrayList<Item>)session.getAttribute("carrito"); 
            for (int i = 0; i < listaItems.size(); i++) {%>
                <div style="border: 1px solid black;">
                    <h1><%=listaItems.get(i).getProducto().getNombre()%></h1>
                </div>
            <% } %>
        <% } %>
    </body>
</html>

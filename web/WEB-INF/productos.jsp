<%-- 
    Document   : pizzas
    Created on : 09/09/2018, 02:15:57 PM
    Author     : mrm96
--%>

<%@page import="cad.TamanoCad"%>
<%@page import="modelo.Tamano"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cad.ProductoCad"%>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PIZZERIA</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>${sessionScope.pagina}</h1>
        <% ArrayList<Producto> lista = ProductoCad.listarProductos(session.getAttribute("cat_prod").toString()); %>
        <% for (int i = 0; i < lista.size(); i++) {
            int id_producto = lista.get(i).getId_producto();%>
            <form method="POST" action="Carrito">
                <div style="border: 1px solid black;">
                    <input type="hidden" name="producto" value="<%= id_producto %>" />
                    <h1>
                        <%= lista.get(i).getNombre() %>
                    </h1>
                    <img src="images/<%= lista.get(i).getImagen()%>"/>
                        <p id="precio-<%=i%>-label">Precio</p>
                        <% if(ProductoCad.tieneTamanos(id_producto)) {
                            ArrayList<Tamano> listaTamanos = TamanoCad.listarTamanosPorProductos(id_producto);%>
                            <select id="precio-<%=i%>" name="tamano" label="precio-<%=i%>-label" class="precio-input">
                                <% for (int j = 0; j < listaTamanos.size(); j++) { %>
                                <option precio="<%= listaTamanos.get(j).getPrecio() %>" value="<%= listaTamanos.get(j).getId_tamano() %>">
                                    <%= listaTamanos.get(j).getNombre() %>
                                </option>
                                <% } %>
                            </select>
                            <% } else { %>
                            <input name="precio" type="hidden" id="precio" label="precio-<%=i%>-label" class="precio-input" precio="<%= lista.get(i).getPrecio() %>" value="<%= lista.get(i).getPrecio() %>" />
                            <% } %>
                            <input type="submit" name="ordenar" value="Agregar"/>
                </div>
            </form>
        <% } %>
    </body>
    <script type="text/javascript">
        (function(){
            var inputs = document.getElementsByClassName("precio-input");
            for (var i = 0; i < inputs.length; i++) {
                console.log(inputs[i].getAttribute("label"));
                var label = document.getElementById(inputs[i].getAttribute("label"));
                if(inputs[i].nodeName === "SELECT"){
                    label.innerHTML = "₡ "+inputs[i].options[inputs[i].selectedIndex].getAttribute("precio");
                    inputs[i].onchange = function (){
                        label.innerHTML = "₡ "+this.options[this.selectedIndex].getAttribute("precio");
                    };
                }else {
                    label.innerHTML = "₡ "+inputs[i].getAttribute("precio");
                }

            }
        })();
    </script>
</html>

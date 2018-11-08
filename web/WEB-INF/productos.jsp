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
        <link rel="icon" type="image/png" href="assets/img/pizzas/pizzeria.png">
        <link rel="apple-touch-icon" sizes="86x86" href="assets/img/pizzas/pizzeria.png">
        <title>PIZZERIA</title>
        <%@include file="css.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="wrapper">
            <!-- content come here     -->
            <div class="section section-dark text-center">
                <div class="container">
                    <h2 class="title">${sessionScope.pagina}</h2> 
                    <div class="row">
                        <% ArrayList<Producto> lista = ProductoCad.listarProductos(session.getAttribute("cat_prod").toString()); %>
                        <% for (int i = 0; i < lista.size(); i++) {
                                int id_producto = lista.get(i).getId_producto();%>
                        <div class="col-md-4">
                            <div class="card card-profile card-plain">
                                <% if (session.getAttribute("cat_prod").toString() == "1") {%>
                                <div class="card-avatar">
                                    <a href="#avatar"><img src="assets/img/pizzas/<%= lista.get(i).getImagen()%>" alt="..."></a>
                                </div>
                                <% } else {%> 
                                <a href="#avatar"><img class="img-thumbnail" style="width:150px; height:150px" src="assets/img/pizzas/<%= lista.get(i).getImagen()%>" alt="..."></a>
                                <% }%> 
                                <div class="card-body">
                                    <a>
                                        <div class="author">
                                            <h4 class="card-title"><%=lista.get(i).getNombre()%></h4>
                                            <% if (session.getAttribute("cat_prod").toString() == "1") {%>
                                            <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" data-title="Ingredientes" data-content="<%=lista.get(i).getDescripcion()%>">Ingredientes</button>
                                            <% }%> 
                                        </div>
                                    </a>
                                </div>
                                <h4 id="precio-<%=i%>-label" class="card-title"></h4>

                                <div class="card-footer text-center">
                                    <form method="POST" action="Carrito">
                                        <input type="hidden" name="producto" value="<%= id_producto%>" />
                                    <% if (ProductoCad.tieneTamanos(id_producto)) {
                                            ArrayList<Tamano> listaTamanos = TamanoCad.listarTamanosPorProductos(id_producto);%>
                                        
                                        <select class="btn btn-outline-neutral btn-round dropdown-toggle precio-input" id="precio-<%=i%>" name="tamano" label="precio-<%=i%>-label">
                                            <% for (int j = 0; j < listaTamanos.size(); j++) {%>
                                            <option class="dropdown-item" precio="<%= listaTamanos.get(j).getPrecio()%>" value="<%= listaTamanos.get(j).getId_tamano()%>">
                                                <%= listaTamanos.get(j).getNombre()%>
                                            </option>
                                            <% } %>
                                        </select>
                                        <% } else {%>
                                        <input name="precio" type="hidden" id="precio" label="precio-<%=i%>-label" class="precio-input" precio="<%= lista.get(i).getPrecio()%>" value="<%= lista.get(i).getPrecio()%>" />
                                        <% }%>
                                        <button type="submit" class="btn btn-outline-neutral btn-round" name="ordenar" value="Agregar">Ordenar <i class="nc-icon nc-cart-simple"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <%@include file="js.jsp" %>
    <script type="text/javascript">
        (function () {
            var inputs = document.getElementsByClassName("precio-input");
            for (var i = 0; i < inputs.length; i++) {
                console.log(inputs[i].getAttribute("label"));
                var label = document.getElementById(inputs[i].getAttribute("label"));
                console.log(label.id);
                if (inputs[i].nodeName === "SELECT") {
                    label.innerHTML = "Precio: ₡ " + inputs[i].options[inputs[i].selectedIndex].getAttribute("precio");
                    console.log(inputs[i].id);
                    inputs[i].onchange = function () {
                        console.log(label.id);
                        document.getElementById(this.getAttribute("label")).innerHTML = "Precio: ₡ " + this.options[this.selectedIndex].getAttribute("precio");
                    };
                } else {
                    label.innerHTML = "Precio: ₡ " + inputs[i].getAttribute("precio");
                }
            }
        })();
    </script>
</html>

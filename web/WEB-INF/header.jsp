<header>
    <a href="Inicio" style="<% if(session.getAttribute("pagina")=="Inicio"){%>color: red;<%}%>">INICIO</a>
    <a href="Pizzas" style="<% if(session.getAttribute("pagina")=="Pizzas"){%>color: red;<%}%>">PIZZAS</a>
    <a href="Bebidas" style="<% if(session.getAttribute("pagina")=="Bebidas"){%>color: red;<%}%>"">BEBIDAS</a>
</header>

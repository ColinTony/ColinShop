<%-- 
    Document   : carrito
    Author     : Colin Heredia Luis Antonio
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ManejoBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Carrito</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
        
    </head>
    
 <body>
        
  <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Barra de Naavegacion</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">ColinShop</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Inicio</a></li>
            <li><a href="prodPs3.jsp">Ps3</a></li>
            <li><a href="prodXbox.jsp">Xbox</a></li>
            <li><a href="prodPelis.jsp">Peliculas</a></li>
            <li><a href="productos.jsp">Productos</a></li>
          </ul>
            
            <ul class="nav navbar-nav navbar-right">
                <%HttpSession sesion = request.getSession();%>
                <%ManejoBase mn = new ManejoBase();%>
                <%if(sesion.getAttribute("cliente")== null){%>
                <li><a href="inicio.jsp">Iniciar Sesion</a></li>
                <li><a href="Registro.jsp">Registrate</a></li>
                <%}else{%>
                <%Cliente cliente = (Cliente) sesion.getAttribute("cliente"); %>
                <%int productos = mn.totalProductos(cliente.getID());%>
                <%%>
                <li><a href="carrito.jsp">Mi Carrito <%= productos %> </a></li>
                <li><a href="perfil.jsp">Mi Perfil</a></li>
                <li><a href="cerrarSesion">Cerrar Sesion</a></li>
                <%}%>
            </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
       <%   Cliente cliente = new Cliente();%>
       <%   cliente = (Cliente) sesion.getAttribute("cliente");%>
       <%   cliente = (Cliente) sesion.getAttribute("cliente");
            int precio = 0;
            int contador = 0;
            ArrayList <Producto> list = mn.miCarrito(cliente.getID());
         %>
         <a class="text-danger h3" href ="#pagar" id="subir"> Bajar a pagar productos </a>
         <%
            for(Producto prod : list){
            
     %>
     <hr>
          <div class="container-fluid">
              
            <div class="row">
                                
              <div class="col-md-1">
                 </div>
                  <div class="col-md-5">
                      <img src='<%=prod.getUrl()%>' width="150" height="200" class="img-thumbnail">
                      </div>
                      <div class="col-md-3">
                          <p class="text-left h2"><%=prod.getNombre()%></p> 
                          <p class="text-left h2">Precio : <%=prod.getPrecio() %> Pesos</p>
                          <p class="text-left h2">Disponibles : <%=prod.getDisponibles()%></p>
                          <form action="ControladorServlet" method="Post">
                            <input type="hidden" name="accion" value="borrarProductos" />
                            <input type="hidden" name="idCarro" value=<%= prod.getCarro() %> />
                            <button class="btn btn-lg btn-warning btn-block btn-group-xs" type="submit" > Borrar Producto </button>
                        </form>
                      </div>
                   </div>
                </div>
              <hr>
              <% precio = (precio + prod.getPrecio()); %>  
              <% contador++; %> 
           <%}%>
           <div class="row">
               <div class="col-md-6">
                   
                   <p class="text-danger text-center h1"> Productos Totales : <%=contador %> - Precio total es : <%= precio %></p><br>
                   <p class="text-danger text-center h1"> </p> 
                   <p class="text-danger text-left h3"><a href ="#subir" class="text-danger"> Subir a ver mis productos </a></p>
                   
               </div>
                   <div class="col-md-4">
                       <form action="ControladorServlet" method="Post">
                            <input type="hidden" name="accion" value="pagar"/>
                            <button class="btn btn-lg btn-warning btn-block btn-group-xs" type="submit" id="pagar"> Pagar </button>
                            
                        </form>
                       
                   </div>
               
           </div>
            
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
 </body>
</html>

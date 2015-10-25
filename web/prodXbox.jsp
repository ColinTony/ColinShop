<%-- 
    Document   : pordXbox
    Version    : 2.0
    Author     : Colin Heredia Luis ANtonio
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ManejoBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Productos Xbox</title>
        
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
                    <%        
                              ArrayList<Producto> list = mn.ProductosXbox();
                              for(Producto prod : list){
                     %>
                        <hr>
                         <div class="container-fluid">
                             <div class="row">
                                 
                                 <div class="col-md-4">
                                     <img src='<%=prod.getUrl()%>' width="350" height="450" class="img-thumbnail">
                                     <br/><br/>
                                 </div>
                                     <div class="col-md-7">
                                         <center><h1><%=prod.getNombre()%></h1></center><br>
                                         <p class="text-justify h3"><%=prod.getDescripcion()%></p><br>
                                         <p class="text-left h2">Disponibles : <%=prod.getDisponibles()%></p>
                                         <p class="text-left h2">Precio : <%=prod.getPrecio() %> Pesos</p>
                                         <%if(sesion.getAttribute("cliente")== null){%>
                                         <p class="text-center alert-danger h3">Para comprar este producto debes estar registrado</p><br>
                                         <a href="Registro.jsp"><button class="btn btn-lg btn-primary btn-block">Registrate</button></a>
                                         <%}else{%>
                                         <form action="verProd.jsp" method="Post">
                                         <input type="hidden" value='<%=prod.getIdProductos()%>' name='carrito' class='btn-sm'/>
                                         <button class="btn btn-lg btn-primary btn-block" type="submit">Ver Producto</button>
                                         </form>
                                         <%}%>
                                     </div>
                             </div>
                         </div>
                         <hr>
                     
                    <%}%>
   
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
 
 </body>
</html>
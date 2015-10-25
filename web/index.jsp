<%-- 
    Document   : index
    Author     : Colin Heredia Luis Antonio
    Version    : 1.0
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ManejoBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Bienvenido ColinShop</title>
        
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
        
  <div class="jumbotron">
      <div class="container">
          <h1 class="text-center">Bienvenido a ColinShop!</h1>
        <p>Aquí encontraras todos los mejores juegos para Ps3 y Xbox 360.
        Tambien tenemos las mejores peliculas todo al mejor precio y con envio GRATIS</p>
        <p><a class="btn btn-primary btn-lg" href="productos.jsp" role="button">Ver todos los productos</a></p>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h2>PS3</h2>
          <p>Encontraras todos los mejores juegos para tu consola PS3 al mejor precio y envio gratis. </p>
          <p><a class="btn btn-default" href="prodPs3.jsp" role="button">Ver productos &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>XBOX</h2>
          <p>Encontraras todos los mejores juegos para Xbox al mejor precio y envio gratis. </p>
          <p><a class="btn btn-default" href="prodXbox.jsp" role="button">Ver productos &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>PELICULAS</h2>
          <p>Tenemos las mejores Peliculas del cine al mejor precio y con envio gratis.</p>
          <p><a class="btn btn-default" href="prodPelis.jsp" role="button">Ver productos &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; ColinShop Company 2015</p>
      </footer>
    </div>
        
        
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </body>

</html>

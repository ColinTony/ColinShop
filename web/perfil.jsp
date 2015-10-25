<%-- 
    Document   : verPerfil
    Version    : 2.0
    Author     : colin Heredia Luis Antonio
--%>
<%@page import="Modelo.ManejoBase"%>
<%@page import="Modelo.Cliente"%>
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
          <%Cliente cliente = new Cliente();%>
          <%cliente = (Cliente) sesion.getAttribute("cliente");%>
          
          <p class="text-justify h2">Nombre : <%= cliente.getNombres() %></p>
          <p class="text-justify h2">Apellido Paterno: <%= cliente.getApeP() %></p>
          <p class="text-justify h2">Apellido Materno: <%= cliente.getApeM() %></p>
          <p class="text-justify h2">Email: <%= cliente.getEmail() %></p>
          <p class="text-justify h2">Nick: <%= cliente.getNick() %></p>
          <p class="text-justify h2">Password: <%= cliente.getPass() %></p>
          
          <form method="post" action="ControladorServlet">
              <input type="hidden" value="EliminarCuenta" name="accion">
              <button class="btn btn-lg btn-primary btn-block"> Eliminar Cuenta </button>
          </form>
          <a href="modificarDatos.jsp"><button class="btn btn-lg btn-primary btn-block">Modificar mis Datos</button></a>
          
      </div>
    </div>
            
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </body>

</html>

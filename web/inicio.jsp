<%-- 
    Document   : inicio Sesion
    Author     : Colin Heredia Luis Antonio
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ManejoBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
        
        <title>Iniciar Sesion</title>
        
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
            
    <div class ="container">
        <div class = "row">
            <div class="col-md-3"></div>
            <div class ="col-md-6">

                <form method="Post" action="ControladorServlet" class="form-signin">
                      <input type="hidden" name="accion" value="Login" />
                      <center><h2 class="form-signin-heading">Inicio Sesion</h2></center>
                      <label for="inputEmail" class="sr-only">Nick</label>
                      <input type="text" id="inputEmail" name="nick" class="form-control" placeholder="Nick" required autofocus>
                      <label for="inputPassword" class="sr-only">Password</label>
                      <input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" required>
                      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </form>
            </div>
            <div class="col-md-3"></div>
            
        </div>
        
    </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

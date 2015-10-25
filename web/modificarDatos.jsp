<%-- 
    Document   : modificarDatos
    Author     : Colin Heredia Luis Antonio
--%>

<%@page import="Modelo.ManejoBase"%>
<%@page import="Modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
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
            
            <% Cliente cliente = new Cliente (); %>
            <% cliente = (Cliente) sesion.getAttribute("cliente"); %>
            <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                <center><h2>Tus Datos</h2></center><br>
                <form method="Post" action="ControladorServlet">
                    
                    <input type="hidden" name="accion" value="ModificarDatos"/>
                    
                    <div class="input-group">
                   
                      <span class="input-group-addon" id="ApellidoPaterno">Paterno</span>
                      <input type="text" class="form-control" placeholder="Apellido Paterno" value='<%= cliente.getApeP() %>' name="apeP"  aria-describedby="basic-addon1">

                      <span class="input-group-addon" id="ApellidoMaterno"> Materno</span>
                      <input type="text" class="form-control" placeholder="Apellido Materno" value='<%= cliente.getApeM()%>' name="apeM" required aria-describedby="basic-addon1">

                      <span class="input-group-addon" id="Nombres">Nombres</span>
                      <input type="text" class="form-control" placeholder="Nombres" name="nombres" value='<%= cliente.getNombres()%>' required aria-describedby="basic-addon1">
                    
                    </div>
                    <br/>
                    <div class="input-group">
                    
                        <span class="input-group-addon" id="nick">Nick</span>
                        <input type="text" class="form-control" placeholder="Nick" value='<%= cliente.getNick() %>' name="nick" required aria-describedby="basic-addon1">
                    
                    </div>
                    <br/>
                    <div class="input-group">
                    
                        <span class="input-group-addon" id="password">Contraseña</span>
                        <input type="password" class="form-control" placeholder="Contraseña" name="pass" value='<%= cliente.getPass() %>' required  aria-describedby="basic-addon1">
                    
                    </div>
                    <br>
                    <div class="input-group">
                     
                        <span class="input-group-addon" id="email">Email</span>
                        <input type="email" class="form-control" placeholder="Email" value='<%= cliente.getEmail() %>' name="email" required aria-describedby="basic-addon1">
                        <input type="hidden" value='<%= cliente.getID()%>' name="ID">

                    </div>
                    <br/>
                    <center>
                        <input type="submit" class="btn btn-default" value="Modificar"/>
                        <input type="reset" class="btn btn-default" value="Borrar"/>
                  </center>
                  </div>
                <div class="col-md-2"></div>
            </div>
                </form>
            </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>


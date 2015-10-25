<%-- 
    Document   : verProd
    Author     : Colin Heredia Luis Antonio
    Version    : 2.0
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ManejoBase"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Ver Producto</title>
        
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
                
                
                <% int idProd = Integer.parseInt(request.getParameter("carrito"));%>
                <% Producto prod = mn.Verproducto(idProd);%>
            <div class="row">
                <div class="container-fluid jumbotron">
                    <div class="col-md-2">
                        <img src='<%=prod.getUrl()%>' width="350" height="450" class="img-thumbnail" />
                    </div>
                    <div class='col-md-8'>
                        <p class="text-center h1"><%=prod.getNombre()%></p><br/>
                        <p class="text-justify h3"><%=prod.getDescripcion()%></p><br/>
                        <p class="text-danger text-justify h2">Precio : <%=prod.getPrecio()%> Pesos</p>
                        <p class="text-danger text-justify h2">Disponibles : <%=prod.getDisponibles()%></p>
                        <form method="Post" class="form-group-sm" action="ControladorServlet">
                            <input type="hidden" name="accion" value="carrito" />
                            <input type="hidden" name="idProd" value=<%= idProd %> />
                            <p class="text-left text-danger h6">Cantidad de unidades<input placeholder="Cantidad" type="number" name="numero" min="1" max=<%=prod.getDisponibles()%>></p>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Agregar a Carrito</button>
                        </form>
                        
                    </div>
                    
                </div>
                
            </div>
                        
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

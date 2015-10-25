package Controlador;

import Modelo.Cliente;
import Modelo.ManejoBase;
import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Colin Heredia Luis Antonio
 * @version 2.0
 */

public class ControladorServlet extends HttpServlet {
    private boolean rpta;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        this.doPost(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
     
    switch (accion) {
            case "registrarCliente": 
                                registrarCliente(request, response);
                                break;
            case "Login":    
                                Login(request, response);
                                break;
            case "ModificarDatos" :  
                                this.modificarDatos(request, response);
                                break;
            case "carrito" : 
                                this.Agregarcarrito(request, response);
                                break;
            case "pagar" :      
                                this.Pagar(request,response);
                                break;
            case "borrarProductos" : this.borrarProductos(request, response);
                                   break;
            case "EliminarCuenta":  this.EliminarCuenta(request, response);
                                    break;    
                
                
            default : response.sendRedirect("mensaje.jsp?men=No se que hacer xD");
            
     }
     
    }
    private void registrarCliente(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
    ManejoBase mn = new ManejoBase();
    Cliente cliente = new Cliente();
     
    String apeP = request.getParameter("apeP");
    String apeM = request.getParameter("apeM");
    String nombre = request.getParameter("nombres");
    String nick = request.getParameter("nick");
    String pass = request.getParameter("pass");
    String email = request.getParameter("email");
     
    cliente.setApeP(apeP);
    cliente.setApeM(apeM);
    cliente.setNombres(nombre);
    cliente.setNick(nick);
    cliente.setPass(pass);
    cliente.setEmail(email);
     
    rpta = mn.agregarCliente(cliente);
    if (rpta)
     {
      response.sendRedirect("mensaje.jsp?men=Se registro de manera correcta ya puedes iniciar sesion");
     }
     else {
      response.sendRedirect("mensaje.jsp?men=Usuario ya existe o tuvimos problemas al momento registrar porfavor intentalo de nuevo");
     }
   }
   
   private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
    ManejoBase man = new ManejoBase();
    Cliente cliente = new Cliente();
     
    String nick = request.getParameter("nick");
    String pass = request.getParameter("pass");
     try {
      ResultSet rs = man.Login(nick, pass);
       
      if (rs.next()) {
        cliente.setID(rs.getInt("idClie"));
        cliente.setApeP(rs.getNString("apeP"));
        cliente.setApeM(rs.getNString("apeM"));
        cliente.setNombres(rs.getNString("nombres"));
        cliente.setNick(rs.getNString("nick"));
        cliente.setPass(rs.getNString("pass"));
        cliente.setEmail(rs.getNString("email"));
        HttpSession sesion = request.getSession();
         
        sesion.setAttribute("cliente", cliente);
        request.getRequestDispatcher("index.jsp").forward(request, response);
       } else {
        response.sendRedirect("mensaje.jsp?men=Usuario o Password incorrectos intentalo de nuevo o registrate si no lo estas");
       }
     }
     catch (SQLException ex) {
      ex.printStackTrace();
     }
   }
   
   private void Agregarcarrito(HttpServletRequest request, HttpServletResponse response)
       throws ServletException , IOException{
       
       ManejoBase mn = new ManejoBase();
       HttpSession sesion = request.getSession();
       Cliente cliente = (Cliente) sesion.getAttribute("cliente");
       int numeroP =Integer.parseInt(request.getParameter("numero"));
       int idProd;
       idProd = Integer.parseInt(request.getParameter("idProd"));
       
       
       for(int i =0; i<numeroP; i++){
          rpta = mn.AgregarProd(cliente.getID(),idProd);
       }
       
       if (rpta){
            response.sendRedirect("mensaje.jsp?men=Producto Agregado al Carrito");
        }else {
            response.sendRedirect("mensaje.jsp?men=Ya hay productos de este tipo lo siento");
        }    
    }
   
   private void modificarDatos(HttpServletRequest request, HttpServletResponse response)
       throws ServletException , IOException{
        ManejoBase mn = new ManejoBase();
        Cliente cliente = new Cliente();
        HttpSession sesion = request.getSession();
        cliente = (Cliente) sesion.getAttribute("cliente");
        
        String apeP = request.getParameter("apeP");
        String apeM = request.getParameter("apeM");
        String nombre = request.getParameter("nombres");
        String nick = request.getParameter("nick");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        int id = Integer.parseInt(request.getParameter("ID"));
        
        cliente.setID(id);
        cliente.setApeP(apeP);
        cliente.setApeM(apeM);
        cliente.setNombres(nombre);
        cliente.setNick(nick);
        cliente.setPass(pass);
        cliente.setEmail(email);
     
    rpta = mn.ModificarCliente(cliente);
    if (rpta)
     {
      response.sendRedirect("mensaje.jsp?men=Tus datos se modificaron de manera Correcta");
     }
     else {
      response.sendRedirect("mensaje.jsp?men=Usuario ya existe o tuvimos problemas al momento registrar porfavor intentalo de nuevo");
     }
   }
   
   public void Pagar (HttpServletRequest request , HttpServletResponse response)
           throws ServletException,IOException{
        
        ManejoBase mn = new ManejoBase();
        HttpSession sesion = request.getSession();
        Cliente cliente = (Cliente) sesion.getAttribute("cliente");
        
       
       rpta = mn.Pagar(cliente.getID());
       if(rpta){
           response.sendRedirect("mensaje.jsp?men=Has pagado tus productos Correctamente");
       }else{
           response.sendRedirect("mensaje.jsp?men=Hubo un error al pagar algun producto");
       }
   }
   
   public void borrarProductos(HttpServletRequest request, HttpServletResponse response)
   throws ServletException , IOException{
       
       ManejoBase mn = new ManejoBase();
       HttpSession sesion = request.getSession();
       Cliente cliente = (Cliente) sesion.getAttribute("cliente");
       int idCarro = Integer.parseInt(request.getParameter("idCarro"));
       
       rpta = mn.borrarProducto(cliente.getID(), idCarro);
       
       if(rpta){
           response.sendRedirect("mensaje.jsp?men=Este no se pudo borrar");
       }else{
           response.sendRedirect("mensaje.jsp?men=Este producto borro de tu carrito");
       }
       
   }
   
   public void EliminarCuenta(HttpServletRequest request, HttpServletResponse response)
       throws ServletException , IOException{
       
       ManejoBase mn = new ManejoBase();
       HttpSession sesion = request.getSession();
       Cliente cliente = (Cliente) sesion.getAttribute("cliente");
       
       rpta = mn.EliminarCuenta(cliente.getID());
       
       if(rpta){
           
           response.sendRedirect("mensaje.jsp?men=No se pudo borrar tu cuenta");
       }else{
           sesion.invalidate();
           response.sendRedirect("mensaje.jsp?men=Se ha borrado tu cuenta");
       }
   }
   
   
}
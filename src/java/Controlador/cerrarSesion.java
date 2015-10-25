package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
public class cerrarSesion extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        doGet(request, response);
   }
   
 
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    request.getRequestDispatcher("index.jsp").forward(request, response);
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
   {
    processRequest(request, response);
   }
   
   public String getServletInfo()
   {
    return "Short description";
   }
 }

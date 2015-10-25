 package Modelo;
 
 import java.io.PrintStream;
 import java.sql.CallableStatement;
 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 
 
 
 public class Conexion
 {
   private static final String SERVIDOR = "jdbc:mysql://localhost:3306/tiendaColin";
   private static final String USER = "root";
   private static final String PASS = "n0m3l0";
   private static final String DRIVER = "com.mysql.jdbc.Driver";
   private static Connection conexion;
   
   public Conexion()
   {
     try
     {
      Class.forName("com.mysql.jdbc.Driver");
      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendaColin", "root", "n0m3l0");
      System.out.println("Se realizo la conexion");
     } catch (ClassNotFoundException|SQLException e) {
      System.out.println(e);
     }
   }
   
  public static synchronized Connection getConexion() { return conexion; }
   
   public static synchronized void cerrarCall(CallableStatement cl)
   {
     try {
      cl.close();
     } catch (Exception e) {}
   }
   
  public static synchronized void cerrarConexion(ResultSet rs) { try { rs.close();
     } catch (Exception e) {}
   }
   
  public static synchronized void cerrarConexion(Connection cn) { try { cn.close();
     } catch (Exception e) {}
   }
   
  public static synchronized void deshacerCambios(Connection cn) { try { cn.rollback();
     }
     catch (Exception e) {}
   }
 }
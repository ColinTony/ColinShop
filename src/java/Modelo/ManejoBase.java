 package Modelo;
 
 import java.io.PrintStream;
 import java.sql.Connection;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.util.ArrayList;
 
 

 public class ManejoBase
 {
   private boolean rpta;
   private ResultSet rs;
   private ArrayList<Producto> prod = new ArrayList();
   private Producto producto = new Producto();
   private int totalP=0;
 
   public synchronized boolean agregarCliente(Cliente cliente){
     try{
      Conexion conexion = new Conexion();
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareStatement("call registroCliente(?,?,?,?,?,?);");
      PreparedStatement pss = cn.prepareStatement("select nick from Cliente;");
      ResultSet rss= pss.executeQuery();
      
      while(rss.next()){
            if(rss.getNString(1).equals(cliente.getNick())){
              this.rpta = false;
            }else{
                this.rpta = true;
            }
          }
      if(rpta == true){
          ps.setString(1, cliente.getApeP());
          ps.setString(2, cliente.getApeM());
          ps.setString(3, cliente.getNombres());
          ps.setString(4, cliente.getNick());
          ps.setString(5, cliente.getPass());
          ps.setString(6, cliente.getEmail());
          ps.execute();
      }else{
          this.rpta = false;
          Conexion.deshacerCambios(cn);
      }
      
    }catch (SQLException ex) {
      System.out.print(ex);
      ex.printStackTrace();
     }
    return this.rpta;
   }
   
   public synchronized ResultSet Login(String nick, String pass){
     try
     {
      Conexion conexion = new Conexion();
       
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareStatement("call Login(?,?);");
       
      ps.setString(1, nick);
      ps.setString(2, pass);
       
      this.rs = ps.executeQuery();
     }
     catch (SQLException ex)
     {
      System.out.print(ex);
      ex.printStackTrace();
     }
    return this.rs;
   }
   
   public synchronized ArrayList ProductosPs3(){
     try
     {
      Conexion conexion = new Conexion();
       
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareCall("call ProdPs3();");
      rs = ps.executeQuery();
       
      while (rs.next()) {
        Producto producto = new Producto();
         
        producto.setIdProductos(rs.getInt("idProductos"));
        producto.setNombre(rs.getNString("nombre"));
        producto.setPrecio(rs.getInt("precio"));
        producto.setUrl(rs.getNString("url"));
        producto.setDisponibles(rs.getInt("disponibles"));
        producto.setDescripcion(rs.getString("descripcion"));
        producto.setIdTipo(rs.getInt("idTipo"));
         
        prod.add(producto);
       }
     } catch (SQLException ex) {
      ex.printStackTrace();
     }
    return prod;
   }
   
   public synchronized ArrayList ProductosXbox(){
     try
     {
      Conexion conexion = new Conexion();
       
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareCall("call ProdXbox();");
      rs = ps.executeQuery();
       
      while (rs.next()) {
        Producto producto = new Producto();
         
        producto.setIdProductos(rs.getInt("idProductos"));
        producto.setNombre(rs.getNString("nombre"));
        producto.setPrecio(rs.getInt("precio"));
        producto.setUrl(rs.getNString("url"));
        producto.setDisponibles(rs.getInt("disponibles"));
        producto.setDescripcion(rs.getString("descripcion"));
        producto.setIdTipo(rs.getInt("idTipo"));
         
        prod.add(producto);
       }
     } catch (SQLException ex) {
      ex.printStackTrace();
     }
    return prod;
   }
   
   public synchronized ArrayList ProductosPelis(){
     try
     {
      Conexion conexion = new Conexion();
       
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareCall("call ProdPelis();");
      rs = ps.executeQuery();
       
      while (rs.next()) {
        Producto producto = new Producto();
         
        producto.setIdProductos(rs.getInt("idProductos"));
        producto.setNombre(rs.getNString("nombre"));
        producto.setPrecio(rs.getInt("precio"));
        producto.setUrl(rs.getNString("url"));
        producto.setDisponibles(rs.getInt("disponibles"));
        producto.setDescripcion(rs.getString("descripcion"));
        producto.setIdTipo(rs.getInt("idTipo"));
         
        prod.add(producto);
       }
     } catch (SQLException ex) {
      ex.printStackTrace();
     }
    return prod;
   }
   
   public synchronized ArrayList Productos(){
     try
     {
      Conexion conexion = new Conexion();
       
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareCall("call Productos();");
      rs = ps.executeQuery();
       
      while (rs.next()) {
        Producto producto = new Producto();
         
        producto.setIdProductos(rs.getInt("idProductos"));
        producto.setNombre(rs.getNString("nombre"));
        producto.setPrecio(rs.getInt("precio"));
        producto.setUrl(rs.getNString("url"));
        producto.setDisponibles(rs.getInt("disponibles"));
        producto.setDescripcion(rs.getString("descripcion"));
        producto.setIdTipo(rs.getInt("idTipo"));
         
        prod.add(producto);
       }
     } catch (SQLException ex) {
      ex.printStackTrace();
     }
    return prod;
   }
   
   
   
   public synchronized Producto Verproducto(int idProd){
       
       
       try{
           PreparedStatement ps;
           Connection cn;
           cn = Conexion.getConexion();
           
           ps = cn.prepareCall("select * from Productos where idProductos = ?");
           ps.setInt(1, idProd);
           rs = ps.executeQuery();
           while (rs.next()){
                producto.setIdProductos(rs.getInt("idProductos"));
                producto.setNombre(rs.getNString("nombre"));
                producto.setPrecio(rs.getInt("precio"));
                producto.setUrl(rs.getNString("url"));
                producto.setDisponibles(rs.getInt("disponibles"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdTipo(rs.getInt("idTipo"));
           }
           
           
       }catch(SQLException ex){
           ex.printStackTrace();
       }
       return producto;
   }

   public synchronized boolean AgregarProd(int idClie , int idProd){
       try{
           
            Connection cn = Conexion.getConexion();
            
            PreparedStatement ps4;
            ps4 = cn.prepareCall("select Productos.disponibles from Productos where Productos.idProductos = ?;");
            ps4.setInt(1, idProd);
            rs = ps4.executeQuery();
            
            if(rs.next()){
                if(rs.getInt("disponibles") > 0){
                 
                    rpta=true;
                    PreparedStatement ps = cn.prepareCall("call IngresaCarrito(?,?);");
                    ps.setInt(1, idProd);
                    ps.setInt(2, idClie);
                    rs = ps.executeQuery();

                }else{
                    rpta=false;
                 }
            }
            
       }catch(SQLException ex){
           ex.printStackTrace();
       }
       catch(Exception e){
        e.printStackTrace();
       }
       return rpta;
   }
   
   public synchronized ArrayList miCarrito(int idClie){
       try{
         
         Connection cn = Conexion.getConexion();
         PreparedStatement ps = cn.prepareCall("call Carro(?);");
         ps.setInt(1, idClie);
         
         rs=ps.executeQuery();
         
         prod.clear();
        while (rs.next()) {
         
            Producto producto = new Producto();
            producto.setIdProductos(rs.getInt("idProductos"));
            producto.setNombre(rs.getNString("nombre"));
            producto.setPrecio(rs.getInt("precio"));
            producto.setUrl(rs.getNString("url"));
            producto.setDisponibles(rs.getInt("disponibles"));
            producto.setCarro(rs.getInt("idCarro"));
            
            prod.add(producto);
           
       }  
       }catch(SQLException e){
           e.printStackTrace();
       }
       
       return prod;
   }
   
   public synchronized boolean ModificarCliente(Cliente cliente){
       
   try{
      Conexion conexion = new Conexion();
      Connection cn = Conexion.getConexion();
      PreparedStatement ps = cn.prepareStatement("call modificarCliente(?,?,?,?,?,?,?);");
      PreparedStatement pss = cn.prepareStatement("select nick from Cliente;");
      ResultSet rss= pss.executeQuery();
      
      while(rss.next()){
            if(rss.getNString(1).equals(cliente.getNick())){
              this.rpta = false;
            }else{
                this.rpta = true;
            }
          }
      if(rpta == true){
          ps.setString(1, cliente.getApeP());
          ps.setString(2, cliente.getApeM());
          ps.setString(3, cliente.getNombres());
          ps.setString(4, cliente.getNick());
          ps.setString(5, cliente.getPass());
          ps.setString(6, cliente.getEmail());
          ps.setInt(7, cliente.getID());
          ps.execute();
      }else{
          this.rpta = false;
          Conexion.deshacerCambios(cn);
      }
      
    }catch (SQLException ex) {
      System.out.print(ex);
      ex.printStackTrace();
     }
    return this.rpta;
   }
   
   public synchronized boolean Pagar(int idClie){
       try{
            Connection cn = Conexion.getConexion();
            
            PreparedStatement ps2;
            ps2 = cn.prepareCall("call Carro(?);");
            ps2.setInt(1, idClie);
            rs = ps2.executeQuery();
            
            while(rs.next()){
                PreparedStatement ps3;
                ps3 = cn.prepareCall("update Productos set Disponibles = (disponibles - 1) where idProductos = ?;");
                ps3.setInt(1, rs.getInt("idProductos"));
                ps3.execute();
            }
            
            PreparedStatement ps = cn.prepareCall("call Pagar(?);");
            ps.setInt(1, idClie);
            rpta = ps.execute();
            rs = ps2.executeQuery();
            if(rs.next()){
                rpta = false;
            }else{
                rpta=true;
            }
            
       }catch(SQLException e){
           e.printStackTrace();
       }
       
       return rpta;
   }
   
   public synchronized int totalProductos(int idClie){
       
       try{
           Connection cn = Conexion.getConexion();
           PreparedStatement ps = cn.prepareCall("call Carro(?)");
           ps.setInt(1, idClie);
           rs = ps.executeQuery();
           totalP=0;
           while(rs.next()){
               totalP++;
           }
       }catch(SQLException e){
           e.printStackTrace();
       }
       return totalP;
   }
   
   public synchronized boolean borrarProducto(int idClie , int idCarro){
       try{
           Connection cn = Conexion.getConexion();
           PreparedStatement ps;
           ps=cn.prepareCall("call borrarProducto(?,?)");
           ps.setInt(1, idClie);
           ps.setInt(2, idCarro);
           rpta = ps.execute();
           
       }catch(SQLException e){
           e.printStackTrace();
       }
       return rpta;
   }
   
 }

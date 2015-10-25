 package Modelo;
 
 
 public class Producto{
   private int IdProductos;
   
   private String nombre;
   
   private int precio;
   private String url;
   private int disponibles;
   private String descrip;
   private int IdTipo;
   private int Carro;
   
   public Producto()
   {
    this.IdProductos = this.IdProductos;
    this.nombre = this.nombre;
    this.precio = this.precio;
    this.url = this.url;
    this.disponibles = this.disponibles;
    this.descrip = this.descrip;
    this.IdTipo = this.IdTipo;
   }
   
    /**
     *
     * @param idProd
     */
    public void setIdProductos(int idProd){
    this.IdProductos = idProd;
   }
   
    /**
     *
     * @return Regresa el Id del producto
     */
    public int getIdProductos()
   {
    return this.IdProductos;
   }
   
    /**
     *
     * @param nombre
     */
    public void setNombre(String nombre)
   {
    this.nombre = nombre;
   }
   
    /**
     *
     * @return Regresa el Nombre del producto
     */
    public String getNombre()
   {
    return this.nombre;
   }
   
    /**
     *
     * @param Precio
     */
    public void setPrecio(int Precio)
   {
    this.precio = Precio;
   }
   
    /**
     *
     * @return Regresa el precio del producto
     */
    public int getPrecio(){
    return this.precio;
   }
   
    /**
     *
     * @param url
     */
    public void setUrl(String url){
    this.url = url;
   }
   
    /**
     *
     * @return Regresa la url de la imagen 
     */
    public String getUrl(){
    return this.url;
   }
   
    /**
     *
     * @param disponibles
     */
    public void setDisponibles(int disponibles){
    this.disponibles = disponibles;
   }
   
    /**
     *
     * @return regresa los productos disponibles
     */
    public int getDisponibles(){
    return this.disponibles;
   }
   
    /**
     *
     * @param descripcion
     */
    public void setDescripcion(String descripcion){
    this.descrip = descripcion;
   }
   
    /**
     *
     * @return regresa la descripcion del producto
     */
    public String getDescripcion(){
    return this.descrip;
   }
   
    /**
     *
     * @param idTipo
     */
    public void setIdTipo(int idTipo){
    this.IdTipo = idTipo;
   }
   
    /**
     *
     * @return Regresa el tipo del Producto
     */
    public int getIdTipo(){
    return this.IdTipo;
   }
    
    public int getCarro(){
        return this.Carro;
    }
    public void setCarro(int Carro){
        this.Carro = Carro;
    }
 }
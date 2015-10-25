 package Modelo;
 
 
 public class Cliente
 {
   private int idClie;
   
   private String apeP;
   
   private String apeM;
   
   private String nombres;
   
   private String nick;
   
   private String pass;
   
   private String email;
   
 
   public Cliente()
   {
     this.idClie = this.idClie;
     this.apeP = this.apeP;
     this.apeM = this.apeM;
     this.nombres = this.nombres;
     this.nick = this.nick;
     this.pass = this.pass;
     this.email = this.email;
   }
   
   public void setID(int idClie) {
     this.idClie = idClie;
   }
   
   public int getID() {
     return this.idClie;
   }
   
   public void setApeP(String apeP) {
     this.apeP = apeP;
   }
   
   public String getApeP() {
     return this.apeP;
   }
   
   public void setApeM(String apeM) {
     this.apeM = apeM;
   }
   
   public String getApeM() {
     return this.apeM;
   }
   
   public void setNombres(String nombre) {
     this.nombres = nombre;
   }
   
   public String getNombres() {
     return this.nombres;
   }
   
   public void setNick(String nick) {
     this.nick = nick;
   }
   
   public String getNick() {
     return this.nick;
   }
   
   public void setPass(String pass) {
     this.pass = pass;
   }
   
   public String getPass() {
     return this.pass;
   }
   
   public void setEmail(String email) {
     this.email = email;
   }
   
   public String getEmail() {
     return this.email;
   }
 }
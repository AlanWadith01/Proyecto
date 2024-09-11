/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Configuracion;



import  java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author HPLAPTOP01
 */
public class Conectar {
    
    private String driver ="com.mysql.jdbc.Driver";
    private String CadenaConeccion = "jdbc:mysql://localhost/proyecto";
    private String usuario = "root";
    private String contrasena="";
    public Connection con;
    
    
    public Conectar(){
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(CadenaConeccion, usuario, contrasena);
            if (con != null){
                System.out.println("Se conecto a la base de datosn1S");
            }
        }catch(Exception e){
            System.out.println("Error alconectarse a la base de datos "+ e);
        }
    }
    
    public Connection crearconexion(){
        return con;
    }
    
    public void desconectar(){
        con = null;
        if (con == null){
            System.out.println("Se ha desconectado de la base de datos");
        }
    }
}


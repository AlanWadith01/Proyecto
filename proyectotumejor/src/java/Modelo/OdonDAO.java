/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HPLAPTOP01
 */
public class OdonDAO {
    Connection con;
    PreparedStatement pstm;
    Conectar Conexcion;
    ResultSet rs;
    Odontologo odo = new Odontologo();
    Odontologo odont;
    
    public Odontologo validar(String usu, String pass){
       odont = new Odontologo();
       try{
           Conexcion = new Conectar();
           Connection con = Conexcion.crearconexion();
           if (con != null){
               System.out.println("Se ha establecido una conexcion con la base de datos");
               pstm = con.prepareStatement("select * from odontologos where usuario = ? ");
               pstm.setString(1, usu);
               rs = pstm.executeQuery();
               while (rs.next()){
                   if (!rs.getString("Usuario").equals("")){
                       odont.setId(rs.getInt("Id"));
                       odont.setNombres(rs.getString("Nombres"));
                       odont.setApellidos(rs.getString("Apellidos"));
                      
                       odont.setUsuario(rs.getString("Usuario"));
                       odont.setContrasena(rs.getString("Contrasena"));
                       odont.setTipo(rs.getString("Tipo"));
                   }
               }
           }
       }catch(Exception e){
           System.out.println("Error al conectarse conla base de datos: "+e);
       }
       return odont;
    }
    
  
}

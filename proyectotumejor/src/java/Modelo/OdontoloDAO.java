package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

public class OdontoloDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexcion;
    ResultSet rs;

 public Odontologo validar(String usu, String pass) {
    Odontologo odo = new Odontologo();
    try {
        Conexcion = new Conectar();
        Connection con = Conexcion.crearconexion();
        if (con != null) {
            System.out.println("Se ha establecido una conexión con la base de datos");
            pstm = con.prepareStatement("SELECT * FROM odontologos WHERE usuario = ?");
            pstm.setString(1, usu);
            rs = pstm.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("Contrasena");
                if (BCrypt.checkpw(pass, hashedPassword)) {
                    odo.setId(rs.getString("Id"));
                    odo.setNombres(rs.getString("nombres"));
                    odo.setApellidos(rs.getString("apellidos"));
                    odo.setUsuario(rs.getString("Usuario"));
                    odo.setContrasena(hashedPassword);
                    odo.setTipo(rs.getString("Tipo"));
                } else {
                    // Contraseña incorrecta
                    return null;
                }
            } else {
                // Usuario no encontrado
                return null;
            }
        }
    } catch (Exception e) {
        System.out.println("Error al conectarse con la base de datos: " + e);
    }
    return odo;
}

    public List listar() {
        ArrayList<Odontologo> list = new ArrayList<>();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from odontologos");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Odontologo odo = new Odontologo();
                odo.setId(rs.getString(1));
                odo.setNombres(rs.getString(2));
                odo.setApellidos(rs.getString(3));
                odo.setUsuario(rs.getString(4));
                odo.setTipo(rs.getString(5));
                list.add(odo);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los usuarios");
        }
        return list;
    }

    public List listar(String nombre) {
        ArrayList<Odontologo> list = new ArrayList<>();
        nombre = "%" + nombre + "%";
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from odontologos where nombre like ?");
            pstm.setString(1, nombre);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Odontologo odo = new Odontologo();
                odo.setId(rs.getString(1));
                odo.setNombres(rs.getString(2));
                odo.setApellidos(rs.getString(3));
               
                odo.setUsuario(rs.getString(4));
                odo.setTipo(rs.getString(5));
                list.add(odo);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los usuarios por nombre");
        }
        return list;
    }

    public boolean crear(Odontologo odo) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("insert into odontologos values(?,?,?,?,?,?,?,?,?)");
            pstm.setString(1, odo.getId());
            pstm.setString(2, odo.getNombres());
            pstm.setString(3, odo.getApellidos());
            pstm.setString(4, odo.getUsuario());
            pstm.setString(5, odo.getContrasena());
            pstm.setString(6, odo.getTipo());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al insertar el usuarios");
        }
        return true;
    }

    public Odontologo list(String id) {
        Odontologo odo = new Odontologo();
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("select * from odontologos where id = ?");
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                odo.setId(rs.getString(1));
                odo.setNombres(rs.getString(2));
                odo.setApellidos(rs.getString(3));
                odo.setUsuario(rs.getString(4));
                odo.setContrasena(rs.getString(5));
                odo.setTipo(rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Error al listar los odontologos por identificacion");
        }
        return odo;
    }

    public boolean editar(Odontologo odo) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("update odontologos set nombres = ?, apellidos = ?, usuario = ?, contrasena = ?, tipo = ? where id = ?");
            pstm.setString(1, odo.getNombres());
            pstm.setString(2, odo.getApellidos());
            pstm.setString(3, odo.getUsuario());
            pstm.setString(4, odo.getContrasena());
            pstm.setString(5, odo.getTipo());
            pstm.setString(6, odo.getId());
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al editar el Odontologo " + e);
        }
        return true;
    }

    public boolean eliminar(String id) {
        try {
            Conexcion = new Conectar();
            Connection con = Conexcion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");
            }
            pstm = con.prepareStatement("delete from odontologos where id = ?");
            pstm.setString(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminarr el usuarios " + e);
        }
        return true;
    }
}

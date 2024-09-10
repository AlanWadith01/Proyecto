package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PacienteDAO {
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;

    public boolean registrarPaciente(Paciente paciente) {
        boolean registrado = false;
        Conectar conexion = new Conectar();

        try {
            con = conexion.crearconexion();
            if (con != null) {
                String sql = "INSERT INTO pacientes (nombre, apellido, fechaNacimiento, tipoId, numeroDocumento, direccion, ciudad, telefono, estadoCivil, sexo, raza, tipoSangre, ocupacion, eps, alergias, cirugias, emergencyNombre, emergencyDireccion, emergencyCiudad, emergencyTelefono, emergencyRelacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, paciente.getNombre());
                pstm.setString(2, paciente.getApellido());
                pstm.setString(3, paciente.getFechaNacimiento());
                pstm.setString(4, paciente.getTipoId());
                pstm.setString(5, paciente.getNumeroDocumento());
                pstm.setString(6, paciente.getDireccion());
                pstm.setString(7, paciente.getCiudad());
                pstm.setString(8, paciente.getTelefono());
                pstm.setString(9, paciente.getEstadoCivil());
                pstm.setString(10, paciente.getSexo());
                pstm.setString(11, paciente.getRaza());
                pstm.setString(12, paciente.getTipoSangre());
                pstm.setString(13, paciente.getOcupacion());
                pstm.setString(14, paciente.getEps());
                pstm.setString(15, paciente.getAlergias());
                pstm.setString(16, paciente.getCirugias());
                pstm.setString(17, paciente.getEmergencyNombre());
                pstm.setString(18, paciente.getEmergencyDireccion());
                pstm.setString(19, paciente.getEmergencyCiudad());
                pstm.setString(20, paciente.getEmergencyTelefono());
                pstm.setString(21, paciente.getEmergencyRelacion());

                int rowsAffected = pstm.executeUpdate();
                if (rowsAffected > 0) {
                    registrado = true; // Registro exitoso
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al registrar paciente: " + e.getMessage());
        } finally {
            cerrarRecursos();
        }

        return registrado; // Devuelve true si se registró, false si no
    }

    public List<Paciente> listarPacientes() {
        List<Paciente> pacientes = new ArrayList<>();
        Conectar conexion = new Conectar();

        try {
            con = conexion.crearconexion();
            if (con != null) {
                String sql = "SELECT * FROM pacientes"; // Asegúrate de que la tabla exista
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    Paciente paciente = new Paciente();
                    paciente.setId(rs.getInt("id")); // Asegúrate de que la tabla tenga una columna 'id'
                    paciente.setNombre(rs.getString("nombre"));
                    paciente.setApellido(rs.getString("apellido"));
                    paciente.setFechaNacimiento(rs.getString("fechaNacimiento"));
                    paciente.setTipoId(rs.getString("tipoId"));
                    paciente.setNumeroDocumento(rs.getString("numeroDocumento"));
                    paciente.setDireccion(rs.getString("direccion"));
                    paciente.setCiudad(rs.getString("ciudad"));
                    paciente.setTelefono(rs.getString("telefono"));
                    paciente.setEstadoCivil(rs.getString("estadoCivil"));
                    paciente.setSexo(rs.getString("sexo"));
                    paciente.setRaza(rs.getString("raza"));
                    paciente.setTipoSangre(rs.getString("tipoSangre"));
                    paciente.setOcupacion(rs.getString("ocupacion"));
                    paciente.setEps(rs.getString("eps"));
                    paciente.setAlergias(rs.getString("alergias"));
                    paciente.setCirugias(rs.getString("cirugias"));
                    paciente.setEmergencyNombre(rs.getString("emergencyNombre"));
                    paciente.setEmergencyDireccion(rs.getString("emergencyDireccion"));
                    paciente.setEmergencyCiudad(rs.getString("emergencyCiudad"));
                    paciente.setEmergencyTelefono(rs.getString("emergencyTelefono"));
                    paciente.setEmergencyRelacion(rs.getString("emergencyRelacion"));
                    pacientes.add(paciente);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al listar pacientes: " + e.getMessage());
        } finally {
            cerrarRecursos();
        }
        return pacientes; // Devuelve la lista de pacientes
    }

    private void cerrarRecursos() {
        try {
            if (rs != null) rs.close();
            if (pstm != null) pstm.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar recursos: " + e.getMessage());
        }
    }
}
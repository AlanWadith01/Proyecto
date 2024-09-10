package Controlador;

import Modelo.Paciente;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CtrPaciente")
public class CtrPaciente extends HttpServlet {

    private List<Paciente> pacientes = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("nuevo".equals(accion)) {
            // Register a new patient
            Paciente nuevoPaciente = new Paciente();
            nuevoPaciente.setNombre(request.getParameter("nombre"));
            nuevoPaciente.setApellido(request.getParameter("apellido"));
            nuevoPaciente.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            nuevoPaciente.setTipoId(request.getParameter("tipoId"));
            nuevoPaciente.setNumeroDocumento(request.getParameter("numeroDocumento"));
            nuevoPaciente.setDireccion(request.getParameter("direccion"));
            nuevoPaciente.setCiudad(request.getParameter("ciudad"));
            nuevoPaciente.setTelefono(request.getParameter("telefono"));
            nuevoPaciente.setEstadoCivil(request.getParameter("estadoCivil"));
            nuevoPaciente.setSexo(request.getParameter("sexo"));
            nuevoPaciente.setRaza(request.getParameter("raza"));
            nuevoPaciente.setTipoSangre(request.getParameter("tipoSangre"));
            nuevoPaciente.setOcupacion(request.getParameter("ocupacion"));
            nuevoPaciente.setEps(request.getParameter("eps"));
            nuevoPaciente.setAlergias(request.getParameter("alergias"));
            nuevoPaciente.setCirugias(request.getParameter("cirugias"));
            nuevoPaciente.setEmergencyNombre(request.getParameter("emergencyNombre"));
            nuevoPaciente.setEmergencyDireccion(request.getParameter("emergencyDireccion"));
            nuevoPaciente.setEmergencyCiudad(request.getParameter("emergencyCiudad"));
            nuevoPaciente.setEmergencyTelefono(request.getParameter("emergencyTelefono"));
            nuevoPaciente.setEmergencyRelacion(request.getParameter("emergencyRelacion"));

            pacientes.add(nuevoPaciente);
            response.sendRedirect("/proyectotumejor/vistas/listarpacientes.jsp"); // Redirect to the listing page
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("listar".equals(accion)) {
            // List patients
            request.setAttribute("pacientes", pacientes);
            request.getRequestDispatcher("/proyectotumejor/vistas/listarpacientes.jsp").forward(request, response);
        } else if ("detalle".equals(accion)) {
            // Show details of a specific patient
            int index = Integer.parseInt(request.getParameter("index"));
            Paciente paciente = pacientes.get(index);
            request.setAttribute("paciente", paciente);
            request.getRequestDispatcher("/proyectotumejor/vistas/detallePaciente.jsp").forward(request, response);
        }
    }
}
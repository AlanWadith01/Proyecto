package Controlador;

import Modelo.OdontoloDAO;
import Modelo.Odontologo;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "CtrValidar", urlPatterns = {"/CtrValidar"})
public class CtrValidar extends HttpServlet {
    private OdontoloDAO odontoloDAO = new OdontoloDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
  public static boolean verificarcontrasena(String password, String contrasenaencriptada) {
    return BCrypt.checkpw(password, contrasenaencriptada);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String accion = request.getParameter("accion");

    if ("Ingresar".equalsIgnoreCase(accion)) {
        HttpSession sesion = request.getSession();
        String usu = request.getParameter("txtuser");
        String pas = request.getParameter("txtpass");
       
        // Validar odontólogo
        Odontologo odontologo = odontoloDAO.validar(usu, pas);
        System.out.println(odontologo);
        
        if (odontologo.getUsuario() != null) {
         
            if (verificarcontrasena(pas, odontologo.getContrasena())) {
                System.out.println("Usuario: " + odontologo.getUsuario());
                sesion.setAttribute("log", '1');
                sesion.setAttribute("nombres", odontologo.getNombres());
                sesion.setAttribute("apellidos", odontologo.getApellidos());
                sesion.setAttribute("id", odontologo.getId());
                sesion.setAttribute("usuario", odontologo);
                
                // Redirigir a la página de acceso
                response.sendRedirect("/proyectotumejor/vistas/acceso.jsp");
            } else {
                // Contraseña incorrecta
                response.sendRedirect("/proyectotumejor/vistas/login.jsp?ingreso=0&error=contraseña_incorrecta");
            }
        } else {
            // Si no se encuentra el odontólogo, redirigir a la página de login con error
            response.sendRedirect("/proyectotumejor/vistas/login.jsp?ingreso=0&error=usuario_no_encontrado");
        }
    }
}
    @Override
    public String getServletInfo() {
        return "Servlet para validar odontólogos";
    }
}
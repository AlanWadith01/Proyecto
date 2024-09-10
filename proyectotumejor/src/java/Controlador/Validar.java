package Controlador;

import Modelo.OdonDAO;
import Modelo.Odontologo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {
    private OdonDAO odon = new OdonDAO();
    private Odontologo odont;
public static boolean verificarcontrasena (String password, String contrasenaencriptada){
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
            
         
            odont = odon.validar(usu, pas);
            System.out.println("si llegoS");
            if (odont.getUsuario() != null) {
            System.out.println("usuario: "+odont.getContrasena());
                System.out.println("contraseña: "+pas);
                boolean verificarpassword = verificarcontrasena(pas, odont.getContrasena());
                sesion.setAttribute("log", '1');
                if(verificarpassword){
                sesion.setAttribute("Nombre", odont.getNombre());
                sesion.setAttribute("Apellido", odont.getApellido());
                sesion.setAttribute("id", odont.getId());
                sesion.setAttribute("usuario", odont);
                
                
                 if (odont.getTipo().equals("Administrador")) {
                        response.sendRedirect("../acceso.jsp");
                    } 
                }
            } else {
                // Invalid credentials
                response.sendRedirect("/proyectotumejor/vistas/login.jsp?ingreso=0");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para validar usuarios y manejar sesiones.";
    }
}
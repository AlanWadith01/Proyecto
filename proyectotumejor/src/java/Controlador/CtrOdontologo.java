/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Modelo.OdontoloDAO;
import Modelo.Odontologo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author SENA
 */
@WebServlet(name = "CtrOdontologo", urlPatterns = {"/CtrOdontologo"})
public class CtrOdontologo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    OdontoloDAO dao = new OdontoloDAO();
    Odontologo odo = new Odontologo();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrOdontologo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrOdontologo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          List<Odontologo> list = dao.listar();
        String id, nomb,ape,  usu, pas, tip;
        String accion = request.getParameter("accion");
        System.out.println("accion: "+accion);
        switch (accion){
            case "Listar":
                list = dao.listar();
                request.setAttribute("odontologos", list);
         
                request.getRequestDispatcher("/proyectotumejor/vistas/ListarOdontologos.jsp").forward(request, response);
                break;
            case "buscar":
                String nom = request.getParameter("txtbuscar");
                list = dao.listar(nom);
                request.setAttribute("odontologos", list);
                request.getRequestDispatcher("/proyectotumejor/vistas/ListarOdontologos.jsp").forward(request, response);
                break;
            case "nuevo":
                id = request.getParameter("id");
                nomb = request.getParameter("nombres");
                ape = request.getParameter("apellidos");
               
                usu = request.getParameter("Usuario");
                pas = request.getParameter("Contrasena");
                tip = request.getParameter("Tipo");
                
                odo.setId(id);
                odo.setNombres(nomb);
                odo.setApellidos(ape);
                
                odo.setUsuario(usu);
                String contrasenaencriptada = encriptarcontrasena(pas);
                odo.setContrasena(contrasenaencriptada);
                odo.setTipo(tip);
                
                dao.crear(odo);
                list = dao.listar();
                request.setAttribute("odontologos", list);
                request.getRequestDispatcher("/proyectotumejor/vistas/ListarOdontologos.jsp").forward(request, response);
                break;
            case "editar":
                String idusu = request.getParameter("id");
                odo = dao.list(idusu);
                request.setAttribute("odontologos", odo);
                System.out.println("contrasena: "+odo.getContrasena());
                request.getRequestDispatcher("/proyectotumejor/vistas/EditarOdontologo.jsp").forward(request, response);
                break;
            case "actualizar":
                id = request.getParameter("id");
                nomb = request.getParameter("nombres");
                ape = request.getParameter("apellidos");
               
                usu = request.getParameter("Usuario");
                pas = request.getParameter("Contrasena");
                tip = request.getParameter("Tipo");
                
                odo.setId(id);
                odo.setNombres(nomb);
                odo.setApellidos(ape);
                
                odo.setUsuario(usu);
                odo.setContrasena(pas);
                odo.setTipo(tip);
                
                dao.editar(odo);
                list = dao.listar();
                request.setAttribute("odontologos", list);
                request.getRequestDispatcher("/proyectotumejor/vistas/ListarOdontologos.jsp").forward(request, response);
                break;
            case "eliminar":
                id = request.getParameter("id");
                System.out.println("identificacion: "+id);
                dao.eliminar(id);
                list = dao.listar();
                request.setAttribute("odontologos", list);
                request.getRequestDispatcher("/proyectotumejor/vistas/ListarOdontologos.jsp").forward(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   public static String encriptarcontrasena(String password){
        String passwordencriptado = BCrypt.hashpw(password, BCrypt.gensalt());
        return passwordencriptado;
        }

}

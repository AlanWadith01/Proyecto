package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registroOdontologo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Registro de Odontologo</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("    <style>\n");
      out.write("        .form-section { margin-bottom: 30px; }\n");
      out.write("        .form-section h2 { font-size: 24px; font-weight: bold; }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container mt-5\">\n");
      out.write("        <h1 class=\"text-center\">Registro de Odontologo</h1>\n");
      out.write("\n");
      out.write("        ");
 
            // Mostrar mensaje de éxito o error basado en el parámetro de la solicitud
            String successMessage = request.getParameter("success");
            String errorMessage = request.getParameter("error");
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
 if ("true".equals(successMessage)) { 
      out.write("\n");
      out.write("            <div class=\"alert alert-success text-center\">\n");
      out.write("                <strong>¡Registro exitoso! El odontólogo se ha registrado correctamente.</strong>\n");
      out.write("            </div>\n");
      out.write("        ");
 } else if ("true".equals(errorMessage)) { 
      out.write("\n");
      out.write("            <div class=\"alert alert-danger text-center\">\n");
      out.write("                <strong>Error al registrar el odontólogo. Verifique los datos e intente nuevamente.</strong>\n");
      out.write("            </div>\n");
      out.write("        ");
 } else if ("passwordMismatch".equals(request.getParameter("error"))) { 
      out.write("\n");
      out.write("            <div class=\"alert alert-danger text-center\">\n");
      out.write("                <strong>Las contraseñas no coinciden. Por favor, inténtelo de nuevo.</strong>\n");
      out.write("            </div>\n");
      out.write("        ");
 } else if ("missingId".equals(request.getParameter("error"))) { 
      out.write("\n");
      out.write("            <div class=\"alert alert-danger text-center\">\n");
      out.write("                <strong>El ID es obligatorio. Por favor, ingréselo.</strong>\n");
      out.write("            </div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        <form id=\"registroOdontologo\" action=\"../CtrOdontologo\" method=\"POST\">\n");
      out.write("            <div class=\"form-section\">\n");
      out.write("                <h2>Datos del Odontologo</h2>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"id\">ID</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"id\" name=\"id\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"nombres\">Nombres</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"nombres\" name=\"nombres\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"apellidos\">Apellidos</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"apellidos\" name=\"apellidos\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"usuario\">Usuario</label>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"usuario\" name=\"usuario\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"contrasena\">Contraseña</label>\n");
      out.write("                    <input type=\"password\" class=\"form-control\" id=\"contrasena\" name=\"contrasena\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"confirmarContrasena\">Confirmar Contraseña</label>\n");
      out.write("                    <input type=\"password\" class=\"form-control\" id=\"confirmarContrasena\" name=\"confirmarContrasena\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"tipo\">Tipo</label>\n");
      out.write("                    <select class=\"form-control\" id=\"tipo\" name=\"tipo\" required>\n");
      out.write("                        <option value=\"Administrador\">Administrador</option>\n");
      out.write("                        <!-- Otras opciones pueden ser añadidas aquí -->\n");
      out.write("                    </select>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"text-center\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Registrar</button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class recontra_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  <title>Recuperar contraseña</title>\n");
      out.write("  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("  <style>\n");
      out.write("    body {\n");
      out.write("      background-image: url('../imagenes/odontologia.jpg');\n");
      out.write("      background-size: cover;\n");
      out.write("      background-repeat: no-repeat;\n");
      out.write("      background-attachment: fixed;\n");
      out.write("      color: white;\n");
      out.write("      font-family: Arial, sans-serif;\n");
      out.write("      margin: 0;\n");
      out.write("      height: 100vh; \n");
      out.write("    }\n");
      out.write("    .fondo {\n");
      out.write("      height: 100vh;\n");
      out.write("      display: flex;\n");
      out.write("      justify-content: center;\n");
      out.write("      align-items: center;\n");
      out.write("      position: relative;\n");
      out.write("      background-color: rgba(0, 0, 0, 0.5);\n");
      out.write("    }\n");
      out.write("    .card-container {\n");
      out.write("      width: 100%;\n");
      out.write("      max-width: 400px;\n");
      out.write("    }\n");
      out.write("    .card {\n");
      out.write("      background-color: rgba(173, 171, 201, 0.8); /* Cambiar a un color con opacidad */\n");
      out.write("      border-radius: 1rem;\n");
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <div class=\"fondo\">\n");
      out.write("    <div class=\"card-container\">\n");
      out.write("      <div class=\"card shadow\">\n");
      out.write("        <div class=\"card-body\">\n");
      out.write("          <h2 class=\"card-title text-center mb-3\">Recuperar contraseña</h2>\n");
      out.write("          <p class=\"text-center mb-4\">Ingresa tu correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.</p>\n");
      out.write("          <form>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("              <label for=\"email\" class=\"form-label\">Correo electrónico:</label>\n");
      out.write("              <input type=\"email\" class=\"form-control\" id=\"email\" placeholder=\"m@example.com\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"d-grid\">\n");
      out.write("              <button type=\"submit\" class=\"btn btn-primary btn-lg\">Recuperar contraseña</button>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("          <div class=\"text-center mt-4\">\n");
      out.write("            <a href=\"../vistas/login.jsp\" class=\"btn btn-link\">Volver al inicio</a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
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

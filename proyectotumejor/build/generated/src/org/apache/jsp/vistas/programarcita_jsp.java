package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class programarcita_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Programación de Citas Médicas</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("</head>\n");
      out.write("<style>\n");
      out.write("    body {\n");
      out.write("    font-family: Arial, sans-serif;\n");
      out.write("    background-color: #f0f0f0;\n");
      out.write("    margin: 0;\n");
      out.write("    padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".container {\n");
      out.write("    max-width: 600px;\n");
      out.write("    margin: 50px auto;\n");
      out.write("    padding: 20px;\n");
      out.write("    background-color: #fff;\n");
      out.write("    border-radius: 10px;\n");
      out.write("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("}\n");
      out.write("\n");
      out.write("h1 {\n");
      out.write("    text-align: center;\n");
      out.write("    color: #333;\n");
      out.write("    margin-bottom: 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".form-group {\n");
      out.write("    margin-bottom: 15px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("label {\n");
      out.write("    display: block;\n");
      out.write("    font-weight: bold;\n");
      out.write("    margin-bottom: 5px;\n");
      out.write("    color: #555;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=\"text\"],\n");
      out.write("input[type=\"tel\"],\n");
      out.write("input[type=\"email\"],\n");
      out.write("input[type=\"date\"],\n");
      out.write("input[type=\"time\"],\n");
      out.write("select,\n");
      out.write("textarea {\n");
      out.write("    width: 100%;\n");
      out.write("    padding: 10px;\n");
      out.write("    border: 1px solid #ccc;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    font-size: 16px;\n");
      out.write("    color: #333;\n");
      out.write("}\n");
      out.write("\n");
      out.write("textarea {\n");
      out.write("    resize: vertical;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button[type=\"submit\"] {\n");
      out.write("    background-color:  #007bff;\n");
      out.write("    color: #fff;\n");
      out.write("    padding: 10px 20px;\n");
      out.write("    border: none;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    cursor: pointer;\n");
      out.write("    font-size: 16px;\n");
      out.write("    width: 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button[type=\"submit\"]:hover {\n");
      out.write("    background-color:  #007bff;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".center {\n");
      out.write("    text-align: center;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>Programación de Citas </h1>\n");
      out.write("        <form action=\"#\" method=\"post\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"nombre\">Nombre del Paciente:</label>\n");
      out.write("                <input type=\"text\" id=\"nombre\" name=\"nombre\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"telefono\">Número de Teléfono:</label>\n");
      out.write("                <input type=\"tel\" id=\"telefono\" name=\"telefono\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Correo Electrónico:</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"doctor\">Doctor:</label>\n");
      out.write("                <select id=\"doctor\" name=\"doctor\" required>\n");
      out.write("                    <option value=\"\">Seleccione un doctor</option>\n");
      out.write("                    <option value=\"dr_jose\">Dr. José Martínez</option>\n");
      out.write("                    <option value=\"dr_ana\">Dra. Ana Gómez</option>\n");
      out.write("                    <option value=\"dr_carlos\">Dr. Carlos Rodríguez</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"fecha\">Fecha de la Cita:</label>\n");
      out.write("                <input type=\"date\" id=\"fecha\" name=\"fecha\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"hora\">Hora de la Cita:</label>\n");
      out.write("                <input type=\"time\" id=\"hora\" name=\"hora\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"motivo\">Motivo de la Cita:</label>\n");
      out.write("                <textarea id=\"motivo\" name=\"motivo\" rows=\"4\"></textarea>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group center\">\n");
      out.write("                <button type=\"submit\">Programar Cita</button>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
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

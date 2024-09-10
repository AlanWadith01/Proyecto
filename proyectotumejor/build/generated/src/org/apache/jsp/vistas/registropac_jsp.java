package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registropac_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Registro de Paciente</title>\n");
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
      out.write("h2 {\n");
      out.write("    text-align: center;\n");
      out.write("    color: #333;\n");
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
      out.write("input[type=\"date\"],\n");
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
      out.write("    background-color: #007bff;\n");
      out.write("    color: #fff;\n");
      out.write("    padding: 10px 20px;\n");
      out.write("    border: none;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    cursor: pointer;\n");
      out.write("    font-size: 16px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button[type=\"submit\"]:hover {\n");
      out.write("    background-color: #0056b3;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".center {\n");
      out.write("    text-align: center;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <center><h1>REGISTRO DE PACIENTE</h1></center>\n");
      out.write("        <form method=\"post\" action=\"#\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"numero_identidad\">Número de Identidad:</label>\n");
      out.write("                <input type=\"text\" id=\"numero_identidad\" name=\"numero_identidad\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"nombre_paciente\">Nombre:</label>\n");
      out.write("                <input type=\"text\" id=\"nombre_paciente\" name=\"nombre_paciente\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"apellido_paciente\">Apellido:</label>\n");
      out.write("                <input type=\"text\" id=\"apellido_paciente\" name=\"apellido_paciente\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"direccion\">Dirección:</label>\n");
      out.write("                <input type=\"text\" id=\"direccion\" name=\"direccion\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"ciudad\">Ciudad:</label>\n");
      out.write("                <input type=\"text\" id=\"ciudad\" name=\"ciudad\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"telefono\">Número de Teléfono:</label>\n");
      out.write("                <input type=\"tel\" id=\"telefono\" name=\"telefono\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"estado_civil\">Estado Civil:</label>\n");
      out.write("                <select id=\"estado_civil\" name=\"estado_civil\">\n");
      out.write("                    <option value=\"soltero\">Soltero/a</option>\n");
      out.write("                    <option value=\"casado\">Casado/a</option>\n");
      out.write("                    <option value=\"viudo\">Viudo/a</option>\n");
      out.write("                    <option value=\"divorciado\">Divorciado/a</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"sexo\">Sexo:</label>\n");
      out.write("                <select id=\"sexo\" name=\"sexo\">\n");
      out.write("                    <option value=\"masculino\">Masculino</option>\n");
      out.write("                    <option value=\"femenino\">Femenino</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"raza\">Raza Étnica:</label>\n");
      out.write("                <select id=\"raza\" name=\"raza\">\n");
      out.write("                    <option value=\"mestizo\">Mestizo</option>\n");
      out.write("                    <option value=\"blanco\">Blanco</option>\n");
      out.write("                    <option value=\"afrodescendiente\">Afrodescendiente</option>\n");
      out.write("                    <option value=\"indigena\">Indígena</option>\n");
      out.write("                    <option value=\"mulato\">Mulato</option>\n");
      out.write("                    <option value=\"asiatico\">Asiático</option>\n");
      out.write("                    <option value=\"otro\">Otro</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"tipo_sangre\">Tipo de Sangre:</label>\n");
      out.write("                <select id=\"tipo_sangre\" name=\"tipo_sangre\">\n");
      out.write("                    <option value=\"A+\">A+</option>\n");
      out.write("                    <option value=\"A-\">A-</option>\n");
      out.write("                    <option value=\"B+\">B+</option>\n");
      out.write("                    <option value=\"B-\">B-</option>\n");
      out.write("                    <option value=\"AB+\">AB+</option>\n");
      out.write("                    <option value=\"AB-\">AB-</option>\n");
      out.write("                    <option value=\"O+\">O+</option>\n");
      out.write("                    <option value=\"O-\">O-</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"ocupacion\">Ocupación:</label>\n");
      out.write("                <input type=\"text\" id=\"ocupacion\" name=\"ocupacion\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"eps\">EPS:</label>\n");
      out.write("                <input type=\"text\" id=\"eps\" name=\"eps\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"alergias\">Alergias:</label>\n");
      out.write("                <textarea id=\"alergias\" name=\"alergias\" rows=\"4\"></textarea>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"cirugias\">Cirugías:</label>\n");
      out.write("                <textarea id=\"cirugias\" name=\"cirugias\" rows=\"4\"></textarea>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"fecha_nacimiento\">Fecha de Nacimiento:</label>\n");
      out.write("                <input type=\"date\" id=\"fecha_nacimiento\" name=\"fecha_nacimiento\">\n");
      out.write("            </div>\n");
      out.write("            <h2>Contacto de Emergencia</h2>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"nombre_contacto\">Nombre y Apellido:</label>\n");
      out.write("                <input type=\"text\" id=\"nombre_contacto\" name=\"nombre_contacto\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"direccion_contacto\">Dirección:</label>\n");
      out.write("                <input type=\"text\" id=\"direccion_contacto\" name=\"direccion_contacto\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"ciudad_contacto\">Ciudad:</label>\n");
      out.write("                <input type=\"text\" id=\"ciudad_contacto\" name=\"ciudad_contacto\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"telefono_contacto\">Número de Teléfono:</label>\n");
      out.write("                <input type=\"tel\" id=\"telefono_contacto\" name=\"telefono_contacto\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"relacion_contacto\">Relación:</label>\n");
      out.write("                <input type=\"text\" id=\"relacion_contacto\" name=\"relacion_contacto\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <center><button type=\"submit\">Registrar</button></center>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <center><button type=\"submit\">Editar Informacion</button></center>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    \n");
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

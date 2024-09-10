package org.apache.jsp.vistas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Generarreporte_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Generar Reporte</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("    <style>\n");
      out.write("        .disabled-input {\n");
      out.write("            background-color: #f5f5f5;\n");
      out.write("        }\n");
      out.write("        .form-control:disabled {\n");
      out.write("            background-color: #f5f5f5;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container mt-5\">\n");
      out.write("        <h2>Generar Reporte</h2>\n");
      out.write("        <form id=\"reportForm\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"documento\">Número de Documento</label>\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"documento\" placeholder=\"Ingrese el número de documento\" required>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"telefono\">Número de Teléfono</label>\n");
      out.write("                <input type=\"text\" class=\"form-control disabled-input\" id=\"telefono\" placeholder=\"Número de Teléfono\" disabled>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Correo Electrónico</label>\n");
      out.write("                <input type=\"email\" class=\"form-control disabled-input\" id=\"email\" placeholder=\"Correo Electrónico\" disabled>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"doctor\">Seleccione un Doctor</label>\n");
      out.write("                <select class=\"form-control\" id=\"doctor\" required>\n");
      out.write("                    <option value=\"\" disabled selected>Seleccione un doctor</option>\n");
      out.write("                    <option value=\"dr_jose\">Dr. José Martínez</option>\n");
      out.write("                    <option value=\"dr_ana\">Dra. Ana Gómez</option>\n");
      out.write("                    <option value=\"dr_carlos\">Dr. Carlos Rodríguez</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label>Fecha de la Cita:</label>\n");
      out.write("                <div class=\"input-group\">\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"fecha\" placeholder=\"No seleccionada\" disabled>\n");
      out.write("                    <div class=\"input-group-append\">\n");
      out.write("                        <button class=\"btn btn-outline-secondary\" type=\"button\" id=\"selectDate\">Seleccionar Fecha</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label>Hora de la Cita:</label>\n");
      out.write("                <div class=\"input-group\">\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"hora\" placeholder=\"No seleccionada\" disabled>\n");
      out.write("                    <div class=\"input-group-append\">\n");
      out.write("                        <button class=\"btn btn-outline-secondary\" type=\"button\" id=\"selectTime\">Seleccionar Hora</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"motivo\">Motivo de la Cita</label>\n");
      out.write("                <textarea class=\"form-control\" id=\"motivo\" rows=\"4\"></textarea>\n");
      out.write("            </div>\n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\">Programar Cita</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        document.getElementById('documento').addEventListener('input', function() {\n");
      out.write("            // Simulación de autocompletado\n");
      out.write("            if (this.value) {\n");
      out.write("                document.getElementById('telefono').value = '123456789';\n");
      out.write("                document.getElementById('email').value = 'example@mail.com';\n");
      out.write("                document.getElementById('telefono').disabled = false;\n");
      out.write("                document.getElementById('email').disabled = false;\n");
      out.write("            } else {\n");
      out.write("                document.getElementById('telefono').value = '';\n");
      out.write("                document.getElementById('email').value = '';\n");
      out.write("                document.getElementById('telefono').disabled = true;\n");
      out.write("                document.getElementById('email').disabled = true;\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        document.getElementById('selectDate').addEventListener('click', function() {\n");
      out.write("            // Lógica para seleccionar la fecha (puedes usar un datepicker)\n");
      out.write("            const fecha = prompt(\"Ingrese la fecha (YYYY-MM-DD):\");\n");
      out.write("            if (fecha) {\n");
      out.write("                document.getElementById('fecha').value = fecha;\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        document.getElementById('selectTime').addEventListener('click', function() {\n");
      out.write("            // Lógica para seleccionar la hora (puedes usar un timepicker)\n");
      out.write("            const hora = prompt(\"Ingrese la hora (HH:MM):\");\n");
      out.write("            if (hora) {\n");
      out.write("                document.getElementById('hora').value = hora;\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        document.getElementById('reportForm').addEventListener('submit', function(event) {\n");
      out.write("            event.preventDefault();\n");
      out.write("            // Aquí puedes procesar los datos del formulario\n");
      out.write("            alert('Cita programada!');\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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

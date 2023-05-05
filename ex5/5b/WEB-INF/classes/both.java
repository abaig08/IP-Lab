import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class both extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String age = request.getParameter("age");
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>Hello " + name + "</h1>");
        out.println("<p>your Location is " + location + "</p><br>");
        out.println("<p>Your Age is "+ age +"</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "RegisterResult", urlPatterns = "/RegisterResult")
public class RegisterResult extends HttpServlet {
    protected String getString(String name, String value){
        return "<b>"+name+"</b>: " + value + "<br>";
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<h1>Servlet go to doPost</h1>");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        List<String> subjects = null;
        if (request.getParameter("subject") != null) {
            subjects = Arrays.asList(request.getParameterValues("subject"));
        }
        out.println("<h1>Servlet go to doGet</h1>");
        out.println(getString("ID", request.getParameter("id")));
        out.println(getString("Name", request.getParameter("name")));
        out.println(getString("Email", request.getParameter("email")));
        out.println(getString("Gender", request.getParameter("gender")));
        out.println(getString("Field", request.getParameter("field")));
        out.println("<b>Subject list</b>:<br>");
        if (subjects != null)
            subjects.forEach(l -> out.println(getString("", l)));
        out.println(getString("Comment", request.getParameter("cmt")));
    }
}

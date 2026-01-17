import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name = "GetInfor", urlPatterns = "/GetInfor/")
public class GetInfor extends HttpServlet {
    protected void doget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>Reading Personal Information</h1>");
        out.println("<table>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">ID</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("id") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Name</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("name") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Email</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("email") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Gender</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("gender") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Major</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("major") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Interesting Field</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("interestField") + "</td>\n" +
                "        </tr>\n" +
                "    </table>");
    }
}

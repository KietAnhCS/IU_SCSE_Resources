import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name = "GetThreeParam")
public class GetThreeParam extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>Reading Three Request Parameters</h1>");
        out.println("<p><b>param1</b>: "+ request.getParameter("firstPara") +"</p>");
        out.println("<p><b>param2</b>: "+ request.getParameter("secondPara") +"</p>");
        out.println("<p><b>param3</b>: "+ request.getParameter("thirdPara") +"</p>");
    }
}

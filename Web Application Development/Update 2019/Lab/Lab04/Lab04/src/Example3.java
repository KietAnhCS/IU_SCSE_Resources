import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Example3", urlPatterns = "/example3")
public class Example3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>Print out the cookies</h1>");
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            String name = c.getName();
            String value = c.getValue();
            out.println(MyUtil.printCookie(c));
            out.println("<br>");
        }
        Cookie newCookie;
        String name = request.getParameter("cookieName");
        if (name != null && name.length() > 0){
            String value = request.getParameter("cookieValue");
            newCookie = new Cookie(name, value);
            newCookie.setMaxAge(60*60);
            response.addCookie(newCookie);
            out.println("<h1>Set a new cookie</h1>");
            out.println(MyUtil.printCookie(newCookie));
        }



    }
}

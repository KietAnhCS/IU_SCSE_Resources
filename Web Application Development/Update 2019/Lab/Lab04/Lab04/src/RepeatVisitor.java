import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RepeatVisitor", urlPatterns = "/repeatvisitor")
public class RepeatVisitor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Cookie counterCookie = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("counter")) {
                    counterCookie = cookie;
                }
            }
        }

        if (counterCookie == null){
            counterCookie = new Cookie("counter", "0");
            response.addCookie(counterCookie);
            out.println("<h1>Hello World</h1>");
            out.println("Counter: ");
            out.println("0");
        } else {
            Integer value = Integer.valueOf(counterCookie.getValue());
            out.println("<h1>Welcome Back</h1>");
            out.println("Counter: ");
            out.println(value);
            value++;
            counterCookie.setValue(value.toString());
            response.addCookie(counterCookie);
        }
    }
}

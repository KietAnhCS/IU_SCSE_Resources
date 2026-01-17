import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Exercise4", urlPatterns = "/exercise4")
public class Exercise4 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        Integer accessCount = 0;
        if (session.isNew()) {
            session = request.getSession();
            out.println("<h1>Welcome, NewComer</h1>");
        } else {
            out.println("<h1>Welcome, Back</h1>");
            Integer prevAccessCount = (Integer) session.getAttribute("accessCount");
            if (prevAccessCount != null){
                accessCount = prevAccessCount + 1;
            }
        }
        session.setAttribute("accessCount", accessCount);
        out.println(MyUtil.printSession(session, accessCount));
    }
}

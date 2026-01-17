import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Extra", urlPatterns = "/extra")
public class Extra extends HttpServlet {
    private String username = "admin";
    private String password = "admin";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String reqUsername = request.getParameter("username");
        String reqPassword = request.getParameter("password");
        Cookie cookieUserName = null;
        Cookie cookiePassword = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    cookieUserName = cookie;
                }
                if (cookie.getName().equals("password")) {
                    cookiePassword = cookie;
                }
            }
        }

        if (cookieUserName == null || cookiePassword == null){
            if (reqUsername.equalsIgnoreCase(username) && reqPassword.equals(password)){
                out.println("Login Successful");
                Cookie cUsername = new Cookie("username", reqUsername);
                Cookie cPassword = new Cookie("password", reqPassword);
                response.addCookie(cUsername);
                response.addCookie(cPassword);
            } else {
                out.println("Wrong information");
            }
        } else if (cookieUserName.getValue().equalsIgnoreCase(username) && cookiePassword.getValue().equals(password)){
            out.println("You have logged before");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

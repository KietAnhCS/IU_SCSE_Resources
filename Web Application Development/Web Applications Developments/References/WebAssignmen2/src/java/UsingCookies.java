/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UsingCookies extends HttpServlet {
   

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String actionURL="http://localhost:8084/WebAssignmen2/RegistrationUsingCookies";
        String firstName= CookieUtilities.getCookieValue(request, "firstName", "");
        String lastName=CookieUtilities.getCookieValue(request, "lastName", "");
        String emailAddress=CookieUtilities.getCookieValue(request, "emailAddress", "");
        String docType="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0"+"Transitional//EN\">\n";
        String title="PLEASE REGISTER";
        out.println(docType+
                "<html>\n"+
                "<head><title>"+title+"</title></head>\n"+
                "<body>\n"+
                "<center>\n"+
                "<h1>"+title+"</h1>"+
                "<form action=\""+actionURL+"\">\n"+
                "First Name:\n"+
                "<input type=\"text\" name=\"firstName\" "+
                "value=\""+firstName+"\"><br>\n"+
                "Last Name:\n"+
                "<input type=\"text\" name=\"lastName\" "+
                "value=\""+lastName+"\"<br>\n"+
                "Email Address:\n"+
                "<input type=\"text\" name=\"emailAddress\" "+
                "value=\""+emailAddress+"\"<br>\n"+
                "<input type=\"submit\" value=\"register\">\n"+
                "</form></center></body></html>");

        }
    }




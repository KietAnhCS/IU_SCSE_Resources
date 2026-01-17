/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Khanh
 */
public class RegistrationUsingCookies extends HttpServlet {
   
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        boolean isMissingValue=false;
       String firstName = request.getParameter("firstName");
       if(isMissing(firstName)){
           firstName="Missing first name";
           isMissingValue=true;

       }
       String lastName=request.getParameter("lastName");
       if(isMissing(lastName)){
           lastName="Missing last name";
           isMissingValue=true;
       }
       String emailAddress=request.getParameter("emailAddress");
       if(isMissing(emailAddress)){
           emailAddress="Missing email address";
           isMissingValue=true;
       }
       Cookie c1=new LongLivedCookie("firstName",firstName);
       response.addCookie(c1);
       Cookie c2=new LongLivedCookie("lastName",lastName);
       response.addCookie(c2);
       Cookie c3=new LongLivedCookie("emailAddress",emailAddress);
       response.addCookie(c3);

       String formAddress="http://localhost:8084/WebAssignmen2/UsingCookies";
       if(isMissingValue){
           response.sendRedirect(formAddress);

       }else{
        PrintWriter out = response.getWriter();
        String docType="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0"+"Transitional//EN\">\n";
        String title="Thanks for registering";
        out.println(docType+
                "<html>\n"+
                "<head><title>"+title+"</title></head>"+
                "<body>\n"+
                "<center>\n"+
                "<h1\n"+title+"</h1>\n"+
                "<ul>\n"+
                "<li><b>First name</b>"+firstName+"\n"+
                "<li><b>Last name</b>"+lastName+"\n"+
                "<li><b>Email address</b>"+emailAddress+"\n"+
                "</ul>\n"+
                "</center></body></html>");

        }
    }

    private boolean isMissing(String param){
        return ((param==null)||(param.trim().equals("")));
    }
}



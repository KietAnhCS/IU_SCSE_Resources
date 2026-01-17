<%-- 
    Document   : index
    Created on : Oct 17, 2011, 5:17:20 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% response.setContentType("text/html;charset=UTF-8");
    if (request.getParameter("username") != null) {
        session.setAttribute("user", request.getParameter("username"));
        session.setAttribute("pass", request.getParameter("password"));
    }
    try {
        if (request.getParameter("action").equals("out")) {
            session.invalidate();
            response.sendRedirect("/Login");
        }
    } catch (NullPointerException e) {
        if (session.getAttribute("user") == null || session.getAttribute("user").equals("") || session.getAttribute("pass") == null || session.getAttribute("pass").equals("")) {
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
            out.println("<title>Login Page</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action=\"./index.jsp\" method=\"post\">");
            out.println("<h1>USERNAME:</h1>");
            out.println("<input type=\"textbox\" name=\"username\" />");
            out.println("<br /><h1>PASSWORD:</h1>");
            out.println("<input type=\"password\" name=\"password\" />");
            out.println("<br /><input type=\"submit\" name=\"login\" value=\"LOGIN\" />");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        } else {
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
            out.println("<title>Username and Password Data</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h3>User:</h3>");
            out.println(session.getAttribute("user"));
            out.println("<br /><h3>Password:</h3>");
            out.println(session.getAttribute("pass"));
            out.println("<br /><a href=\"/Login/index.jsp?action=out\">destroy session</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }
%>

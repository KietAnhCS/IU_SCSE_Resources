/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
public class LCookie extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transistional//EN\">\n";
        String username = request.getParameter("username");
        String userpass = request.getParameter("userpass");
        try {
            if (username == null) {
                response.sendRedirect("/LoginCookie.html");
            } else {
                boolean newbie = true;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        Cookie c = cookies[i];
                        if ((c.getName().equals(username))
                                && // Could omit test and treat cookie name as a flag
                                (c.getValue().equals("yes"))) {
                            newbie = false;
                            break;
                        }
                    }
                }
                String title;
                if (newbie) {
                    Cookie returnVisitorCookie =
                            new Cookie(username, "yes");
                    returnVisitorCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
                    response.addCookie(returnVisitorCookie);
                    title = "Welcome " + username;
                } else {
                    title = "Welcome " + username + " Back";
                }
                out.println(docType + "<html>\n");
                out.println("<head>");
                out.println("<title>" + "</title>\n");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1 align = center>" + title + "</h1><br>");
                out.print("cookie");
                out.println("</body>");
                out.println("</html>");
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

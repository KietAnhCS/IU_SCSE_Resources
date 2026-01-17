/*
 * HOME WORK ASSIGNMENT 2
 * NAME : LE DUY KHANH
 * ID : ITIU08050
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
/**
 *
 * @author K
 */
public class NewServlet extends HttpServlet {
   
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
        String title = "Reading All Request Parameters";
        try {
            out.println(docType+"<html>\n");
            out.println("<head>");
            out.println("<title>"+"</title>\n");
            out.println("</head>");
            out.println("<body background=\"eye.jpg\">\n");
            out.println("<h1 align = \"center\">"+title+ "</h1>");
            out.println("<TABLE BORDER = 1 ALIGN=CENTER  width= 60% \n");
            out.println("<tr bgcolor = \"#FFAA00\"><th>Name<th>Value</tr>");
            Enumeration paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()){
                String paramName = (String)paramNames.nextElement();
                out.print("<tr><td>"+paramName+"\n<td>");
                String[] paramValues = request.getParameterValues(paramName);

                if (paramValues.length==1){
                    String paramValue = paramValues[0];
                    if (paramValue.length() == 0 )
                        out.println("<i>No Value</i>");
                    else
                        out.println(paramValue);

                } else {
                    out.println("<ul>");
                    for ( int  i = 0; i < paramValues.length;i++) {
                        out.println("<li>" + paramValues[i]);
                    }
                    out.println("</ul>");
                }
            }
            out.println("</TABLE>");
            out.println("</body>");
            out.println("</html>");
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

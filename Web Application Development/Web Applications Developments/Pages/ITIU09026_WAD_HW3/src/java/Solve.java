/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.lang.Math;

/**
 *
 * @author Trong Tin
 */
@WebServlet(name = "Solve", urlPatterns = {"/Solve"})
public class Solve extends HttpServlet {

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
        out.println("<head><title>Result Page</title></head");
        out.println("<body>");
        out.println("<h1 align=\"center\">Result of the given equation:</h1>\n");
        float parav[] =  new float [3];
        Enumeration paramNames = request.getParameterNames();
        while(paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            int i = -1;
            if (paramName.equals("a")) {
                i = 0;
            }
            if (paramName.equals("b")) {
                i = 1;
            }
            if (paramName.equals("c")) {
                i = 2;
            }
            String[] paramValues = request.getParameterValues(paramName);
            String temp = "";
            for(int j = 0; j < paramValues.length; j++) {
                temp += paramValues[j];
            }
            try {
                parav[i] = Float.parseFloat(temp);
            }
            catch (NumberFormatException e) {
                out.println("ERROR! Missing input data. Please go back and check again!");
                return;
            }
        }
        if (parav[0] == 0) {
            if (parav[1] == 0 && parav[2] == 0) {
                out.println("<b>The solution is everywhere</b>");
                return;
            }
            if (parav[1] == 0 && parav[2] != 0) {
                out.println("<b>No solution for given equation</b>");
                return;
            }
            out.println("<b>The solution is " + -parav[2]/parav[1] + "</b>");
            return;
        }
        float delta = parav[1] * parav[1] - 4 * parav[0] * parav[2];
        if (delta < 0) {
            out.println("<b>The equation has no real root</b>");
        }
        if (delta == 0) {
            out.println("<label><b>The euqation has one root:</b></label>");
            float x = -parav[1]/(2 * parav[0]);
            out.println("<label>X = " + x + "</label>");
        }
        if (delta > 0) {
            out.println("<label><b>The euqation has two roots:</b></label>");
            float x1 = (-parav[1] + (float) Math.sqrt(delta))/(2 * parav[0]);
            float x2 = (-parav[1] - (float) Math.sqrt(delta))/(2 * parav[0]);
            out.println("<label>X1 = " + x1 + " and X2 = " + x2 + "</label>");
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

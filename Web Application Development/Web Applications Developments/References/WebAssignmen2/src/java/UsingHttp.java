/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/**
 *
 * @author Khanh
 */
public class UsingHttp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public  void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession();
        ArrayList previousItems=(ArrayList)session.getAttribute("previousItems");
        if(previousItems==null){
            previousItems=new ArrayList();
            session.setAttribute("previousItems", previousItems);
        }
        String newItem=request.getParameter("newItem");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String title="REGISTER FORM";
        String docType="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0"+"Transitional//EN\">\n";
        out.println(docType+
                "<html>\n"+
                "<head><title>"+title+"</title></head>\n"+
                "<body>\n"+
                "<h1>"+title+"</h1>");
        synchronized(previousItems){
            if(newItem!=null){
                previousItems.add(newItem);
            }
            if(previousItems.size()==0){
                out.println("<i>No items</i>");

            }else{
                out.println("<ul>");
                for(int i=0;i<previousItems.size();i++){
                    out.println("<li>"+(String)previousItems.get(i));
                }
                out.println("</ul>");
            }

        }
        out.println("</body></html>");

}
}

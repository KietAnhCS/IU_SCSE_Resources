/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.*;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Trong Tin
 */
@WebServlet(name = "DOMWebClass", urlPatterns = {"/DOMWebClass"})
public class DOMWebClass extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SAXException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DOMServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1><center>List of Students in Web Class</center></h1>");
            out.println("<center><table border=1 cellpadding=0 bgcolor=#FFFFFF></center>");
            out.println("<tr><td><b>Name</b></td> <td><b>ID</b></td> <td><b>DATE</b></td> <td><b>CITY</b></td> </tr>");
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // Turn on namespace support
            factory.setNamespaceAware(true);
            // Create a JAXP document builder
            DocumentBuilder parser = factory.newDocumentBuilder();
            // Read the entire document into memory
            Document document = parser.parse("./WebClass.xml");
            // Obtain the root node of the tree
            Node booklist = document.getDocumentElement();
            NodeList books = booklist.getChildNodes();
            int nBooks = books.getLength();
            for (int i = 0; i < nBooks; i++) {
                Node book = books.item(i);
                if (book.getNodeType() != Node.TEXT_NODE) {
                    out.println("<tr>");
                    printBook(book, out);
                    out.println("</tr>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (SAXException ex) {
            Logger.getLogger(DOMServlet.class.getName()).log(Level.SEVERE,
                    null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(DOMServlet.class.getName()).log(Level.SEVERE,
                    null, ex);
        } finally {
            out.close();
        }
    }

    private void printBook(Node book, PrintWriter out) {
        NamedNodeMap attributes = book.getAttributes();
        if (attributes != null) {
            NodeList childNodes = book.getChildNodes();
            String name = "";
            String idNum = "";
            String date = "";
            String city = "";
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node child = childNodes.item(i);
                String nodeName = child.getLocalName();
                if (nodeName != null) {
                    if (nodeName.equals("name")) {
                        NodeList children = child.getChildNodes();
                        Node nameNode = children.item(0);
                        if (nameNode.getNodeType() == Node.TEXT_NODE) {
                            name = nameNode.getNodeValue();
                        }
                    } else if (nodeName.equals("idNum")) {
                        NodeList children = child.getChildNodes();
                        Node idNumNode = children.item(0);
                        if (idNumNode.getNodeType() == Node.TEXT_NODE) {
                            idNum = idNumNode.getNodeValue();
                        }
                    } else if (nodeName.equals("date-of-birth")) {
                        NodeList children = child.getChildNodes();
                        Node dateNode = children.item(0);
                        if (dateNode.getNodeType() == Node.TEXT_NODE) {
                            date = dateNode.getNodeValue();
                        }
                    } else if (nodeName.equals("city")) {
                        NodeList children = child.getChildNodes();
                        Node cityNode = children.item(0);
                        if (cityNode.getNodeType() == Node.TEXT_NODE) {
                            city = cityNode.getNodeValue();
                        }
                    }
                }
            }
            out.print("<td>" + name + "</td>" + "<td>" + idNum + "</td>"
                    + "<td>" + date + "</td>" + "<td>" + city + "</td>");
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
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

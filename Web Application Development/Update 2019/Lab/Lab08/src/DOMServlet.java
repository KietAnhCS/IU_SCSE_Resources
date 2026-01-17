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

@WebServlet(name = "DOMServlet", urlPatterns = {"/DOMServlet"})
public class DOMServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SAXException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DOMBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1><center>List of student in Student List</center></h1>");
            out.println("<center><table border=1 cellpadding=0 bgcolor=#FFFFFF></center>");
            out.println("<tr><td><b>NAME</b></td> <td><b>ID</b></td><td><b>DATE</b></td> <td><b>CITY</b></td> </tr>");
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // Turn on namespace support
            factory.setNamespaceAware(true);
            // Create a JAXP document builder
            DocumentBuilder parser = factory.newDocumentBuilder();
            // Read the entire document into memory
            String scheme = request.getScheme();
            String serverName = request.getServerName();
            String serverPort = String.valueOf(request.getServerPort());
            String contextPath = request.getContextPath();
            Document document = parser.parse(scheme + "://" + serverName + ":" + serverPort + contextPath + "/WebClass.xml");
            // Obtain the root node of the tree
            Node studentList = document.getDocumentElement();
            NodeList students = studentList.getChildNodes();
            int nStudents = students.getLength();
            for (int i = 0; i < nStudents; i++) {
                Node student = students.item(i);
                if (student.getNodeType() != Node.TEXT_NODE) {
                    out.println("<tr>");
                    printStudent(student, out);
                    out.println("</tr>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (SAXException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE,null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE,null, ex);
        } finally {
            out.close();
        }
    }

    private void printStudent(Node student, PrintWriter out) {
        NamedNodeMap attributes = student.getAttributes();
        if (attributes != null) {
            NodeList childNodes = student.getChildNodes();
            String name = "";
            String id = "";
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
                        Node idNode = children.item(0);
                        if (idNode.getNodeType() == Node.TEXT_NODE) {
                            id = idNode.getNodeValue();
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
            out.print("<td>" + name + "</td>" + "<td>" + id + "</td>" + "<td>" + date + "</td>" + "<td>" + city + "</td>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

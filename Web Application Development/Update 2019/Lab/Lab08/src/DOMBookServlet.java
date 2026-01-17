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

@WebServlet(name = "DOMBookServlet", urlPatterns = {"/DOMBookServlet"})
public class DOMBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SAXException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DOMBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1><center>List of Book in Book List</center></h1>");
            out.println("<center><table border=1 cellpadding=0 bgcolor=#FFFFFF></center>");
            out.println("<tr><td><b>ISBN-10</b></td> <td><b>TITLE</b></td><td><b>AUTHOR</b></td> <td><b>PUBLISHER</b></td> <td><b>PRICE</b></td> </tr>");
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
            Document document = parser.parse(scheme + "://" + serverName + ":" + serverPort + contextPath + "/books.xml");
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
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE,
                    null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE,
                    null, ex);
        } finally {
            out.close();
        }
    }

    private void printBook(Node book, PrintWriter out) {
        NamedNodeMap attributes = book.getAttributes();
        if (attributes != null) {
            NodeList childNodes = book.getChildNodes();
            String isbn = "";
            String title = "";
            String author = "";
            String publisher = "";
            String price = "";
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node child = childNodes.item(i);
                String nodeName = child.getLocalName();
                if (nodeName != null) {
                    if (nodeName.equals("isbn-10")) {
                        NodeList children = child.getChildNodes();
                        Node isbmNode = children.item(0);
                        if (isbmNode.getNodeType() == Node.TEXT_NODE) {
                            isbn = isbmNode.getNodeValue();
                        }
                    } else if (nodeName.equals("title")) {
                        NodeList children = child.getChildNodes();
                        Node titleNode = children.item(0);
                        if (titleNode.getNodeType() == Node.TEXT_NODE) {
                            title = titleNode.getNodeValue();
                        }
                    } else if (nodeName.equals("author")) {
                        NodeList children = child.getChildNodes();
                        Node authorNode = children.item(0);
                        if (authorNode.getNodeType() == Node.TEXT_NODE) {
                            author = authorNode.getNodeValue();
                        }
                    } else if (nodeName.equals("publisher")) {
                        NodeList children = child.getChildNodes();
                        Node publisherNode = children.item(0);
                        if (publisherNode.getNodeType() == Node.TEXT_NODE) {
                            publisher = publisherNode.getNodeValue();
                        }
                    } else if (nodeName.equals("price")) {
                        NodeList children = child.getChildNodes();
                        Node priceNode = children.item(0);
                        if (priceNode.getNodeType() == Node.TEXT_NODE) {
                            price = priceNode.getNodeValue();
                        }
                    }
                }
            }
            out.print("<td>" + isbn + "</td>" + "<td>" + title + "</td>"
                    + "<td>" + author + "</td>" + "<td>" + publisher + "</td>" + "<td>" + price + "</td>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(DOMBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

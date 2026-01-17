import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

//@WebServlet(name = "RegisterCourse")
public class RegisterCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
//        request.getRequestDispatcher("RegisterCourse.jsp").forward(request, response);
        String[] course = request.getParameterValues("subject");
        String courseResult ="";
        for (String c : course){
//            courseResult.concat(c + "<br>");
            courseResult += c + "<br>";
        }
        String result = "<table allign=\"center\">\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">ID</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("id") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Name</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("name") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Email</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("email") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Gender</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("gender") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Field of Study</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("field") + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Course List</td>\n" +
                "            <td colspan=\"2\">"+ courseResult + "</td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td colspan=\"1\">Interesting Field</td>\n" +
                "            <td colspan=\"2\">"+ request.getParameter("interestField") + "</td>\n" +
                "        </tr>\n" +
                "    </table>";
        out.println(result);

//        // Recipient's email ID needs to be mentioned.
//        String to = "xuantung.1998@gmail.com";
//        // Sender's email ID needs to be mentioned
//        String from = "xuantung.1998@gmail.com";
//        // Assuming you are sending email from localhost
//        String host = "localhost";
//        // Get system properties
//        Properties properties = System.getProperties();
//        // Setup mail server
//        properties.setProperty("mail.smtp.host", host);
//        // Get the default Session object.
//        Session session = Session.getDefaultInstance(properties);
//        // Set response content type
//        try {
//            // Create a default MimeMessage object.
//            MimeMessage message = new MimeMessage(session);
//            // Set From: header field of the header.
//            message.setFrom(new InternetAddress(from));
//            // Set To: header field of the header.
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            // Set Subject: header field
//            message.setSubject("Lab03 - task 4");
//            // Now set the actual message
//            message.setText(result);
//            // Send message
//            Transport.send(message);
//        } catch (MessagingException mex) {
//            mex.printStackTrace();
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

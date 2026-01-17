<%@ page import="java.sql.*" %>
<html>
<body>
<%
    String connectionURL="jdbc:mysql://35.247.180.147:3306/Lab05_Ntxtung"; //step 2
    Connection connection = null; //step 3
    Statement statement = null; //step 4
    ResultSet rs = null;
%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //step 1
        connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM course"); //step 5
        while (rs.next()) {
            out.println(rs.getString("CourseName"));
            out.println(rs.getString("Credits")+"<br>");
        } //step 6
        rs.close(); //step 7
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }


%>
</body>
</html>

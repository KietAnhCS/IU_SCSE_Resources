import java.sql.*;

public class DBSingleton {
    private static DBSingleton instance;
    private String connectionURL = "jdbc:mysql://35.247.180.147:3306/Lab05_Ntxtung";
    private Connection connection = null;
    private Statement statement = null;

    private DBSingleton() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static DBSingleton getInstance() {
        if(instance == null) {
            synchronized(DBSingleton.class) {
                if(null == instance) {
                    instance  = new DBSingleton();
                }
            }
        }
        return instance;
    }

    public ResultSet exec(String queryStr){
        ResultSet rs = null;
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(queryStr);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}

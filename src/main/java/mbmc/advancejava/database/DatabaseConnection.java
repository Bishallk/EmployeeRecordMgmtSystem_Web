package mbmc.advancejava.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String url = "jdbc:mysql://127.0.0.1:3306/employee_mgmt_system";
    private static final String username = "root";
    private static final String password = "bishal";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        //        if (connection != null) {
//            System.out.println("Database Connected");
//        }
        return DriverManager.getConnection(url, username, password);
    }
    public static void
    closeConnection(Connection connection) throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}


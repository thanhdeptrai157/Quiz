package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static Connection connection;

    private static final String URL = "jdbc:mysql://localhost:3306/Quiz";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";


    private DatabaseConnection() {}

    public static Connection getConnection() {
        if (connection == null) {
            synchronized (DatabaseConnection.class) {
                if (connection == null) {
                    try {
                        Class.forName(DRIVER);
                        connection = DriverManager.getConnection(URL, USER, PASSWORD);
                        System.out.println("Kết nối cơ sở dữ liệu thành công!");
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        throw new RuntimeException("Kết nối cơ sở dữ liệu thất bại!", e);
                    }
                }
            }
        }
        return connection;
    }
}

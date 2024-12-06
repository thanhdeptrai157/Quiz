package Model.DAO;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class DAO {

    private Connection connection;
    private Statement statement;

    public ResultSet Query(String query, Object... params) throws SQLException, ClassNotFoundException {

        PreparedStatement preparedStatement = null;
        try {
            connection = DatabaseConnection.getConnection();    
            statement = connection.createStatement();

            preparedStatement = connection.prepareStatement(query);

            for (int i = 0; i < params.length; i++) {
                preparedStatement.setString(i + 1, params[i].toString());
            }   
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return preparedStatement.executeQuery();
    }

    public int Update(String query, Object... params) throws SQLException {
        PreparedStatement preparedStatement = null;
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();

            preparedStatement = connection.prepareStatement(query);

            for (int i = 0; i < params.length; i++) {
                preparedStatement.setString(i + 1, params[i].toString());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return preparedStatement.executeUpdate();
    }


    public void Close(){
        try {
            connection.close();
            statement.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

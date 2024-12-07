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

            setParameter(preparedStatement, params);
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

            setParameter(preparedStatement, params);
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

    private void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof Boolean) {
                    statement.setBoolean(index, (Boolean) parameter);
                } else if (parameter instanceof Date) {
                    statement.setDate(index, (Date) parameter);
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

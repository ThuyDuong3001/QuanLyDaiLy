package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleConnection {

    public static Connection getJDBCConnection() {
        final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        final String user = "QL_DAILY";
        final String password = "12345678";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try {
                return DriverManager.getConnection(url, user, password);
            } catch (SQLException e) {
                Logger.getLogger(OracleConnection.class.getName()).log(Level.SEVERE, null, e);
            }
        } catch (ClassNotFoundException e) {
            Logger.getLogger(OracleConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;

    }


}

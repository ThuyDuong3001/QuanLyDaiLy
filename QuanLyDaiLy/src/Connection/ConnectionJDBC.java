/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class ConnectionJDBC {
    public static Connection getJDBCConnection() throws SQLException, ClassNotFoundException {
        String hostName = "localhost";
        String sid = "orcl";
        String userName = "system";
        String password = "1";

        return getJDBCConnection(hostName, sid, userName, password);
    }

    public static Connection getJDBCConnection(String hostName, String sid,
            String userName, String password) throws ClassNotFoundException,
            SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String connectionURL = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;

        Connection conn = DriverManager.getConnection(connectionURL, userName,
                password);
        return conn;
    }
}

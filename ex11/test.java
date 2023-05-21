/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abdullah;

import com.sun.xml.fastinfoset.util.StringArray;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;

@WebService(serviceName = "Test")
public class Test {

    Connection conn = null;
    Statement stmt = null;
    String[] str = new String[10];

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Display")
    public java.lang.String[] Display() {

        for (int i = 0; i < 10; i++) {
            str[i] = "0";
        }

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "");
            if (conn != null) {
                System.out.println("<h1> No issues in Connection</h1>");
            }
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM movie";
            ResultSet rs = stmt.executeQuery(sql);
            int i = 0;
            while (rs.next()) {
                String title = rs.getString("title");
                str[i] = title;
                i++;
            }
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return str;
    }

}
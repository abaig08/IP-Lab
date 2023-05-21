<%@ page import="java.io.*, java.util.*, java.sql.*" %>
    <%@ page import="javax.servlet.*, javax.servlet.http.*" %>

        <% response.setContentType("text/html"); Connection conn=null; PreparedStatement pstmt=null; String
            gName=request.getParameter("game_name"); String gYear=request.getParameter("game_year"); String
            gType=request.getParameter("game_type"); String gMode=request.getParameter("game_mode"); try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaming", "root" , "" );
            pstmt=conn.prepareStatement("INSERT INTO game_info (game_name, game_year, game_type, game_mode) VALUES (?,
            ?, ?, ?)"); pstmt.setString(1, gName); pstmt.setInt(2, Integer.parseInt(gYear)); pstmt.setString(3, gType);
            pstmt.setString(4, gMode); int rowsInserted=pstmt.executeUpdate(); out.println("<html>");
            out.println("

            <head>");
                out.println("<title>Create Results</title>");
                out.println("
                <link rel=\"stylesheet\" href=\"style1.css\">");
                out.println("
            </head>");
            out.println("

            <body>");

                if (rowsInserted > 0) {
                out.println("<p>Values added into the table successfully!</p>");
                }

                out.println("</body>");
            out.println("

            </html>");
            } catch (ClassNotFoundException | SQLException e) {
            // Log or handle the exception in a more informative way
            e.printStackTrace();
            out.println("<p>Error adding values into the table.</p>");
            } finally {
            // Close the PreparedStatement and Connection objects
            if (pstmt != null) {
            try {
            pstmt.close();
            } catch (SQLException e) {
            e.printStackTrace();
            }
            }
            if (conn != null) {
            try {
            conn.close();
            } catch (SQLException e) {
            e.printStackTrace();
            }
            }
            }
            %>
<%@ page
    import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, java.sql.DriverManager, java.sql.Connection, java.sql.SQLException"
    %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>Display Results</title>
        <link rel="stylesheet" href="style1.css">
    </head>

    <game>
        <% response.setContentType("text/html"); Connection conn=null; PreparedStatement pstmt=null; try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaming", "root" , "" );
            pstmt=conn.prepareStatement("SELECT * FROM game_info"); ResultSet rs=pstmt.executeQuery(); while (rs.next())
            { String gameName=rs.getString("game_name"); String gameYear=rs.getString("game_year"); String
            gameType=rs.getString("game_type"); String gameMode=rs.getString("game_mode"); out.println("<p>");
            out.println("Game name: " + gameName + "<br>");
            out.println("Game year: " + gameYear + "<br>");
            out.println("Game type: " + gameType + "<br>");
            out.println("Game mode: " + gameMode + "<br>");
            out.println("</p>");
            }

            rs.close();
            pstmt.close();
            conn.close();
            } catch (ClassNotFoundException | SQLException e) {
            // Log or handle the exception in a more informative way
            e.printStackTrace();
            out.println("<p>Error retrieving search results.</p>");
            }
            %>
    </game>

    </html>
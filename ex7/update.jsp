<%@ page import="java.io." %>
    <%@ page import="java.util." %>
        <%@ page import="javax.servlet." %>
            <%@ page import="javax.servlet.http." %>
                <%@ page import="java.sql.*" %>
                    <%@ page import="java.sql.DriverManager" %>
                        <%@ page import="java.sql.Connection" %>
                            <%@ page import="java.sql.SQLException" %>

                                <% response.setContentType("text/html"); Connection conn=null; PreparedStatement
                                    pstmt=null; String gameName=request.getParameter("game_name"); String
                                    gameYear=request.getParameter("game_year"); String gameType=request.getParameter("
                                    game_type"); String gameMode=request.getParameter("game_mode"); String
                                    oldgameName=request.getParameter("old_game_name"); try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaming", "root" , ""
                                    ); pstmt=conn.prepareStatement("UPDATE game_info SET game_name=?, game_year=?,
                                    game_type=?, game_mode=? WHERE game_name=?"); pstmt.setString(1, gameName);
                                    pstmt.setInt(2, gameYear); pstmt.setString(3, gameType); pstmt.setString(4,
                                    gameMode); pstmt.setString(5, oldgameName); int rowsUpdated=pstmt.executeUpdate();
                                    out.println("<html>");
                                    out.println("

                                    <head>");
                                        out.println("<title>Delete Results</title>");
                                        out.println("
                                        <link rel=\"stylesheet\" href=\"style1.css\">");
                                        out.println("
                                    </head>");
                                    out.println("

                                    <body>");

                                        if (rowsUpdated > 0) {
                                        out.println("<p>Row updated successfully!</p>");
                                        } else {
                                        out.println("<p>No rows updated.</p>");
                                        }

                                        out.println("</body>");
                                    out.println("

                                    </html>");

                                    pstmt.close();
                                    conn.close();
                                    } catch (ClassNotFoundException | SQLException e) {
                                    // Log or handle the exception in a more informative way
                                    e.printStackTrace();
                                    out.println("<p>Error updating row.</p>");
                                    }
                                    %>
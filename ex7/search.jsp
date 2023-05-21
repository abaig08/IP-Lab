<%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
        <%@ page import="javax.servlet.*" %>
            <%@ page import="javax.servlet.http.*" %>
                <%@ page import="java.sql.*" %>
                    <%@ page import="java.sql.DriverManager" %>
                        <%@ page import="java.sql.Connection" %>
                            <%@ page import="java.sql.SQLException" %>

                                <% response.setContentType("text/html"); Connection conn=null; PreparedStatement
                                    pstmt=null; String gtype=request.getParameter("game"); try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaming", "root" , ""
                                    ); pstmt=conn.prepareStatement("SELECT * FROM game_info WHERE game_type=?");
                                    pstmt.setString(1, gtype); ResultSet rs=pstmt.executeQuery(); %>

                                    <!DOCTYPE html>
                                    <html>

                                    <head>
                                        <title>Search Results</title>
                                        <link rel="stylesheet" href="style1.css">
                                    </head>

                                    <body>
                                        <% while (rs.next()) { String gameName=rs.getString("game_name"); String
                                            gameYear=rs.getString("game_year"); String
                                            gameType=rs.getString("game_type"); String
                                            gameMode=rs.getString("game_mode"); out.println("<p>");
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
                                    </body>

                                    </html>
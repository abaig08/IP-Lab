<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
        <% Class.forName("com.mysql.jdbc.Driver");%>

            <% Cookie email=new Cookie("email",request.getParameter("email")); email.setMaxAge(60*60*24);
                response.addCookie( email ); %>

                <html>

                <head>
                    <title>Cart</title>
                    <link rel="stylesheet" href="style.css">
                </head>

                <body>
                    <div class="container">
                        <center>
                            </br>
                            <header style='text-align: right'>
                                <%= request.getParameter("email")%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="logout.jsp" target="_blank">Logout</a>
                            </header>
                            </br>
                            <% Connection
                                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaming", "root" , ""
                                ); Statement statement=connection.createStatement() ; ResultSet
                                resultset=statement.executeQuery("select * from game_info") ; %>
                                <form method="post" action="price.jsp">
                                    <TABLE BORDER="1">
                                        <TR>
                                            <TH>Game Name</TH>
                                            <TH>Game Year</TH>
                                            <TH>Gody Type</TH>
                                            <TH>Game Mode</TH>
                                            <TH>Price</TH>
                                        </TR>
                                        <% while(resultset.next()){ %>
                                            <TR>
                                                <TD>
                                                    <%= resultset.getString("game_name") %>
                                                </TD>
                                                <TD>
                                                    <%= resultset.getString("game_year") %>
                                                </TD>
                                                <TD>
                                                    <%= resultset.getString("game_type") %>
                                                </TD>
                                                <TD>
                                                    <%= resultset.getString("game_mode") %>
                                                </TD>
                                                <TD>
                                                    <%= resultset.getDouble("game_price") %>
                                                </TD>
                                                </TD>
                                                <td><input type="checkbox" name="selectedgames"
                                                        value='<%= resultset.getString("game_name") + ":" + resultset.getString("game_price") %>'>
                                                </td>
                                            </TR>
                                            <% } %>
                                    </TABLE>
                                    <br><br>
                                    <input type="submit" value="check price">
                                </form>
                        </center>
                    </div>
                </body>

                </html>
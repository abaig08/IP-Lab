<h1>Total Amount of Selected Products</h1>

<%@ page import="java.util.*" %>
    <% String[] selectedGames=request.getParameterValues("selectedgames"); double totalPrice=0.0;
        if(selectedGames!=null) { %>
        <TABLE BORDER="1" style="color:white;">
            <TR>
                <TH>Game Name</TH>
                <TH>Game Price</TH>
            </TR>
            <% for (String games : selectedGames) { String[] parts=games.split(":"); double
                price=Double.parseDouble(parts[1]); totalPrice +=price; %>
                <TR>
                    <TD>
                        <%= parts[0] %>
                    </TD>
                    <TD>
                        <%= price %>
                    </td>
                </TR>
                <% } %>
        </TABLE>
        <% } %>



            <!DOCTYPE html>
            <html>

            <head>
                <title>total price</title>
                <link rel="stylesheet" href="style.css">
            </head>

            <body>
                <p style="color:white;"> Total amount of the selected games is <b>
                        <%= totalPrice %>
                    </b>.</p>
            </body>

            </html>
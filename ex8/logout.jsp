<html>

<head>
   <title>Reading Cookies</title>
</head>

<body>
   <center>
      <h1>Reading Cookies</h1>
   </center>
   <% Cookie cookie=null; Cookie[] cookies=null;
      cookies=request.getCookies(); 
      for (int i=0; i < cookies.length; i++) { 
         cookie=cookies[i]; 
         if((cookie.getName()).compareTo("email")==0 ){
            cookie.setMaxAge(0); 
            response.addCookie(cookie); 
         }
      request.getRequestDispatcher("login.html").include(request, response); } %>
</body>

</html>
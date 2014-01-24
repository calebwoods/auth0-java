<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <script src="https://d19p4zemcycm7a.cloudfront.net/w2/auth0-widget-2.4.0.min.js"></script>
  </head>
  <body>
    <script type="text/javascript">

     <%!

         // Converts a relative path into a full path
         // Taken from http://stackoverflow.com/posts/5212336/revisions
        public String buildUrl(HttpServletRequest request, String relativePath) {


         String scheme      =    request.getScheme();        // http
         String serverName  =    request.getServerName();    // hostname.com
         int serverPort     =    request.getServerPort();    // 80
         String contextPath =    request.getContextPath();   // /mywebapp

         // Reconstruct original requesting URL
         StringBuffer url =  new StringBuffer();
         url.append(scheme).append("://").append(serverName);

         if ((serverPort != 80) && (serverPort != 443)) {
             url.append(":").append(serverPort);
         }

         url.append(contextPath).append(relativePath);

         return url.toString();

         }
      %>

      var widget = new Auth0Widget({
        domain:         '<%= application.getInitParameter("auth0.domain") %>',
        clientID:       '<%= application.getInitParameter("auth0.client_id") %>',
        callbackURL:    '<%= buildUrl(request, "/callback") %>'
      });

    </script>
    <% if ( request.getParameter("error") != null ) { %>
        <span style="color: red;"><c:out value="${param.error}" /> </span>
    <% } %>
    <button onclick="widget.signin()">Login</button>
  </body>
</html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="white"><%@include file="home.jsp" %>
        <script type="text/javascript" src="home.jsp"> </script>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
        <%  
        String query=request.getParameter("query");        
        Connection con=null;
        PreparedStatement pst=null;
        try{                        
            String name=(session.getAttribute("name")).toString();
            String pass=(session.getAttribute("pass")).toString();
            
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareStatement("insert into queries values(?,?)");
        pst.setString(1,pass);
        pst.setString(2,query);
        pst.executeUpdate();        
        }
        catch(Exception e)
        {
            out.println(e);
            }
        %>
<br><br><h1 align="center">Query Submitted</h1>
<a href=""
    </body>
</html>
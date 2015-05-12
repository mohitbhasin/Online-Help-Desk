<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="cyan"><%@include file="home.jsp" %>
        <script type="text/javascript" src="home.jsp"> </script>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
        <%
        String id=request.getParameter("id");
        String first=request.getParameter("first");
        String last=request.getParameter("last");
        String qual=request.getParameter("qual");
        String dob=request.getParameter("dob");
        String doj=request.getParameter("doj");
        String type="faculty";
        Connection con=null;
        PreparedStatement pst=null;
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareStatement("insert into faculty values(?,?,?,?,?,?);");
        pst.setString(1,id);
        pst.setString(2,first);
        pst.setString(3,last);
        pst.setString(4,qual);
        pst.setString(5,dob);
        pst.setString(6,doj);
        pst.executeUpdate();
         pst=con.prepareStatement("insert into login values(?,?,'faculty');");
        pst.setString(1,first);
        pst.setString(2,id);       
        pst.executeUpdate();
        }
        catch(Exception e)
        {
            out.println(e);
            }
        %>
<br><br><h1 align="center">Faculty Added</h1>
<br><br><input align="right" type="button" value="<<Go Back" onclick="window.location.href='add_fac.jsp'">
    </body>
</html>
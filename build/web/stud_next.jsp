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
        String enroll=request.getParameter("enroll");
        String first=request.getParameter("first");
        String last=request.getParameter("last");
        String father=request.getParameter("father");
        String course=request.getParameter("course");
        String atten=request.getParameter("atten");
        //String type="student";
        Connection con=null;
        PreparedStatement pst=null;
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareStatement("insert into student values(?,?,?,?,?,?);");
        pst.setString(1,enroll);
        pst.setString(2,first);
        pst.setString(3,last);
        pst.setString(4,father);
        pst.setString(5,course);
        pst.setString(6,atten);
        pst.executeUpdate();
         pst=con.prepareStatement("insert into login values(?,?,'student');");
        pst.setString(1,first);
        pst.setString(2,enroll);
        pst.executeUpdate();
         pst=con.prepareStatement("insert into attendance values(?,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');");
        pst.setString(1,enroll);

        pst.executeUpdate();
        }
        catch(Exception e)
        {
            out.println(e);
            }
        %>
<br><br><h1 align="center">Student Added</h1>
<br><br><input align="right" type="button" value="<<Go Back" onclick="window.location.href='add_fac.jsp'">
    </body>
</html>
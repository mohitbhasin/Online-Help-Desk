<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="white">
        <h1 style="color:aqua">Administrator</h1>
        <%@include file="home.jsp" %><br><br>
        <%@page import="java.sql.*" session="true" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
        <script>
           
    </script>
        <%
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            session=request.getSession();
            String name=(session.getAttribute("name")).toString();
            String pass=(session.getAttribute("pass")).toString();

        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareCall("select * from login where password=? && id=?");
        pst.setString(1,pass);
        pst.setString(2,name);
        rs=pst.executeQuery();
        while(rs.next())
            {
        %>
        <form name="frm" onsubmit="return check()">

            <h1 style="color:silver">Welcome <%out.println(rs.getString(1));%></h1>

            <a href="add_fac.jsp" style="color:aqua">Add new faculty</a><br>
            <a href="add_stud.jsp" style="color:aqua">Add new student</a><br>
            <a href="admin_fac.jsp" style="color:aqua">View Faculties</a><br>
            <a href="admin_stud.jsp">View Students</a><br>
            <a href="view_query.jsp">View Queries</a><br>
        <%
        }}
        catch(Exception e)
            {
            out.println("exception is "+e);
            }
        %>
       </form>
       </body>
       </html>
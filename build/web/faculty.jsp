<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="white">
        <h1 style="color:aqua">Faculty</h1>
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
        pst=con.prepareCall("select * from faculty where id=? && first_name=?");
        pst.setString(1,pass);
        pst.setString(2,name);
        rs=pst.executeQuery();
        while(rs.next())
            {
        %>
        <form name="frm" action="submit_query.jsp" onsubmit="return check()">

            <h1 style="color:silver">Welcome <%out.println(rs.getString(2)+" "+rs.getString(3));%></h1>
            
            <a href="submit_marks.jsp" style="color:aqua">Submit Marks</a><br>
            <a href="fac_marks.jsp" style="color:aqua">View Marks</a><br>
            <a href="fac_atten.jsp" style="color:aqua">View Attendance</a><br>
                <a href="submit_atten.jsp" style="color:aqua">Submit Attendance</a><br>
                    <a href="fac_details.jsp" style="color:aqua">Faculty Details</a><br>
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
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="white">
        <%@include file="home.jsp" %><br><br>
        <%@page import="java.sql.*" session="true" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
        <script>                 
            function check()
            {             
              if (document.frm.query.value=="")
                 {
                   alert("You need to write some query before you Submit");
                   return false;
                 }              
            }
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
        pst=con.prepareCall("select * from student where enroll=? && first_name=?");
        pst.setString(1,pass);
        pst.setString(2,name);
        rs=pst.executeQuery();
        while(rs.next())
            {       
        %>
        <form name="frm" action="submit_query.jsp" onsubmit="return check()">
            
            <h1 style="color:silver">Welcome <%out.println(rs.getString(2)+" "+rs.getString(3));%></h1>
            <p align="left">Enrollment number <%out.println(rs.getString(1));}%></p>
            <a href="marks.jsp" style="color:aqua">Score Card</a><br>
            <a href="student_details.jsp" style="color:aqua">View Details</a><br>
            <a href="attendance.jsp" style="color:aqua">View Attendance</a><br><br>
            <input type="text" name="query" size="50" style="height:100px">
            <input type="submit" value="Submit Query">
        <%
        }
        catch(Exception e)
            {
            out.println("exception is "+e);
            }
        %>
       </form>
       </body>
       </html>
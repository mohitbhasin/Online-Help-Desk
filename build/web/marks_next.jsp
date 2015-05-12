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
        
         String enroll=request.getParameter("enroll");
         int c=Integer.parseInt(request.getParameter("c"));
         int java=Integer.parseInt(request.getParameter("java"));
         int maths=Integer.parseInt(request.getParameter("maths"));
         int dbms=Integer.parseInt(request.getParameter("dbms"));
         int total=c+java+maths+dbms;
         out.println("<BR>Enrollment="+enroll+" C="+c+" JAVA="+java+" MATHS="+maths+" DBMS="+dbms+" TOTAL="+total);
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareStatement("select * from marks");
        rs=pst.executeQuery();
        if(rs.next())
            {
           if(rs.getString(1).equals(enroll))
           {
               out.println("<br><br><p style='color:green;font:large'>Marks Submitted</p>");
           }
           else
            {
            out.println("<br><br><p style='color:red;font:large'>Invalid Enrollment Number</p>");
            }
           }
        pst=con.prepareStatement("update marks set c=?,java=?,maths=?,dbms=?,total=? where enroll=?;");
        pst.setInt(1,c);
        pst.setInt(2,java);
        pst.setInt(3,maths);
        pst.setInt(4,dbms);
        pst.setInt(5,total);
        pst.setString(6,enroll);
        pst.executeUpdate();             
        }
        catch(Exception e)
        {
            out.println(e);
            }
        %>
<br><br><br><br><input align="right" type="button" value="<<Go Back" onclick="window.location.href='submit_marks.jsp'">
    
    </body>
</html>
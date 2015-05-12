<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="white"><%@include file="home.jsp" %><br><br>
        <script type="text/javascript" src="home.jsp"> </script>
        <%@page import="java.sql.*" session="true" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
        <%
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            //session=request.getSession();
            String name=(session.getAttribute("name")).toString();
            String pass=(session.getAttribute("pass")).toString();
            float atten=0;

        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareCall("select * from attendance where enroll=?");
        pst.setString(1,pass);        
        rs=pst.executeQuery();%>
        <br><h1 align="center">Attendance</h1>
        <p>The minimun percentage of attendance required is 70%. If percentage is below 70% then the admit card will not be alloted to the student.</p>
        <%while(rs.next())
            {           
            atten=Float.parseFloat(rs.getString(28));
        }
               if(atten<70)
               {
               %><p style="color:red;font:bold" align="center">Your Attendance <%out.println(atten);%>%</p><%
               }
               else
                   {
               %><p style="color:green;font:bold" align="center">Your Attendance <%out.println(atten);%>%</p><%
                   }
        %>
         <table align='center' border=5>
                <th>ENROLL NO.</th>
                <th>SCORED</th>
                <TH>TOTAL</TH>
                <TH>AGGREGATE(%)</TH>
                <TR>
        <%
        pst=con.prepareCall("select * from attendance where enroll=?;");
        pst.setString(1,pass);
        rs=pst.executeQuery();
        while(rs.next())
            {
            out.println("</tr>");
            out.println("<td>"+rs.getString(1)+"</td><td>"+rs.getString(26)+"</td><td>"+rs.getString(27)+"</TD><td>"+rs.getString(28)+"</TD>");
            out.println("</tr>");
            }
            }
        catch(Exception e)
                {
            out.println("exception is "+e);
            }
        %>
         </table>
                </body>
                </html>

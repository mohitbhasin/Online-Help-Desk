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

        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareCall("select * from faculty where id=? && first_name=?");
        pst.setString(1,pass);
        pst.setString(2,name);
        rs=pst.executeQuery();%>
        <br><h1 align="center">Faculty Details</h1>
                <table align='center' border=5>
                <th>ID</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>QUALIFICATION</th>
                <th>DOB</th>
                <th>DATE OF JOINING</th>
                <TR>
        <%while(rs.next())
            {
            //for (int i=1;i<6;i++)
            //{
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
         //}
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

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
         String atten=request.getParameter("atten");
         String month=request.getParameter("month");
         int sum=Integer.parseInt(request.getParameter("total"));
         boolean a;
         float aggregate=0;
         int total=0;
         int total_scored=0;
         int i=0;
         out.println("<BR>Enrollment="+enroll+" Attendance="+atten+" month "+month+" total "+sum);
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:ohd","root","root");
        pst=con.prepareStatement("select * from attendance");
        rs=pst.executeQuery();
        while(rs.next())
            {
            if(rs.getString(1).equals(enroll))
            {
                a=true;
            }
            }
           if(a=true)
           {
               out.println("<br><br><p style='color:green;font:large'>Attendance Submitted</p>");
           }
           else
            {            
            out.println("<br><br><p style='color:red;font:large'>Invalid Enrollment Number</p>");
            }
                 
       
        pst=con.prepareStatement("update attendance set "+month+"=?,"+month+"_tot=? where enroll=?;");
        pst.setString(1,atten);
        pst.setInt(2,sum);
        pst.setString(3,enroll);
        pst.executeUpdate();
        pst=con.prepareStatement("select * from attendance where enroll=?");
        pst.setString(1,enroll);
        rs=pst.executeQuery();
        while(rs.next())
            {
            for(i=2;i<25;i++)
            {
            total_scored=total_scored+Integer.parseInt(rs.getString(i));
            i++;
            }
            }
         pst=con.prepareStatement("select * from attendance where enroll=?");
        pst.setString(1,enroll);
        rs=pst.executeQuery();
        while(rs.next())
            {
            for(i=3;i<26;i++)
            {
            total=total+Integer.parseInt(rs.getString(i));
            i++;
            }
            }
        out.println("total Classes="+total+" Attendance scored "+total_scored);
        aggregate=((float)total_scored/(float)total)*100;
        out.println("aggregate="+aggregate);
        pst=con.prepareStatement("update attendance set total_scored=?,total=?,aggregate=? where enroll=?;");
        pst.setInt(1,total_scored);
        pst.setInt(2,total);
        pst.setFloat(3,aggregate);
        pst.setString(4,enroll);
        pst.executeUpdate();
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
<br><br><br><br><input align="right" type="button" value="<<Go Back" onclick="window.location.href='submit_atten.jsp'">

    </body>
</html>
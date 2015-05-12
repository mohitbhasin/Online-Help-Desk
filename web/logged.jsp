<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body bgcolor="">
        <%@page import="java.sql.*" session="true" %>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>        
        <%String name=request.getParameter("name");
        String pass=request.getParameter("pass");
        String type=request.getParameter("type");
        session=request.getSession();       
        session.setAttribute("name", name);
        session.setAttribute("pass",pass);
        session.setAttribute("type",type); 
        
        String usr ="postgres";
			String pwd ="12345";
			String url ="jdbc:postgresql://localhost:5432/postgres";
        ServletContext context= getServletContext();
        RequestDispatcher rd;
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
        Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection(url, usr, pwd);        
//con=DriverManager.getConnection("jdbc:postgresql://postgres.cs.stevens.edu:5432/postgres","postgres","12345");
        pst=conn.prepareStatement("select * from login where id=? && password=? && type=?");
        pst.setString(1,name);
        pst.setString(2,pass);
        pst.setString(3,type);
        rs=pst.executeQuery();
               
        if(rs.next())
           {           
           if(type.equals("student"))
           {
           rd= context.getRequestDispatcher("/student.jsp");
           rd.forward(request, response);
           }
           if(type.equals("faculty"))
           {
           rd= context.getRequestDispatcher("/faculty.jsp");
           rd.forward(request, response);
           }           
           if(type.equals("administrator"))
           {
           rd= context.getRequestDispatcher("/admin.jsp");
           rd.forward(request, response);
           }
           }
          else
           {
            %>
            <p align="center"><%out.println("invalid user ");%></p><%
            RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
            dis.include(request,response);           
           }
        }
        catch(Exception e)
        {
            out.println("Exception is "+e);
            }
        %>
    </body>
</html>

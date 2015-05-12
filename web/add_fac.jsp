<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>form</title>
    </head>
    <body><%@include file="home.jsp" %><br><br>
        <script>
              function check()
    {
            if(document.frm.id.value=="")
            {
                alert("ID cannot be blank");
                return false;
            }
           if(document.frm.first.value=="")
            {
                alert("First Name cannot be blank");
                return false;
            }
            if(document.frm.last.value=="")
                {
                    alert("Last Name cannot be blank");
            return false;
            }
            if(document.frm.qual.value=="")
            {
                alert("Qualification cannot be blank");
                return false;
            }
            if(document.frm.dob.value=="")
            {
                alert("DOB cannot be blank");
                return false;
            }
            if(document.frm.doj.value=="")
            {
                alert("Date of Joining cannot be blank");
                return false;
            }
          return true;

    }
            </script>
            <%
            String name=(session.getAttribute("name")).toString();
            String pass=(session.getAttribute("pass")).toString();
            %>

                    <br><p align="center">Please fill the details to create account</p>
        <form action="fac_next.jsp" name="frm" onsubmit="return(check())">
        <table align="center">
            <tr><td>User ID</td><td><input type="text" name="id"></td></tr>
            <tr><td>First Name</td><td><input type="text" name="first"></td></tr>
            <tr><td>Last Name</td><td><input type="text" name="last"></td></tr>
            <tr><td>Qualification</td><td><input type="text" name="qual"></td></tr>
            <tr><td>DOB</td><td><input type="text" name="dob"></td></tr>
            <tr><td>Date of Joining</td><td><input type="text" name="doj"></td></tr>
            <tr><td><input type="submit" value="Submit"></td></tr>
            <tr><td> <button onclick="window.location.href='admin.jsp'">Home</button></td></tr>
        </table>
        </form>


</html>
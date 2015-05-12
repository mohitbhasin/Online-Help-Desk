<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>form</title>
    </head>
    <body><%@include file="home.jsp" %><br><br>
        <script>
              function check()
    {
            if(document.frm.enroll.value=="")
            {
                alert("Enroll no. cannot be blank");
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
            if(document.frm.father.value=="")
            {
                alert("Father's name cannot be blank");
                return false;
            }
            if(document.frm.course.value=="")
            {
                alert("Course cannot be blank");
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
        <form action="stud_next.jsp" name="frm" onsubmit="return(check())">
        <table align="center">
            <tr><td>Enrollment No.</td><td><input type="text" name="enroll"></td></tr>
            <tr><td>First Name</td><td><input type="text" name="first"></td></tr>
            <tr><td>Last Name</td><td><input type="text" name="last"></td></tr>
            <tr><td>Father's Name</td><td><input type="text" name="father"></td></tr>
            <tr><td>Course</td><td><input type="text" name="course"></td></tr>            
            <tr><td><input type="submit" value="Submit"></td></tr>
            <tr><td> <button onclick="window.location.href='admin.jsp'">Home</button></td></tr>
        </table>
        </form>


</html>
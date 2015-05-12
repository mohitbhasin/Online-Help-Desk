
<html>
  <head>
    <title>Login Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body><%@include file="home.jsp" %>
      <script>
    function check()
    {
           if(document.frm.enroll.value=="")
            {
                alert("Enrollment number cannot be blank");
                return false;
            }
             if(document.frm.c.value=="")
            {
                alert("Marks cannot be blank");
                return false;
            } if(document.frm.java.value=="")
            {
                alert("Marks number cannot be blank");
                return false;
            } if(document.frm.maths.value=="")
            {
                alert("Marks number cannot be blank");
                return false;
            } if(document.frm.dbms.value=="")
            {
                alert("Marks number cannot be blank");
                return false;
            }
return true;
    }


</script>


<br><br><br>
      <form action="marks_next.jsp" name="frm" method="get" onsubmit="return check()">
          <p align="center">Enter Enrollment Number</p>
    <table align="center">
    <tr>
        <th>Enrollment Number:</th>
        <th>C</th>
        <th>JAVA</th>
        <TH>MATHS</TH>
        <TH>DBMS</TH>
        </tr>
        <tr>
        <td><input type="text" name="enroll"></td>
        <td><input type="text" name="c"></td>
        <td><input type="text" name="java"></td>
        <td><input type="text" name="maths"></td>
        <td><input type="text" name="dbms"></td>
    </tr><br>



       <tr><td></td><td></td><td align="left">
        <input type="submit" value="Submit" align="center">
           <button onclick="window.location.href='faculty.jsp'">Home</button>
    </td></tr>
    </table>
      </form>
    </body>
</html>

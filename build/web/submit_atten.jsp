
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
             if(document.frm.atten.value=="")
            {
                alert("Attendance cannot be blank");
                return false;
            }
            if(document.frm.atten.value>100)
                {
                    alert("Attendance cannot be more than 100")
                    return false;
                }
        return true;
    }


</script><br><br><br>
      <form action="atten_next.jsp" name="frm" method="get" onsubmit="return check()">
          <p align="center">Submit Attendance</p>
    <table align="center">
    <tr>
        <th>Month</th>
        <th>Enrollment Number:</th>
        <th>Attendance</th>
        <th>Total</th>
        </tr>
        <tr>
            <td><select name="month">                                
               <option>jan</option>
                 <option>feb</option>
                 <option>mar</option>
                 <option>april</option>
                 <option>may</option>
                 <option>june</option>
                 <option>july</option>
                 <option>aug</option>
                 <option>sep</option>
                 <option>oct</option>
                 <option>nov</option>
                 <option>december</option>
            </select></td>
        <td><input type="text" name="enroll"></td>
        <td><input type="text" name="atten"></td>
        <td><input type="text" name="total"></td>
    </tr><br>
       <tr><td></td><tr></tr><td align="right">
       <input type="submit" value="Submit" align=""></td><tr></tr><td align="right">
            <button onclick="window.location.href='faculty.jsp'">Home</button>
    </td></tr>
    </table>
      </form>
    </body>
</html>

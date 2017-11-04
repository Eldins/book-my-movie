<%-- 
    Document   : Theatre-Layout
    Created on : Oct 28, 2017, 2:20:06 PM
    Author     : student60
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <style>
          
 
input[type=checkbox] + label
{
background: #999;
height: 16px;
width: 16px;
display:inline-block;
padding: 0 0 0 0px;
}
input[type=checkbox]:checked + label
{
background: #0080FF;
height: 16px;
width: 16px;
display:inline-block;
padding: 0 0 0 0px;
}
        </style>
            </head>
    <body>
      <%
      for(int i=0;i<10;i++)
      {
          for(int j=0;j<10;j++)
          {
              %>
              <input type="checkbox"  name="seatno"  style="width: 40px;height: 40px;background: whitesmoke;" value-="<%=i%><%=j%>" id="chk<%=i%>+<%=j%>" >
              &nbsp;&nbsp;&nbsp; 
              <%
              if(j==4)
              {
                  %>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%
              }
              %>
        
        <%
          }
%>
<br>
<br>
   <% if(i==6)
   {
   %>
   <br><br><br><br>
   <%    
   }
   }
      
      %>
    </body>
</html>

<%-- 
    Document   : PlaceDetails
    Created on : Aug 7, 2017, 12:13:17 PM
    Author     : student59
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
 
   
<html>
    <head>
        <script src="jquery.min.js" type="text/javascript"></script>
        <script>
        function getDis(v)
        {
        
        $.ajax({url: "ajax_dis.jsp?id="+v, success: function(result){
               //  alert(result);
        $("#dis").html(result);
    }});
        
        }
        
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
  <form>
      <table>
          <tr>
     <td>State</td>
     <td><select name="sel" onchange="getDis(this.value)">
             <option>--select--<option>
             <%
             
             String str="select * from tbl_state";
             ResultSet rs=obj.select(str);
             while(rs.next())
             {             
             %>
             <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
             <%
             }
             %>
             
 </select></tr>
 <tr>
     
      <td>district</td>
     <td><select name="selectdist" id="dis">
              <option>--select--<option>
                     
 </select></td></tr>
 
 </tr>
 
 <tr>
 
 <tr><td>Place name:<input type="text"name="districtname"><br></tr>
 
 
 <tr><td><input type="submit"name="submit"value="submit"</tr>
  </table>
  </form>
    </body>
</html>

<%-- 
    Document   : DistrictDetails
    Created on : Aug 7, 2017, 12:12:55 PM
    Author     : student59
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
 <%
    if(request.getParameter("submit")!=null)
    {
         String districtname=request.getParameter("districtname");
         String stateid=request.getParameter("select");
        String str="insert into tbl_district(district_name,state_id)values('"+districtname+"','"+stateid+"')";
        boolean b=obj.insert(str);
        if(b==true)
            out.print("Success");
        else
            out.print(str);
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <form>
      <table>
          <tr>
     <td>State</td>
     <td><select name="select">
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
 <td>district Name:<input type="text"name="districtname"><br></tr>
 
 <tr><td><input type="submit"name="submit"value="submit"</tr>
      </table>
  </form>
    </body>
</html>

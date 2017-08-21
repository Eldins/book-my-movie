<%-- 
    Document   : StateDetails
    Created on : Aug 7, 2017, 2:35:32 PM
    Author     : student59
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>



  <%
    if(request.getParameter("submit")!=null)
    {
        String name=request.getParameter("statename");
        String str="insert into tbl_state(state_name)values('"+name+"')";
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
 <td>State Name:<input type="text"name="statename"><br></tr>
 <tr><td><input type="submit"name="submit"value="submit"</tr>
      </table>
  </form>
    </body>
</html>

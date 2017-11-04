<%-- 
    Document   : Login
    Created on : Sep 25, 2017, 12:47:06 PM
    Author     : student60
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    
    </head>
    <body>
         
        
        <%

    String username="";
    String password="";
    String msg="";
 
    if(request.getParameter("submit")!=null)
    {       
       username=request.getParameter("txt_username");  
       password=request.getParameter("txt_password");
       
                String selAdmin = "select * from tbl_login where login_username='"+username+"' and login_password='"+password+"' ";
                ResultSet rsAdmin = obj.select(selAdmin);
                
                String selClient = "select * from tbl_userregistration where user_username='"+username+"' and user_password='"+password+"' ";
                ResultSet rsclient = obj.select(selClient);
                
                
                String selTheatre = "select * from tbl_theaterregistration where theater_username='"+username+"' and theater_password='"+password+"' ";
                ResultSet rsTh = obj.select(selTheatre);
                
                
                if(rsAdmin.next())
                {
                            msg="";
                            response.sendRedirect("../Admin/HomePage.jsp");
                   
                }
                
                else if(rsclient.next())
                {
                             msg="";
                             session.setAttribute("uid", rsTh.getString("user_id"));
                             response.sendRedirect("../User/HomePage.jsp");
                   
                }
                 
                else if(rsTh.next())
                {
                            msg="";
                            session.setAttribute("thid", rsTh.getString("theater_id"));
                            response.sendRedirect("../Theatre/HomePage.jsp");
                   
                }
                else
                {
                    msg="Invalid UserName or Password";
                }
                
    }
            %>
            
            
        
        <center>
            <h3>
             LOG IN
            </h3>
        </center>
        <form>
            <table align="center" border="1">
               
                <tr>
                    <td>
                       UserName
                    </td>
                    <td>
                        <input type="text" name="txt_username" >
                    </td>
                </tr>
             <tr>
                    <td>
                      password
                    </td>
                    <td>
                        <input type="password" name="txt_password" >
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit">                
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><%=msg%></td>
                </tr>
            </table>  <br><br>             
        </form>

    

    </body>
</html>



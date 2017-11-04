<%-- 
    Document   : NewUser
    Created on : Sep 25, 2017, 12:46:57 PM
    Author     : student60
--%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookMyMovie::User Registration</title>
    </head>
 <body>
        <center>
            <h3>
                User Registration
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid">
            <table align="center" border="1">    
                 <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>
                     Email
                    </td>
                    <td>
                        <input type="text" name="txt_email">
                    </td>
                </tr>
                 <tr>
                    <td>
                        User Name
                    </td>
                    <td>
                        <input type="text" name="txt_username">
                    </td>
                </tr>
                <tr>
                    <td>
                       Password
                    </td>
                    <td>
                        <input type="password" name="txt_password">
                    </td>
                </tr>
                <tr>
                    <td>
                      Phone
                    </td>
                    <td>
                        <input type="text" name="txt_phone">
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit">                
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
            </table>  <br><br>             
        </form>

                        
<%

    String name="";
    String username="";
    String password="";
    String phone="";
    String email="";
    
     if(request.getParameter("submit")!=null)
    {       
        name=request.getParameter("name"); 
        username=request.getParameter("txt_username");
        password=request.getParameter("txt_password");
        phone=request.getParameter("txt_phone");
        email=request.getParameter("txt_email");
   
            String insert="insert into tbl_userregistration(user_name,user_emailid,user_password,user_phone,user_username) values('"+name+"','"+email+"','"+ password+"','"+phone+"','"+username+"')";  
            out.println(insert);
             boolean b=obj.insert(insert);
              
        //response.sendRedirect("NewUser.jsp"); 
    }
     
    
%> 


       
            
        </table><br><br>
        <center>
            <a href="HomePage.jsp">Home</a> 
        </center>
    </body>
</html>

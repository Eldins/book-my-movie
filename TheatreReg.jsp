<%-- 
    Document   : TheatreReg
    Created on : Sep 25, 2017, 12:46:47 PM
    Author     : student60
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookMyMovie::Theater Registration</title>
    </head>
 <body>
        <center>
            <h3>
                Theater Registration
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid">
            <table align="center" border="1">    
                 <tr>
                    <td>
                        Theater Name
                    </td>
                    <td>
                        <input type="text" name="theater_name">
                    </td>
                </tr>
                <tr>
                    <td>
                        Place Name
                    </td>
                    <td>
                        <select name="ddlplace">
                            <option>----SELECT----</option>
                            
                                <%
                                    String selects = "select * from tbl_place"; 
                                    ResultSet rs2=obj.select(selects);
                                    while(rs2.next())
                                    {
                                %>
                                        <option value="<%=rs2.getString("place_id")%>"><%=rs2.getString("place_name")%></option>
                                         <%
                                        }
                                        %> 
                                
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                       Theater Class
                    </td>
                    <td>
                       <select name="ddltheaterclass">
                            <option>----SELECT----</option>
                            
                                <%
                                    String select = "select * from tbl_theaterclass"; 
                                    ResultSet rs3=obj.select(select);
                                    while(rs3.next())
                                    {
                                %>
                                        <option value="<%=rs3.getString("theaterclass_id")%>"
                                        
                                  
                                        >
                                        <%=rs3.getString("theaterclass_name")%>
                                        </option>
                      
                                         <%
                                     }
                                        %> 
                                </select> 
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
                    <td>
                     Email
                    </td>
                    <td>
                        <input type="text" name="txt_email">
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

    String theatername="";
    String place="";
    String theaterclass="";
    String username="";
    String password="";
    String phone="";
    String email="";
     if(request.getParameter("submit")!=null)
    {       
        theatername=request.getParameter("theater_name"); 
        place=request.getParameter("ddlplace"); 
        theaterclass=request.getParameter("ddltheaterclass");
        username=request.getParameter("txt_username");
        password=request.getParameter("txt_password");
        phone=request.getParameter("txt_phone");
        email=request.getParameter("txt_email");
   
            String insert="insert into tbl_theaterregistration(theater_name,place_id,theaterclass_id,theater_username,theater_password,theater_contact,theater_email) values('"+theatername+"',"+place+","+theaterclass+",'"+username+"','"+password+"','"+phone+"','"+email+"')";  
            //out.println(insert);
            boolean b=obj.insert(insert);
              
        response.sendRedirect("TheatreReg.jsp"); 
    }
     
    
%> 


       
            
        </table><br><br>
        <center>
            <a href="HomePage.jsp">Home</a> 
        </center>
    </body>
</html>
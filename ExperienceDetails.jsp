<%-- 
    Document   : District
    C on : Jul 10, 2017, 11:57:00 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj">
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookMyMovie::DistrictDetails</title>
    </head>
    
    
    <%
        
        String distid="";
        String distname="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_experience where experience_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                distid=rs1.getString("experience_id");
                distname=rs1.getString("experience_name");
            }
        }
       if(request.getParameter("delID")!=null)
       {
            String delete = "delete from tbl_experience where experience_id='"+request.getParameter("delID")+"' ";
           obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
               Experience Details
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=distid%>">
                <tr>
                    <td>
                        Experience name
                    </td>
                    <td>
                        <input type="text" name="txt_district" value="<%=distname%>" required="">
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

    String district="";
    String editID="";
    if(request.getParameter("submit")!=null)
    {       
        district=request.getParameter("txt_district");  
        editID=request.getParameter("hid");
        out.print(editID);
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_experience set experience_name='"+district+"' where experience_id='"+editID+"'";
            //out.print(update);
            boolean b=obj.insert(update);
            //out.println(b);
        }
        else
        {
            String inse="insert into tbl_experience(experience_name) values('"+district+"')";          
            boolean b=obj.insert(inse);
        }       
        //response.sendRedirect("ExperienceDetails.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>District</th>
            
            
            <%
    
                String did;               
                String sel = "select * from tbl_experience";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("experience_name")%>
                </td>
                <td>
                    <a href="ExperienceDetails.jsp?id=<%=rs.getString("experience_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="ExperienceDetails.jsp?delID=<%=rs.getString("experience_id")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
                </td>
            </tr>
            
            
            <%
            
                }
                
            %>
            
            
        </table><br><br>
        <center>
            <a href="HomePage.jsp">Home</a> 
        </center>
    </body>
</html>
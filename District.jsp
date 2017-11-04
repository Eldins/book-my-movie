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
            String sel = "select * from tbl_district where district_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                distid=rs1.getString("district_id");
                distname=rs1.getString("district_name");
            }
        }
        if(request.getParameter("dname")!=null)
        {
            String delete = "delete from tbl_district where district_name='"+request.getParameter("dname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                DistrictDetails
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=distid%>">
                <tr>
                    <td>
                        DistrictName
                    </td>
                    <td>
                        <input type="text" name="txt_district" pattern="[a-zA-Z]"value="<%=distname%>" required="" >
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
    
    if(request.getParameter("submit")!=null)
    {       
        district=request.getParameter("txt_district");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_district set district_name='"+district+"' where district_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_district(district_name) values('"+district+"')";          
            boolean b=obj.insert(inse);
        }       
        response.sendRedirect("District.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>District</th>
            
            
            <%
    
                String did;               
                String sel = "select * from tbl_district";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("district_name")%>
                </td>
                <td>
                    <a href="District.jsp?id=<%=rs.getString("district_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="District.jsp?dname=<%=rs.getString("district_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
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
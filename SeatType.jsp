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
        <title>BookMyMovie::SeatType Details</title>
    </head>
    
    
    <%
        
        String seatid="";
        String seatname="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_seattype where seattype_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                seatid=rs1.getString("seattype_id");
                seatname=rs1.getString("seattype_name");
            }
        }
        if(request.getParameter("sname")!=null)
        {
            String delete = "delete from tbl_seattype where seattype_name='"+request.getParameter("sname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
               SeatType Details
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=seatid%>">
                <tr>
                    <td>
                       SeatName
                    </td>
                    <td>
                        <input type="text" name="txt_seattype" value="<%=seatname%>" required="">
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

    String seattype="";
    
    if(request.getParameter("submit")!=null)
    {       
        seattype=request.getParameter("txt_seattype");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_seattype set seattype_name='"+seattype+"' where seattype_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_seattype(seattype_name) values('"+seattype+"')";          
            boolean b=obj.insert(inse);
        }       
        response.sendRedirect("SeatType.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>SeatType</th>
            
            
            <%
    
                String sid;               
                String sel = "select * from tbl_seattype";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("seattype_name")%>
                </td>
                <td>
                    <a href="SeatType.jsp?id=<%=rs.getString("seattype_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="SeatType.jsp?sname=<%=rs.getString("seattype_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
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
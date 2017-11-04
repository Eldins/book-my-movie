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
        <title>BookMyMovie::TheatreClass Details</title>
    </head>
    
    
    <%
        
        String thid="";
        String thname="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_theaterclass where theaterclass_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                thid=rs1.getString("theaterclass_id");
                thname=rs1.getString("theaterclass_name");
            }
        }
        if(request.getParameter("tname")!=null)
        {
            String delete = "delete from tbl_theaterclass where theaterclass_name='"+request.getParameter("tname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                TehaterclassDetails
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=thid%>">
                <tr>
                    <td>
                        TheaterclassName
                    </td>
                    <td>
                        <input type="text" name="txt_theaterclass" value="<%=thname%>" required="">
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

    String theaterclass="";
    
    if(request.getParameter("submit")!=null)
    {       
        theaterclass=request.getParameter("txt_theaterclass");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_theaterclass set theaterclass_name='"+theaterclass+"' where theaterclass_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_theaterclass(theaterclass_name) values('"+theaterclass+"')";          
            boolean b=obj.insert(inse);
        }       
        response.sendRedirect("TheatreClass.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>District</th>
            
            
            <%
    
                String tid;               
                String sel = "select * from tbl_theaterclass";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("theaterclass_name")%>
                </td>
                <td>
                    <a href="TheatreClass.jsp?id=<%=rs.getString("theaterclass_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="TheatreClass.jsp?tname=<%=rs.getString("theaterclass_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
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
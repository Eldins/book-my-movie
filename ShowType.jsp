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
        <title>BookMyMovie::ShowTypeDetails</title>
    </head>
    
    
    <%
        
        String showid="";
        String showname="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_showtype where showtype_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                showid=rs1.getString("showtype_id");
                showname=rs1.getString("showtype_name");
            }
        }
        if(request.getParameter("sname")!=null)
        {
            String delete = "delete from tbl_showtype where showtype_name='"+request.getParameter("sname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
             ShowType Details
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=showid%>">
                <tr>
                    <td>
                        ShowType Name
                    </td>
                    <td>
                        <input type="text" name="txt_showtype" value="<%=showname%>" required="">
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

    String showtype="";
 
    if(request.getParameter("submit")!=null)
    {       
       showtype=request.getParameter("txt_showtype");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_showtype set showtype_name='"+showtype+"' where showtype_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_showtype(showtype_name) values('"+showtype+"')";          
            boolean b=obj.insert(inse);
        }       
        response.sendRedirect("ShowType.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>ShowType</th>
            
            
            <%
    
                String sid;               
                String sel = "select * from tbl_showtype";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("showtype_name")%>
                </td>
                <td>
                    <a href="ShowType.jsp?id=<%=rs.getString("showtype_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="ShowType.jsp?sname=<%=rs.getString("showtype_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
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
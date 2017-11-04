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
        <title>BookMyMovie::FilmLanguage</title>
    </head>
    
    
    <%
        
        String langid="";
        String langname="";
        
        if(request.getParameter("id")!=null)
        { 
            String sel = "select * from tbl_language where language_id='"+request.getParameter("id")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                langid=rs1.getString("language_id");
                langname=rs1.getString("language_name");
            }
        }
        if(request.getParameter("lname")!=null)
        {
            String delete = "delete from tbl_language where language_name='"+request.getParameter("lname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
               Language Details
            </h3>
        </center>
        <form>
            <table align="center" border="1">
                <input type="hidden" name="hid" value="<%=langid%>">
                <tr>
                    <td>
                       Language Name
                    </td>
                    <td>
                        <input type="text" name="txt_language" value="<%=langname%>" required="">
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

    String language="";
    
    if(request.getParameter("submit")!=null)
    {       
        language=request.getParameter("txt_language");  
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_language set language_name='"+language+"' where language_id='"+request.getParameter("hid")+"' ";
            boolean b=obj.insert(update);
        }
        else
        {
            String inse="insert into tbl_language(language_name) values('"+language+"')";          
            boolean b=obj.insert(inse);
        }       
        response.sendRedirect("FilmLanguage.jsp"); 
    } 
    
%>


        <table align="center" border="1">
            <th>District</th>
            
            
            <%
    
                String lid;               
                String sel = "select * from tbl_language";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
           
            
            <tr>
                <td>
                    <%=rs.getString("language_name")%>
                </td>
                <td>
                    <a href="FilmLanguage.jsp?id=<%=rs.getString("language_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>                   
                </td> 
                <td>
                    <a href="FilmLanguage.jsp?lname=<%=rs.getString("language_name")%>"><img src="Icon/Delete.png" width="40" height="25"></a>
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
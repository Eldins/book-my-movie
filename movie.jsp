<%-- 
    Document   : movie
    Created on : Oct 23, 2017, 2:49:07 PM
    Author     : student60
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj">
</jsp:useBean>
<%
    String name="",language="",description="",cid="";
   
       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  
    
    <body>
        <center>
            <h3>
                Movie Entry
            </h3>
        </center>
    <form action="UploadAction_movie.jsp" enctype="multipart/form-data" method="post">
            <table align="center" border="1">
               
                <tr>
                    <td>
                        Movie Name
                    </td>
                    <td>
                        <input type="text" name="txt_movie" value="<%=name%>"  required="">
                    </td>
                </tr>
               <tr>
                    <td>
                        release Date
                    </td>
                    <td>
                        <input type="date" name="txt_releasedate" value="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Language
                    </td>
                    <td>
                        <select name="laguageselect" required="">
                            <option value="">..Select..</option>
                            <%
                                ResultSet rslanguage=obj.select("select * from tbl_language");
                                while(rslanguage.next())
                                {
                                    
                                
                                %>
                                <option value="<%=rslanguage.getString("language_id")%>" <% if(language.equals(rslanguage.getString("language_id"))){%> selected="true" <%}%>>
                                    
                                    
                                    
                                    <%=rslanguage.getString("language_name")%></option>
                                <%
                                    }
                                    %>
                        </select>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        movie_description
                    </td>
                    <td>
                        <textarea name="txt_description" value="<%=description%>" maxlength="150"></textarea>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        movie poster
                    </td>
                    <td>
                        <input type="file" name="image" > 
                   </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit">                
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
            </table>  <br><br>             
       




<th>Movie</th>
        <table align="center" border="1"><tr>
            
            
            <th>
                    Movie Name
                </th>
                <th>
                    language
                </th>
                <th>
                    releasing date
                </th>
                <th>
                    Description
                </th>
                <th>
                  Poster
                </th>
                <th>
                    Delete
                </th>
                
                
            </tr>
            <%
    
              
                ResultSet rs = obj.select("select * from tbl_movie mov,tbl_language ll where mov.language_id=ll.language_id");
                while(rs.next())
                {
                    
            %>
            <tr>
                
            
            <tr>
                <td>
                    <%=rs.getString("movie_name")%>
                </td>
                <td>
                       <%=rs.getString("language_name")%>               
                </td> 
                <td>
                     <%=rs.getString("realesing_date")%>
                </td>
                <td>
                   <%=rs.getString("movie_description")%> 
                </td>
                <td>
                    <img src="Posters/<%=rs.getString("movie_poster")%>" height="100px" width="100px">
                </td>
                <td>
                    <a href="movie.jsp?delete=<%=rs.getString("movie_id")%>"><img src="Icon/Delete.png" width="40" height="30"></a>   
                </td>
            </tr>
            
            
            <%
            
                }
                
            %>
            
            
        </table><br><br>
        <center>
            <a href="HomePage.jsp">Home</a> 
        </center> 
         </form>
    </body>
</html>


<%
    

        
     if(request.getParameter("delete")!=null)
        {
      
            String delete = "delete from tbl_movie  where movie_id='"+request.getParameter("delete")+"' ";
         Boolean bb=obj.insert(delete);
         if(bb)
         {
         response.sendRedirect("movie.jsp"); 
         }
        }
    %>
    
    
  <%

  
          
 
     
%>

   
<%-- 
    Document   : ShowTime
    Created on : Oct 23, 2017, 11:17:17 AM
    Author     : student60
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj">
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       
    <%
        
        String showtype="";
        String showtimeid="";
        String theatrename="";
        String movie="";
        String showtime="";
        
        if(request.getParameter("pid")!=null)
        { 
            String sel = "select * from tbl_showtime where showtime_id='"+request.getParameter("pid")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {  showtimeid=rs1.getString("showtime_id");
               showtype=rs1.getString("showtype_id");
                showtime=rs1.getString("showtime_time");
                theatrename=rs1.getString("theater_id");
                movie=rs1.getString("movie_id");
            }
        }
        if(request.getParameter("pname")!=null)
        {
            String delete = "delete from tbl_showtime where showtime_id='"+request.getParameter("pname")+"'";
            obj.insert(delete);
        }
        
    %>
    <body>
     <center>
            <h3>
               Showtime
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid" value="<%=showtimeid%>" >
            <table align="center" border="1">                
                <tr>
                    <td>
                       Show Type
                    </td>
                    <td>
                        <select name="ddlshowtype">
                            <option>----SELECT----</option>
                            
                                <%
                                    String selects = "select * from tbl_showtype"; 
                                    ResultSet rs2=obj.select(selects);
                                    while(rs2.next())
                                    {
                                %>
                                        <option value="<%=rs2.getString("showtype_id")%>"
                                        <%
                                        if (showtype.equalsIgnoreCase(rs2.getString("showtype_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs2.getString("showtype_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        ShowTime
                    </td>
                    <td>
                        <input type="time" name="txt_place" value="<%= showtime%>" required="">
                    </td>
                </tr>
                         
                  <tr>
                    <td>
                      Movie
                    </td>
                    <td>
                         <select name="ddlmovie">
                            <option>----SELECT----</option>
                            
                                <%
                                    String select = "select * from tbl_movie"; 
                                    ResultSet rs=obj.select(select);
                                    while(rs.next())
                                    {
                                %>
                                        <option value="<%=rs.getString("movie_id")%>"
                                        <%
                                        if (movie.equalsIgnoreCase(rs.getString("movie_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs.getString("movie_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                        </select>
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

    String show="";
    String time="";
    String mov="";

     
    
    if(request.getParameter("submit")!=null)
    {       
        show=request.getParameter("ddlshowtype");  
        time=request.getParameter("txt_place");
        mov=request.getParameter("ddlmovie");
        String theatre_name=session.getAttribute("thid").toString();
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_showtime set showtime_time='"+time+"',movie_id="+mov+" where showtime_id='"+request.getParameter("hid")+"'";
            boolean b=obj.insert(update);
        }
        else
        {
            String insert="insert into tbl_showtime(showtype_id,showtime_time,theater_id,movie_id)values("+show+",'"+time+"',"+theatre_name+","+mov+")";  
            out.println(insert);
            boolean b=obj.insert(insert);
        }       
        response.sendRedirect("ShowTime.jsp"); 
    }  
    
%> 


        <table align="center" border="1">
            <tr>               
                <td>
                    ShowType
                </td>
                <td>
                   Showtime
                </td>
                <td>
                   TheatreName
                </td>
                 <td>
                   MovieName
                </td>
            </tr>
           
            
            <%    
    
                String sel ="select * from tbl_showtime d,tbl_showtype p,tbl_theaterregistration c,tbl_movie m where d.movie_id=m.movie_id and d.showtype_id=p.showtype_id and d.theater_id=c.theater_id";
                ResultSet rs3 = obj.select(sel);
                while(rs3.next())
                {
                    
            %>
            
            
            <tr>
                <td>
                    <%=rs3.getString("showtype_name")%>
                </td>
                <td>
                    <%=rs3.getString("showtime_time")%>
                </td>
                 <td>
                    <%=rs3.getString("theater_name")%>
                </td>
                 <td>
                    <%=rs3.getString("movie_name")%>
                </td>
                 
                <td>
                    <a href="ShowTime.jsp?pid=<%=rs3.getString("showtime_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>
                </td> 
                <td>
                    <a href="ShowTime.jsp?pname=<%=rs3.getString("showtime_id")%>"><img src="Icon/Delete.png" width="40" height="30"></a>
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

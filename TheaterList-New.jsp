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
        <title>BookMyMovie::TheatreList</title>
    </head>

    
    <%
        
        if(request.getParameter("ac")!=null)
        { 

            String upQry = "update tbl_theaterregistration set theater_status='1' where theater_id='"+request.getParameter("ac")+"' ";
            obj.insert(upQry);
        }
        

    if(request.getParameter("rej")!=null)
        { 

            String upQry = "update tbl_theaterregistration set theater_status='2' where theater_id='"+request.getParameter("rej")+"' ";
            obj.insert(upQry);
        }
        
        
    %>
    
    
    <body>
       
       

                        
<%

  
    
%> 


        <table align="center" border="1">
            <tr>               
                <td>
                    TheaterName
                </td>
                  <td>
                DistrictName
                </td>
                <td>
                    PlaceName
                </td>
                <td>
                  TheaterClass
                </td>
               <td>
                  ContactNo
                </td>
                 <td>
                  Email
                </td>
                
                
            </tr>
           
            
            <%    
    
                String sel = "select * from tbl_theaterregistration d,tbl_place p,tbl_theaterclass t,tbl_district c where d.place_id=p.place_id and t.theaterclass_id=d.theaterclass_id and c.district_id = p.district_id and theater_status='0'";
 
                //String sel1 = "select * from tbl_theaterregistration d,tbl_theaterclass p where d.theaterclass_id=p.theaterclass_id";
                ResultSet rs = obj.select(sel);
               // ResultSet rs1 = obj.select(sel1);
                while(rs.next())
                {
                    
            %>
            
            
            <tr>
                <td>
                    <%=rs.getString("theater_name")%>
                </td>
                <td>
                     <%=rs.getString("district_name")%>
                </td>
                <td>
                    <%=rs.getString("place_name")%>
                </td>
                <td>
                     <%=rs.getString("theaterclass_name")%>
                </td>
                     <td>
                     <%=rs.getString("theater_contact")%>
                </td>
                   <td>
                     <%=rs.getString("theater_email")%>
                </td>
                
                
             
                <td>
                    <a href="TheaterList-New.jsp?ac=<%=rs.getString("theater_id")%>">Accept</a>                   
                </td> 
                <td>
                    <a href="TheaterList-New.jsp?rej=<%=rs.getString("theater_id")%>">Reject</a>
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
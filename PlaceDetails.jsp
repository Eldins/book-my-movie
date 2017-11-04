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
        <title>BookMyMovie::PlaceDetails</title>
    </head>

    
    <%
        
        String placeid="";
        String placename="";
        String district="";
        
        if(request.getParameter("pid")!=null)
        { 
            String sel = "select * from tbl_place where place_id='"+request.getParameter("pid")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                placeid=rs1.getString("place_id");
                placename=rs1.getString("place_name");
                district=rs1.getString("district_id");
            }
        }
        if(request.getParameter("pname")!=null)
        {
            String delete = "delete from tbl_place where place_name='"+request.getParameter("pname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                PlaceDetails
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid" value="<%=placeid%>" >
            <table align="center" border="1">                
                <tr>
                    <td>
                        DistrictName
                    </td>
                    <td>
                        <select name="ddlDistrict">
                            <option>----SELECT----</option>
                            
                                <%
                                    String selects = "select * from tbl_district"; 
                                    ResultSet rs2=obj.select(selects);
                                    while(rs2.next())
                                    {
                                %>
                                        <option value="<%=rs2.getString("district_id")%>"
                                        <%
                                        if (district.equalsIgnoreCase(rs2.getString("district_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs2.getString("district_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        PlaceName
                    </td>
                    <td>
                        <input type="text" name="txt_place" value="<%=placename%>" required="">
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

    String place="";
    String districtname="";
    
    if(request.getParameter("submit")!=null)
    {       
        place=request.getParameter("txt_place");  
        districtname=request.getParameter("ddlDistrict");
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_place set place_name='"+place+"' where place_id='"+request.getParameter("hid")+"'";
            boolean b=obj.insert(update);
        }
        else
        {
            String insert="insert into tbl_place(place_name,district_id) values('"+place+"','"+districtname+"')";  
            //out.println(insert);
            boolean b=obj.insert(insert);
        }       
        response.sendRedirect("PlaceDetails.jsp"); 
    }  
    
%> 


        <table align="center" border="1">
            <tr>               
                <td>
                    District
                </td>
                <td>
                    Place
                </td>
            </tr>
           
            
            <%    
    
                String sel = "select * from tbl_district d,tbl_place p where d.district_id=p.district_id";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
            
            
            <tr>
                <td>
                    <%=rs.getString("district_name")%>
                </td>
                <td>
                    <%=rs.getString("place_name")%>
                </td>
                <td>
                    <a href="PlaceDetails.jsp?pid=<%=rs.getString("place_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>
                </td> 
                <td>
                    <a href="PlaceDetails.jsp?pname=<%=rs.getString("place_name")%>"><img src="Icon/Delete.png" width="40" height="30"></a>
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
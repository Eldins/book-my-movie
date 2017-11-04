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
        
        String rateid="";
        String rate="";
        String seattype="";
        
        if(request.getParameter("pid")!=null)
        { 
            String sel = "select * from tbl_rate where rate_id='"+request.getParameter("pid")+"' ";
            ResultSet rs1 = obj.select(sel);
            while(rs1.next())
            {
                rateid=rs1.getString("rate_id");
                rate=rs1.getString("rate");
                seattype=rs1.getString("seattype_id");
            }
        }
        if(request.getParameter("pname")!=null)
        {
            String delete = "delete from tbl_rate where rate_id='"+request.getParameter("pname")+"' ";
            obj.insert(delete);
        }
        
    %>
    
    
    <body>
        <center>
            <h3>
                Rate
            </h3>
        </center>
        <form>
            <input type="hidden" name="hid" value="<%=rateid%>" >
            <table align="center" border="1">                
                <tr>
                    <td>
                        seattype
                    </td>
                    <td>
                        <select name="ddlseattype">
                            <option>----SELECT----</option>
                            
                                <%
                                    String selects = "select * from tbl_seattype"; 
                                    ResultSet rs2=obj.select(selects);
                                    while(rs2.next())
                                    {
                                %>
                                        <option value="<%=rs2.getString("seattype_id")%>"
                                        <%
                                        if (seattype.equalsIgnoreCase(rs2.getString("seattype_id")))
                                        {
                                        %>
                                            selected="selected" 
                                         <%
                                        }
                                        %> 
                                        >
                                        <%=rs2.getString("seattype_name")%>
                                        </option>
                                <%
                                    }
                                %> 
                                
                                
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Rate
                    </td>
                    <td>
                        <input type="text" name="txt_rate" value="<%=rate%>" required="">
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

    String rate1="";
    String seattype1="";
    
    
    if(request.getParameter("submit")!=null)
    {       
        rate1=request.getParameter("txt_rate");  
        seattype1=request.getParameter("ddlseattype");
        String theatre_name=session.getAttribute("thid").toString();
        
        if(request.getParameter("hid")!="")
        {
            String update = "update tbl_rate set seattype_id="+seattype1+",rate="+rate1+" where rate_id='"+request.getParameter("hid")+"'";
            boolean b=obj.insert(update);
        }
        else
        {
            String insert="insert into tbl_rate(seattype_id,rate,theater_id) values("+seattype1+","+rate1+","+theatre_name+")";  
            //out.println(insert);
            boolean b=obj.insert(insert);
        }       
        response.sendRedirect("rate.jsp"); 
    }  
    
%> 

  <table align="center" border="1">
            <tr>               
                <td>
                   Seattype
                </td>
                <td>
                  rate
                </td>
            </tr>
           
            
            <%    
    
                String sel = "select * from tbl_rate r,tbl_seattype s where r.seattype_id=s.seattype_id";
                ResultSet rs = obj.select(sel);
                while(rs.next())
                {
                    
            %>
            
            
            <tr>
                <td>
                    <%=rs.getString("seattype_name")%>
                </td>
                <td>
                    <%=rs.getString("rate")%>
                </td>
                <td>
                    <a href="rate.jsp?pid=<%=rs.getString("rate_id")%>"><img src="Icon/Edit.jpg" width="40" height="30"></a>
                </td> 
                <td>
                    <a href="rate.jsp?pname=<%=rs.getString("rate_id")%>"><img src="Icon/Delete.png" width="40" height="30"></a>
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
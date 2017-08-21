<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="MyPackage.dbConnection" id="obj"></jsp:useBean>
<%

String sid=request.getParameter("id");
 String str="select * from tbl_district where state_id="+sid;
             ResultSet rs=obj.select(str);
             while(rs.next())
             {             
             %>
             <option value="<%=rs.getString("district_id")%>" ><%=rs.getString("district_name")%></option>
             <%
             }
             %>
          
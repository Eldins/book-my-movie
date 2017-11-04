<%-- 
    Document   : uploadaction.jsp
    Created on : 8 Sep, 2016, 10:29:12 AM
    Author     : ANOOP
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean id="obj"  class="MyPackage.dbConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String field_name="";
            FileItem f_item=null;
            String file_name="";
            File savedFile=null;
            String fn="";
            String e = "";

            String field[] = new String[20];
            String value[]=new String[20];

//checking if request cotains multipart data
            boolean isMultipart=ServletFileUpload.isMultipartContent(request);

            if(isMultipart)
            {
                FileItemFactory factory=new DiskFileItemFactory();
                ServletFileUpload upload=new ServletFileUpload(factory);

//declaring a list of form fields
                
                List items_list=null;

//assigning fields to list 'items_list'
                try
                {
                    items_list=upload.parseRequest(request);
                }
                catch(FileUploadException ex)
                {
                    out.println(ex);
                }

//declaring iterator
                Iterator itr=items_list.iterator();
                int k=0;
//iterating through the list 'items_list'
                while(itr.hasNext())
                {
//typecasting next element in items_list as fileitem
                    f_item=(FileItem)itr.next();

//checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if(f_item.isFormField())
                    {
          
//getting fieldname and value
                        field[k]=f_item.getFieldName();
                        value[k]=f_item.getString();
                        System.out.println(k+" "+field[k]+" "+value[k]);
                        k++;
                    }
                    else
                    {
//f_item=(FileItem)itr.next();
           
                        file_name=f_item.getName();
                        field_name=f_item.getFieldName();
//System.out.println("file "+file_name);
//if(file_name!=null && !file_name.equals("")){
           
                        if(field_name.equals("image"))
                        {
                            System.out.println(field_name);
                            String ext=file_name.substring(file_name.lastIndexOf("."));
//setting path to store image
                            File proj_path=new File(config.getServletContext().getRealPath("/"));
                            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Admin\\Posters\\";
                            Random r=new Random();
                            int r_num=r.nextInt(1111)+999;
                            fn="IMG_"+r_num+ext;
                            System.out.println(fn);
//creating a file object
                            savedFile=new File(file_path+fn);
                            try
                            {
//writing the file object
                                f_item.write(savedFile);               
                
                            }
                            catch(Exception ex)
                            {
                                out.println(ex);
                            }
                        }
//}
   
                    }
           
                }
       
/*  //Strinh str1="insert into tbl_user ()";
String ins="";
if(value[4].equals("")){
ins="insert into tbl_subject(syllabus,subject_name,dept_id,course_id,semester_id) values('"+fn+"','"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"')";
}
else if(fn!=null&& !fn.equals("")){
ins="update tbl_subject set subject_name='"+value[0]+"',dept_id='"+value[1]+"',course_id='"+value[2]+"',semester_id='"+value[3]+"',syllabus='"+fn+"' where subject_id='"+value[4]+"'";
}
else{
ins="update tbl_subject set subject_name='"+value[0]+"',dept_id='"+value[1]+"',course_id='"+value[2]+"',semester_id='"+value[3]+"' where subject_id='"+value[4]+"'";
}
*/
 
// Main m = new Main();
// m.writeBlob(1, savedFile+"");
                e = value[0];
//System.out.println("eeee : "+e); 
          
                    String ins = "insert into tbl_movie(movie_name,language_id,realesing_date,movie_description,movie_poster,movie_status)values('"+value[0]+"','"+value[2]+"','"+value[1]+"','"+value[3]+"','"+fn+"',0)";
                    System.out.println(ins);
   
                    boolean b1=obj.insert(ins);
                    out.println(ins);
                    out.println(b1);

                    if(b1==true)
                    {
                    %> 
                        <script type="text/javascript">
                        alert("Upload Successfully..");
                        setTimeout(function(){window.location.href='movie.jsp'},100);
                        </script>
                    <%
                    }
                
            }   

                    %>
    </body>
</html>

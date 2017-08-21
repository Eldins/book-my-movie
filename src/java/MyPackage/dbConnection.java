/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author student59
 */
public class dbConnection {
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;

    public dbConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_eldinproject", "root", "");
        }
        catch(SQLException ex)
        {
             System.out.println(ex);
        }
    }
    public boolean insert(String selq)
    {
        boolean b=false;
        try{
        st=con.createStatement();
        st.executeUpdate(selq);
        b=true;
        
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return b;
    }
    public ResultSet select(String sel)
    {
          try{
        st=con.createStatement();
        rs=st.executeQuery(sel);
       
        
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return rs;
    }
}

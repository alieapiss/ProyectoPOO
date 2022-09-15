/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Otros;

import Conexion.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Ali
 */
public class Conexion 
{
    private static String Driver    = "com.mysql.jdbc.Driver";
    private static String Usuario   = "root";
    private static String Password  = "";
    private static String Url       = "jdbc:mysql://localhost:3306/dbsistemaacademico";
    
    static 
    {
        try 
        {
            Class.forName(Driver);
        } 
        catch (ClassNotFoundException e) 
        {
            JOptionPane.showMessageDialog(null,"Error en el Driver" + e);
        }
    }
    
    public Connection getConnection()
    {
        Connection con = null;
        try 
        {
            con = DriverManager.getConnection(Url, Usuario,Password);
            JOptionPane.showMessageDialog(null,"Conexion Exitosa");
        } 
        catch (SQLException e) 
        {
            JOptionPane.showMessageDialog(null,"Error en la Conexion" + e);
        }
        return con;
    }
    
}

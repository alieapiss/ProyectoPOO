/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Ali
 */
public class MainConexionSQLSever 
{
    public Connection Conexcion() 
    {
        Connection cn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-I15LSR0\\SQLEXPRESS:1433;DataBaseName=dbsistemaacademico", "sa", "123");
            JOptionPane.showMessageDialog(null, "Conexion Exitosa");
        } catch (ClassNotFoundException | SQLException e) {
        }
        return cn;
    }
    public static void main(String[] args) 
    {
        MainConexionSQLSever csql = new MainConexionSQLSever();
        csql.Conexcion();
    }
    
}

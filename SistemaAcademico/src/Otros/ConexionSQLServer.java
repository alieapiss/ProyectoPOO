/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Otros;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Ali
 */
public class ConexionSQLServer 
{
//        public Connection Conexcion() 
//    {
//        Connection cn = null;
//        try {
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            cn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-I15LSR0\\SQLEXPRESS:1433;DataBaseName=dbsistemaacademico", "sa", "123");
//            JOptionPane.showMessageDialog(null, "Conexion Exitosa");
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return cn;
//    }

    /****************** sale error con este metodo **********************/
//Connection conectar = null;
//String usuario = "sa";
//String contraseña = "123";
//String bd = "dbsistemaacademico";
//String ip =  "localhost";
//String puerto = "1433";
//
//String cadena = "jdbc:sqlserver://"+ip+":"+puerto+"/"+bd;
//        
//        
//public Connection Conexcion()
//{
//    try 
//    {
//        String cadena = " jdbc:sqlserver://localhost: "+puerto+" : "+"DataBase = "+bd;
//        conectar = DriverManager.getConnection(cadena, usuario, contraseña);
//        JOptionPane.showMessageDialog(null, " Se conecto correctamente a la Base de Datos");
//    } catch (Exception e) 
//    {
//        JOptionPane.showMessageDialog(null, " Error al conectar la base de datos, error: " + e.toString());
//    }
//    return conectar;
//}

    
}

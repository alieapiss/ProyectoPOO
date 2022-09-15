/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Otros;

import Conexion.*;

/**
 *
 * @author Ali
 */
public class MainConexcionMYSQL 
{
    public static void main(String[] args) 
    {
        Conexion c = new Conexion();
        c.getConnection();
    }
    
}

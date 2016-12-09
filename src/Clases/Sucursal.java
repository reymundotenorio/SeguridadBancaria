/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

import java.sql.CallableStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Reymundo Tenorio
 */
public class Sucursal {
   
    
    public static void Agregar_Sucursal(int IDBanco, String Nombre, String Domicilio, int NoEmpleados){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[NSUCURSAL] (?,?,?,?)}");

        consulta.setInt(1, IDBanco);
        consulta.setString(2,Nombre);
        consulta.setString(3, Domicilio);
        consulta.setInt(4, NoEmpleados);
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Sucursal Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Sucursal(int ID, int IDBanco, String Nombre, String Domicilio, int NoEmpleados){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[USucursal] (?,?,?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setInt(2, IDBanco);
        consulta.setString(3,Nombre);
        consulta.setString(4, Domicilio);
        consulta.setInt(5, NoEmpleados);
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Sucursal Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Sucursal(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[ESucursal] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Sucursal Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    


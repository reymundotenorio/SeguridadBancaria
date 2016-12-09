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
public class Cuartel {
   
    
    public static void Agregar_Cuartel(String Nombre, String Direccion ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[Agregar_Cuartel] (?,?)}");

        consulta.setString(1, Nombre);
        consulta.setString(2, Direccion);
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuartel Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Cuartel(int ID, String Nombre, String Direccion ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Actualizar_Cuartel] (?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Nombre);
        consulta.setString(3, Direccion);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuartel Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Cuartel(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Eliminar_Cuartel] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuartel Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    


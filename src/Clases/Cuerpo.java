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
public class Cuerpo {
   
    
    public static void Agregar_Cuerpo(String Denominacion){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Agregar_Cuerpo] (?)}");

        consulta.setString(1, Denominacion);
       
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuerpo Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Cuerpo(int ID, String Denominacion ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[Actualizar_Cuerpo] (?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Denominacion);
  
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuerpo Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Cuerpo(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Eliminar_Cuerpo] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Cuerpo Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    


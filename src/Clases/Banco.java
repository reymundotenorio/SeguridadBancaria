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
public class Banco {
   
    
    public static void Agregar_Banco(String Nombre, String Direccion){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[NBANCO] (?,?)}");

        consulta.setString(1, Nombre);
        consulta.setString(2, Direccion);
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Banco Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Banco(int ID, String Nombre, String Direccion ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[UBANCO] (?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Nombre);
        consulta.setString(3, Direccion);

        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Banco Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Desactivar_Banco(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[EBANCO] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Banco Desactivado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
        
        public static void Activar_Banco(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[ABANCO] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Banco Activado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    


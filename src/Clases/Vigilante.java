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
public class Vigilante {
     
    public static void Agregar_Vigilante(String Nombre1, String Nombre2, 
            String Apellido1, String Apellido2, String Cedula, char Sexo){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[NVIGILANTE] (?,?,?,?,?,?)}");

        consulta.setString(1, Nombre1 );
        consulta.setString(2, Nombre2);
        consulta.setString(3, Apellido1);
        consulta.setString(4, Apellido2);
        consulta.setString(5, Cedula);
        consulta.setString(6, String.valueOf(Sexo));
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Vigilante Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Vigilante(int ID, String Nombre1, String Nombre2, 
            String Apellido1, String Apellido2 ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[UVIGILANTE] (?,?,?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Nombre1);
        consulta.setString(3, Nombre2);
        consulta.setString(4, Apellido1);
        consulta.setString(5, Apellido2);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Vigilante Modificada");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Vigilante(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[EVIGILANTE] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Vigilante Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Principal;

import Clases.Conexion;
import Clases.Cuerpo;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * 
 */
public class Ver_Cuerpo extends javax.swing.JFrame {

    /**
     * Creates new form Ver_Soldado
     */
    public Ver_Cuerpo() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Ver Cuerpo");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        jPanel1.setLayout(new java.awt.BorderLayout());

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jTable1.getTableHeader().setReorderingAllowed(false);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel1.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        jLabel1.setText("Buscar Por:");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "ID", "Nombre" }));

        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });

        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText("Mostrar Todo");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setText("Eliminar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 318, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3))
                .addContainerGap())
        );

        getContentPane().add(jPanel2, java.awt.BorderLayout.PAGE_START);

        pack();
    }// </editor-fold>//GEN-END:initComponents
 DefaultTableModel model = new DefaultTableModel() {

    @Override
    public boolean isCellEditable(int row, int column) {
       //all cells false
       return false;
    }
};
    
    
    ResultSet resultado;
    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened

String [] Datos = {"ID","Denominación"};      
        
model.setColumnIdentifiers(Datos);

jTable1.setModel(model);
ActualizarTabla();

// TODO add your handling code here:
    }//GEN-LAST:event_formWindowOpened

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

String Buscar = jTextField1.getText().trim();

int Index = 1;

Index = jComboBox1.getSelectedIndex()+1;

switch(Index){
    
    case 1: 
        
          model.setRowCount(0);
        jTable1.setModel(model);
        try{
            
        
        resultado = Conexion.consulta("Select * from [dbo].[Cuerpo] where  [ID_Cuerpo]  = "+Buscar);
        
        while(resultado.next()){
            
            String [] Dat = new String [2];
            
            Dat [0] = String.valueOf(resultado.getInt(1));
            Dat [1] = resultado.getString(2);
          
            
            model.addRow(Dat);
          
        
        }
        }catch(SQLException Ex){
            
            JOptionPane.showMessageDialog(null, "No Encontrado");
        }
break;
     
    case 2: 
          model.setRowCount(0);
        jTable1.setModel(model);
        try{
            
        
        resultado = Conexion.consulta("Select *  from [dbo].[Cuerpo] where [Denominacion] = '"+Buscar+"'");
        
        while(resultado.next()){
            
            String [] Dat = new String [2];
            
            Dat [0] = String.valueOf(resultado.getInt(1));
            Dat [1] = resultado.getString(2);
         
            
            model.addRow(Dat);
          
        
        }
        }catch(SQLException Ex){
            
            JOptionPane.showMessageDialog(null, "No Encontrado");
        }
    
    break;
        
        default: break;
}

   jTable1.setModel(model);
    
// TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
String Buscar = jTextField1.getText().trim();

int Index = 1;

Index = jComboBox1.getSelectedIndex()+1;

switch(Index){
    
    case 1: 
        
          model.setRowCount(0);
        jTable1.setModel(model);
        try{
            
        
        resultado = Conexion.consulta("Select * from [dbo].[Cuerpo] where  [ID_Cuerpo]  like '"+Buscar+"%'");
        
        while(resultado.next()){
            
            String [] Dat = new String [2];
            
            Dat [0] = String.valueOf(resultado.getInt(1));
            Dat [1] = resultado.getString(2);
        
            
            model.addRow(Dat);
          
        
        }
        }catch(SQLException Ex){
            
           // JOptionPane.showMessageDialog(null, "No Encontrado");
        }
break;
     
    case 2: 
          model.setRowCount(0);
        jTable1.setModel(model);
        try{
            
        
        resultado = Conexion.consulta("Select * from [dbo].[Cuerpo] where [Denominacion] like '"+Buscar+"%'");
        
        while(resultado.next()){
            
            String [] Dat = new String [2];
            
            Dat [0] = String.valueOf(resultado.getInt(1));
            Dat [1] = resultado.getString(2);
                 
            model.addRow(Dat);
          
        
        }
        }catch(SQLException Ex){
            
           // JOptionPane.showMessageDialog(null, "No Encontrado");
        }
    
    break;
        
        default: break;
}

   jTable1.setModel(model);        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1KeyReleased

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
ActualizarTabla();        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked

        
if(evt.getClickCount() == 2){
    
    int Index = jTable1.getSelectedRow();
    
    if(Index != -1){
        
        String ID;
        String Nombre;
        
        ID = (String) model.getValueAt(Index, 0);
        Nombre = (String) model.getValueAt(Index, 1);
      
        
        Modificar_Cuerpo MC = new Modificar_Cuerpo(this, true);
        MC.Parametros(ID, Nombre);
        MC.setVisible(true);
     
        
        ActualizarTabla();
    }
    
    
    
}

// TODO add your handling code here:
    }//GEN-LAST:event_jTable1MouseClicked

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
int Index = jTable1.getSelectedRow();
    
    if(Index != -1){
        
        String ID = (String) model.getValueAt(Index, 0);
        
        int IDD = Integer.valueOf(ID);
        
        Cuerpo.Eliminar_Cuerpo(IDD);
         ActualizarTabla();
        
    }else{
        JOptionPane.showMessageDialog(null,"Seleccione Un Elemento Para Eliminar","Error",JOptionPane.ERROR_MESSAGE);
    }        // TODO add your handling code here:
    }//GEN-LAST:event_jButton3ActionPerformed

    
public void ActualizarTabla(){
        
        model.setRowCount(0);
        jTable1.setModel(model);
        try{
            
        
        resultado = Conexion.consulta("Select * from [dbo].[Cuerpo]");
        
        while(resultado.next()){
            
            String [] Dat = new String [2];
            
            Dat [0] = String.valueOf(resultado.getInt(1));
            Dat [1] = resultado.getString(2);
           
            
            model.addRow(Dat);
          
        
        }
        }catch(SQLException Ex){
            
        }

        jTable1.setModel(model);
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Ver_Cuerpo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Ver_Cuerpo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Ver_Cuerpo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Ver_Cuerpo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Ver_Cuerpo().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}

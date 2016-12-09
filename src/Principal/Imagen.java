/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Principal;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;

/**
 *
 * @author Reymundo Tenorio
 */
public class Imagen extends javax.swing.JPanel  {
    

    private Image image = null;

    public Imagen(String filename) {
        this.image = new ImageIcon(getClass().getResource(filename)).getImage();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0, 1400, 800, null);
    }
   
   
}

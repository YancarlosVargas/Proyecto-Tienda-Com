/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.awt.Component;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author SENA
 */
public class GestionCeldas extends DefaultTableCellRenderer{
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column){
        Component c = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column); 
        c.setForeground(new java.awt.Color(0,0,0));
        c.setFont(new java.awt.Font("Verdana",0,12));
        
        if (value instanceof JButton){
           JButton btn = (JButton)value;
           btn.setBorderPainted(false);
           btn.setContentAreaFilled(false);
           return btn;
        }
        return c;
        
    }        
}

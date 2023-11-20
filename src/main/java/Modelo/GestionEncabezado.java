
package Modelo;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.table.TableCellRenderer;

public class GestionEncabezado implements TableCellRenderer{

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        JComponent encabezado = null;
        encabezado = new JLabel((String)value);
        ((JLabel)encabezado).setHorizontalAlignment(SwingConstants.CENTER);
        Object cellValue= value;
        encabezado.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 1, Color.black));
        encabezado.setForeground(Color.black);
        encabezado.setFont(new java.awt.Font("Rockwell",1,10));
        return encabezado;
    }
    
}

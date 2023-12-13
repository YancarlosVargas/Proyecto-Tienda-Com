/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Factura extends javax.swing.JFrame {

    /**
     * Creates new form Cliente
     */
    public Factura() {
        initComponents();
    }
    
    public JLabel getLbltitulo() {
        return lbltitulo;
    }

    public void setLbltitulo(JLabel lbltitulo) {
        this.lbltitulo = lbltitulo;
    }

    public JTextField getTxtComprobante() {
        return txtComprobante;
    }

    public void setTxtComprobante(JTextField txtComprobante) {
        this.txtComprobante = txtComprobante;
    }
    
    
    
    public JButton getBtnBuscarUsuario() {
        return btnBuscarUsuario;
    }

    public void setBtnBuscarUsuario(JButton btnBuscarUsuario) {
        this.btnBuscarUsuario = btnBuscarUsuario;
    }

    public JButton getBtnCancelar() {
        return btnCancelar;
    }

    public void setBtnCancelar(JButton btnCancelar) {
        this.btnCancelar = btnCancelar;
    }

    public JButton getBtnGuardarVenta() {
        return btnGuardarVenta;
    }

    public void setBtnGuardarVenta(JButton btnGuardarVenta) {
        this.btnGuardarVenta = btnGuardarVenta;
    }

    public JButton getBtnbuscarcliente() {
        return btnbuscarcliente;
    }

    public void setBtnbuscarcliente(JButton btnbuscarcliente) {
        this.btnbuscarcliente = btnbuscarcliente;
    }

    public JComboBox<String> getCbxtipodepago() {
        return cbxtipodepago;
    }

    public void setCbxtipodepago(JComboBox<String> cbxtipodepago) {
        this.cbxtipodepago = cbxtipodepago;
    }

    public JPanel getJpVenta() {
        return jpVenta;
    }

    public void setJpVenta(JPanel jpVenta) {
        this.jpVenta = jpVenta;
    }

    public JTextField getTxtUsuario() {
        return txtUsuario;
    }

    public void setTxtUsuario(JTextField txtUsuario) {
        this.txtUsuario = txtUsuario;
    }

    public JTextField getTxtcliente() {
        return txtcliente;
    }

    public void setTxtcliente(JTextField txtcliente) {
        this.txtcliente = txtcliente;
    }

  

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jpVenta = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        cbxtipodepago = new javax.swing.JComboBox<>();
        txtcliente = new javax.swing.JTextField();
        btnCancelar = new javax.swing.JButton();
        btnGuardarVenta = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        lbltitulo = new javax.swing.JLabel();
        btnbuscarcliente = new javax.swing.JButton();
        txtUsuario = new javax.swing.JTextField();
        btnBuscarUsuario = new javax.swing.JButton();
        txtComprobante = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jpVenta.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel3.setText("Cedula Del Cliente:");

        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel4.setText("Identificacion del Usuario:");
        jLabel4.setToolTipText("");

        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel9.setText("Tipo De Pago:");

        cbxtipodepago.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar:", "Tarjeta de Credito", "Efectivo" }));

        txtcliente.setEditable(false);

        btnCancelar.setText("Cancelar");

        btnGuardarVenta.setText("Guardar");
        btnGuardarVenta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarVentaActionPerformed(evt);
            }
        });

        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel7.setText("Numero De Comprobante:");
        jLabel7.setToolTipText("");

        jPanel1.setBackground(new java.awt.Color(102, 102, 102));

        lbltitulo.setFont(new java.awt.Font("Segoe UI Semibold", 1, 24)); // NOI18N
        lbltitulo.setForeground(new java.awt.Color(255, 255, 255));
        lbltitulo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lbltitulo.setText("NUEVA VENTA");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lbltitulo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(lbltitulo, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        btnbuscarcliente.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Filtrar.png"))); // NOI18N

        txtUsuario.setEditable(false);
        txtUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtUsuarioActionPerformed(evt);
            }
        });

        btnBuscarUsuario.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Filtrar.png"))); // NOI18N
        btnBuscarUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarUsuarioActionPerformed(evt);
            }
        });

        txtComprobante.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtComprobanteActionPerformed(evt);
            }
        });

        jLabel2.setForeground(new java.awt.Color(255, 0, 0));
        jLabel2.setText("*");

        jLabel10.setForeground(new java.awt.Color(255, 0, 0));
        jLabel10.setText("*");

        jLabel11.setForeground(new java.awt.Color(255, 0, 0));
        jLabel11.setText("*");

        jLabel12.setForeground(new java.awt.Color(255, 0, 0));
        jLabel12.setText("*");

        javax.swing.GroupLayout jpVentaLayout = new javax.swing.GroupLayout(jpVenta);
        jpVenta.setLayout(jpVentaLayout);
        jpVentaLayout.setHorizontalGroup(
            jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jpVentaLayout.createSequentialGroup()
                .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpVentaLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jpVentaLayout.createSequentialGroup()
                                .addComponent(cbxtipodepago, javax.swing.GroupLayout.PREFERRED_SIZE, 244, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jpVentaLayout.createSequentialGroup()
                                .addComponent(txtcliente, javax.swing.GroupLayout.PREFERRED_SIZE, 216, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnbuscarcliente, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jpVentaLayout.createSequentialGroup()
                                .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 217, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnBuscarUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jpVentaLayout.createSequentialGroup()
                                .addComponent(txtComprobante, javax.swing.GroupLayout.PREFERRED_SIZE, 244, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jpVentaLayout.createSequentialGroup()
                        .addGap(105, 105, 105)
                        .addComponent(btnGuardarVenta, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnCancelar)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jpVentaLayout.setVerticalGroup(
            jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpVentaLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpVentaLayout.createSequentialGroup()
                        .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cbxtipodepago)
                            .addComponent(jLabel9)
                            .addComponent(jLabel2))
                        .addGap(6, 6, 6)
                        .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnbuscarcliente)
                            .addComponent(txtcliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel10)))
                    .addGroup(jpVentaLayout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addComponent(jLabel3)
                        .addGap(10, 10, 10)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel4))
                    .addComponent(btnBuscarUsuario)
                    .addComponent(jLabel11))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtComprobante, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
                    .addComponent(jLabel7)
                    .addComponent(jLabel12))
                .addGap(24, 24, 24)
                .addGroup(jpVentaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardarVenta)
                    .addComponent(btnCancelar))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jpVenta, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jpVenta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtUsuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtUsuarioActionPerformed

    private void btnGuardarVentaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarVentaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarVentaActionPerformed

    private void txtComprobanteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtComprobanteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtComprobanteActionPerformed

    private void btnBuscarUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarUsuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnBuscarUsuarioActionPerformed

    /**
     * @param args the command line arguments
     */
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscarUsuario;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardarVenta;
    private javax.swing.JButton btnbuscarcliente;
    private javax.swing.JComboBox<String> cbxtipodepago;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jpVenta;
    private javax.swing.JLabel lbltitulo;
    private javax.swing.JTextField txtComprobante;
    private javax.swing.JTextField txtUsuario;
    private javax.swing.JTextField txtcliente;
    // End of variables declaration//GEN-END:variables
}

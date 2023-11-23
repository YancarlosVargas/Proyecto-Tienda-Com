/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author HuevosFundidos
 */
public class Principal extends javax.swing.JFrame {

    /**
     * Creates new form Principal2
     */
    public Principal() {
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
        jPanel2 = new javax.swing.JPanel();
        jtPrincipal = new javax.swing.JTabbedPane();
        jpUsuario = new javax.swing.JPanel();
        btnNuevoUsuario = new javax.swing.JButton();
        txtFiltro = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jtUsuario = new javax.swing.JTable();
        jpProvedor = new javax.swing.JPanel();
        btnAñadirProveedor = new javax.swing.JButton();
        txtFiltroProvedor = new javax.swing.JTextField();
        jScrollPane3 = new javax.swing.JScrollPane();
        jtProvedor = new javax.swing.JTable();
        J = new javax.swing.JPanel();
        btnNuevoCliente = new javax.swing.JButton();
        txtFiltroCliente = new javax.swing.JTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        jtCliente = new javax.swing.JTable();
        jPanel6 = new javax.swing.JPanel();
        btnNuevoProducto = new javax.swing.JButton();
        jScrollPane4 = new javax.swing.JScrollPane();
        jtProducto = new javax.swing.JTable();
        txtFiltroProducto = new javax.swing.JTextField();
        jPanel7 = new javax.swing.JPanel();
        txtFiltroFactura = new javax.swing.JTextField();
        btnNuevaFactura = new javax.swing.JButton();
        jScrollPane5 = new javax.swing.JScrollPane();
        jtFactura = new javax.swing.JTable();
        jPanel3 = new javax.swing.JPanel();
        btnNuevaVenta = new javax.swing.JButton();
        jScrollPane6 = new javax.swing.JScrollPane();
        jtVenta = new javax.swing.JTable();
        txtFiltroVenta = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        btnNuevoUsuario.setText("Añadir Usuario");
        btnNuevoUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoUsuarioActionPerformed(evt);
            }
        });

        txtFiltro.setText("Buscar: ");

        jtUsuario.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jtUsuario.setForeground(new java.awt.Color(255, 255, 255));
        jtUsuario.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jtUsuario.setGridColor(new java.awt.Color(0, 0, 0));
        jtUsuario.setSelectionBackground(new java.awt.Color(255, 255, 255));
        jtUsuario.setSelectionForeground(new java.awt.Color(255, 255, 255));
        jScrollPane1.setViewportView(jtUsuario);

        javax.swing.GroupLayout jpUsuarioLayout = new javax.swing.GroupLayout(jpUsuario);
        jpUsuario.setLayout(jpUsuarioLayout);
        jpUsuarioLayout.setHorizontalGroup(
            jpUsuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpUsuarioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jpUsuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(jpUsuarioLayout.createSequentialGroup()
                        .addComponent(btnNuevoUsuario)
                        .addGap(731, 731, 731)
                        .addComponent(txtFiltro)))
                .addContainerGap())
        );
        jpUsuarioLayout.setVerticalGroup(
            jpUsuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpUsuarioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jpUsuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNuevoUsuario)
                    .addComponent(txtFiltro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Usuario", jpUsuario);

        btnAñadirProveedor.setText("Añadir Proveedor");

        txtFiltroProvedor.setText("Buscar: ");

        jtProvedor.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane3.setViewportView(jtProvedor);

        javax.swing.GroupLayout jpProvedorLayout = new javax.swing.GroupLayout(jpProvedor);
        jpProvedor.setLayout(jpProvedorLayout);
        jpProvedorLayout.setHorizontalGroup(
            jpProvedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpProvedorLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jpProvedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane3)
                    .addGroup(jpProvedorLayout.createSequentialGroup()
                        .addComponent(btnAñadirProveedor)
                        .addGap(717, 717, 717)
                        .addComponent(txtFiltroProvedor, javax.swing.GroupLayout.PREFERRED_SIZE, 1, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jpProvedorLayout.setVerticalGroup(
            jpProvedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpProvedorLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jpProvedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAñadirProveedor)
                    .addComponent(txtFiltroProvedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Provedor", jpProvedor);

        btnNuevoCliente.setText("Añadir Cliente");

        txtFiltroCliente.setText("Buscar: ");

        jtCliente.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane2.setViewportView(jtCliente);

        javax.swing.GroupLayout JLayout = new javax.swing.GroupLayout(J);
        J.setLayout(JLayout);
        JLayout.setHorizontalGroup(
            JLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(JLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2)
                    .addGroup(JLayout.createSequentialGroup()
                        .addComponent(btnNuevoCliente)
                        .addGap(734, 734, 734)
                        .addComponent(txtFiltroCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 1, Short.MAX_VALUE)))
                .addContainerGap())
        );
        JLayout.setVerticalGroup(
            JLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(JLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNuevoCliente)
                    .addComponent(txtFiltroCliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Cliente", J);

        btnNuevoProducto.setText("Nuevo Producto");

        jtProducto.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane4.setViewportView(jtProducto);

        txtFiltroProducto.setText("Buscar: ");

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                        .addComponent(btnNuevoProducto)
                        .addGap(722, 722, 722)
                        .addComponent(txtFiltroProducto))
                    .addComponent(jScrollPane4))
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNuevoProducto)
                    .addComponent(txtFiltroProducto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Producto", jPanel6);

        txtFiltroFactura.setText("Buscar: ");

        btnNuevaFactura.setText("Nueva Factura");

        jtFactura.setForeground(new java.awt.Color(153, 153, 153));
        jtFactura.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane5.setViewportView(jtFactura);

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(btnNuevaFactura)
                        .addGap(733, 733, 733)
                        .addComponent(txtFiltroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, 1, Short.MAX_VALUE))
                    .addComponent(jScrollPane5))
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNuevaFactura)
                    .addComponent(txtFiltroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Factura", jPanel7);

        btnNuevaVenta.setText("Nueva Venta");

        jtVenta.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane6.setViewportView(jtVenta);

        txtFiltroVenta.setText("Buscar: ");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnNuevaVenta)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtFiltroVenta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane6, javax.swing.GroupLayout.DEFAULT_SIZE, 903, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNuevaVenta)
                    .addComponent(txtFiltroVenta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane6, javax.swing.GroupLayout.PREFERRED_SIZE, 250, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jtPrincipal.addTab("Venta", jPanel3);

        jLabel1.setFont(new java.awt.Font("Segoe UI Semibold", 2, 36)); // NOI18N
        jLabel1.setText("Tienda.Com");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jtPrincipal)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(334, 334, 334)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(jLabel1)
                .addGap(18, 18, Short.MAX_VALUE)
                .addComponent(jtPrincipal, javax.swing.GroupLayout.PREFERRED_SIZE, 317, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 929, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 420, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnNuevoUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoUsuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnNuevoUsuarioActionPerformed

    public JTextField getTxtFiltroFactura() {
        return txtFiltroFactura;
    }

    public void setTxtFiltroFactura(JTextField txtFiltroFactura) {
        this.txtFiltroFactura = txtFiltroFactura;
    }

    public JTable getJtVenta() {
        return jtVenta;
    }

    public void setJtVenta(JTable jtVenta) {
        this.jtVenta = jtVenta;
    }

    
    
    public JTextField getTxtFiltroVenta() {
        return txtFiltroVenta;
    }

    public void setTxtFiltroVenta(JTextField txtFiltroVenta) {
        this.txtFiltroVenta = txtFiltroVenta;
    }

    
    
    
    public JTextField getTxtFiltroProducto() {
        return txtFiltroProducto;
    }

    public void setTxtFiltroProducto(JTextField txtFiltroProducto) {
        this.txtFiltroProducto = txtFiltroProducto;
    }
    
    public JTable getJtProvedor() {
        return jtProvedor;
    }

    public void setJtProvedor(JTable jtProvedor) {
        this.jtProvedor = jtProvedor;
    }

    public JTable getJtProducto() {
        return jtProducto;
    }

    public void setJtProducto(JTable jtProducto) {
        this.jtProducto = jtProducto;
    }

    
    
    
    public JTextField getTxtFiltroProvedor() {
        return txtFiltroProvedor;
    }

    public void setTxtFiltroProvedor(JTextField txtFiltroProvedor) {
        this.txtFiltroProvedor = txtFiltroProvedor;
    }

    public JTextField getTxtFiltroCliente() {
        return txtFiltroCliente;
    }

    public void setTxtFiltroCliente(JTextField txtFiltroCliente) {
        this.txtFiltroCliente = txtFiltroCliente;
    }

    public JTable getJtFactura() {
        return jtFactura;
    }

    public void setJtFactura(JTable jtFactura) {
        this.jtFactura = jtFactura;
    }

    public JButton getBtnNuevaFactura() {
        return btnNuevaFactura;
    }

    public void setBtnNuevaFactura(JButton btnNuevaFactura) {
        this.btnNuevaFactura = btnNuevaFactura;
    }

    public JButton getBtnNuevaVenta() {
        return btnNuevaVenta;
    }

    public JTable getJtCliente() {
        return jtCliente;
    }

    public void setJtCliente(JTable jtCliente) {
        this.jtCliente = jtCliente;
    }

    public void setBtnNuevaVenta(JButton btnNuevaVenta) {
        this.btnNuevaVenta = btnNuevaVenta;
    }

    
    
    public JTabbedPane getJtPrincipal() {
        return jtPrincipal;
    }

    public void setJtPrincipal(JTabbedPane jtPrincipal) {
        this.jtPrincipal = jtPrincipal;
    }

    public JTable getJtUsuario() {
        return jtUsuario;
    }

    public void setJtUsuario(JTable jtUsuario) {
        this.jtUsuario = jtUsuario;
    }

    public JTextField getTxtFiltro() {
        return txtFiltro;
    }

    public void setTxtFiltro(JTextField txtFiltro) {
        this.txtFiltro = txtFiltro;
    }

    public JPanel getJpUsuario() {
        return jpUsuario;
    }

    public void setJpUsuario(JPanel jpUsuario) {
        this.jpUsuario = jpUsuario;
    }


    public JButton getBtnAñadirProveedor() {
        return btnAñadirProveedor;
    }

    /**
     * @param args the command line arguments
     */
    public void setBtnAñadirProveedor(JButton btnAñadirProveedor) {
        this.btnAñadirProveedor = btnAñadirProveedor;
    }

    public JButton getBtnNuevoUsuario() {
        return btnNuevoUsuario;
    }

    /**
     * @param btnNuevoUsuario
     */
    public void setBtnNuevoUsuario(JButton btnNuevoUsuario) {
        this.btnNuevoUsuario = btnNuevoUsuario;
    }

    public JButton getBtnNuevoCliente() {
        return btnNuevoCliente;
    }

    public void setBtnNuevoCliente(JButton btnNuevoCliente) {
        this.btnNuevoCliente = btnNuevoCliente;
    }

    public JButton getBtnNuevoProducto() {
        return btnNuevoProducto;
    }

    public void setBtnNuevoProducto(JButton btnNuevoProducto) {
        this.btnNuevoProducto = btnNuevoProducto;
    }
    
    
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel J;
    private javax.swing.JButton btnAñadirProveedor;
    private javax.swing.JButton btnNuevaFactura;
    private javax.swing.JButton btnNuevaVenta;
    private javax.swing.JButton btnNuevoCliente;
    private javax.swing.JButton btnNuevoProducto;
    private javax.swing.JButton btnNuevoUsuario;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JPanel jpProvedor;
    private javax.swing.JPanel jpUsuario;
    private javax.swing.JTable jtCliente;
    private javax.swing.JTable jtFactura;
    private javax.swing.JTabbedPane jtPrincipal;
    private javax.swing.JTable jtProducto;
    private javax.swing.JTable jtProvedor;
    private javax.swing.JTable jtUsuario;
    private javax.swing.JTable jtVenta;
    private javax.swing.JTextField txtFiltro;
    private javax.swing.JTextField txtFiltroCliente;
    private javax.swing.JTextField txtFiltroFactura;
    private javax.swing.JTextField txtFiltroProducto;
    private javax.swing.JTextField txtFiltroProvedor;
    private javax.swing.JTextField txtFiltroVenta;
    // End of variables declaration//GEN-END:variables
}

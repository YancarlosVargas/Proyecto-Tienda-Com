/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloFactura_Compra;
import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Vista.Detalle_Factura_Compra;
import Vista.Factura_Compra;
import Vista.Principal;
import Vista.Proveedor_Tabla;
import Vista.Usuarios_Tabla;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author SENA
 */
public class ControladorFactura_Compra implements ActionListener, DocumentListener {

    Factura_Compra vista_factucomp = new Factura_Compra();
    Usuarios_Tabla User_Table = new Usuarios_Tabla();
    Principal prin = new Principal();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloProveedor modpro = new ModeloProveedor();
    Proveedor_Tabla Proveedor_Table = new Proveedor_Tabla();
    ModeloFactura_Compra modfactucomp = new ModeloFactura_Compra();
    Detalle_Factura_Compra detallefactura = new Detalle_Factura_Compra();

    public ControladorFactura_Compra() {
        vista_factucomp.getBtnBuscarProveedor().addActionListener(this);
        vista_factucomp.getBtnBuscarUsuario().addActionListener(this);
        vista_factucomp.getBtnGuardarFacturaCompra().addActionListener(this);
        vista_factucomp.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        User_Table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        Proveedor_Table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        Proveedor_Table.getTxtFiltro().getDocument().addDocumentListener(this);
        User_Table.getTxtFiltro().getDocument().addDocumentListener(this);
        vista_factucomp.getBtnCancelar().addActionListener(this);

        vista_factucomp.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(4);
            }
        });

        User_Table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                User_Table.setVisible(false);
                vista_factucomp.setVisible(true);
            }
        });

        Proveedor_Table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                Proveedor_Table.setVisible(false);
                vista_factucomp.setVisible(true);
            }
        });

    }

    public void agregarUsuario() {
        User_Table.setTitle("Añadir Usuario | Ventana");
        User_Table.getJtUsuario().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = User_Table.getJtUsuario().rowAtPoint(e.getPoint());
                int columna = User_Table.getJtUsuario().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(User_Table.getJtUsuario().getValueAt(fila, 0).toString()));
                if (columna == 9) {
                    User_Table.setVisible(false);
                    vista_factucomp.setVisible(true);
                    Object idusu = modusu.getDoc();
                    vista_factucomp.getTxtUsuario().setText(idusu.toString());
                    JOptionPane.showMessageDialog(null, "Usuario Agregado");

                }

            }

        });

        User_Table.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                User_Table.getTxtFiltro().setText("");
                User_Table.getTxtFiltro().setForeground(Color.black);
            }

        });
    }

    public void agregarproveedor() {
        Proveedor_Table.setTitle("Añadir Proveedor | Ventana");

        Proveedor_Table.getJtProveedor().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = Proveedor_Table.getJtProveedor().rowAtPoint(e.getPoint());
                int columna = Proveedor_Table.getJtProveedor().columnAtPoint(e.getPoint());
                modpro.setCed(Integer.parseInt(Proveedor_Table.getJtProveedor().getValueAt(fila, 0).toString()));
                if (columna == 9) {
                    Proveedor_Table.setVisible(false);
                    vista_factucomp.setVisible(true);
                    Object idpro = modpro.getCed();
                    vista_factucomp.getTxtProveedor().setText(idpro.toString());
                    JOptionPane.showMessageDialog(null, "Proveedor Agregado");

                }

            }

        });

        Proveedor_Table.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                Proveedor_Table.getTxtFiltro().setText("");
                Proveedor_Table.getTxtFiltro().setForeground(Color.black);
            }

        });
    }

    public void actualizarFactura_Compra(int idfactucom) {
        modfactucomp.buscarFactura_Compra(idfactucom);
        vista_factucomp.getTxtComprobante().setEnabled(false);
        vista_factucomp.getTxtUsuario().setText(String.valueOf(modfactucomp.getIdusu()));
        vista_factucomp.getTxtProveedor().setText(String.valueOf(modfactucomp.getCed()));
        vista_factucomp.getCbxtipodepago().setSelectedItem(modfactucomp.getTipopago());
        vista_factucomp.getTxtComprobante().setText(String.valueOf(modfactucomp.getNumerodecomprobante()));
        vista_factucomp.getLblTitulo().setText("ACTUALIZAR FACTURA");
        prin.setVisible(false);
        vista_factucomp.setLocationRelativeTo(null);
        vista_factucomp.getBtnGuardarFacturaCompra().setText("Actualizar");
        vista_factucomp.setVisible(true);
        vista_factucomp.setTitle("Actualizar Factura Compra | Ventana");
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(vista_factucomp.getBtnBuscarUsuario())) {
            vista_factucomp.setVisible(false);
            User_Table.setLocationRelativeTo(null);
            modusu.mostrarTablaUsuario(User_Table.getJtUsuario(), "", "BuscarUsuario");
            User_Table.setVisible(true);
            agregarUsuario();

        }

        if (e.getSource().equals(vista_factucomp.getBtnBuscarProveedor())) {
            vista_factucomp.setVisible(false);
            Proveedor_Table.setLocationRelativeTo(null);
            modpro.mostrarTablaProvedor(Proveedor_Table.getJtProveedor(), "", "BuscarProveedor");
            Proveedor_Table.setVisible(true);
            agregarproveedor();

        }

        if (e.getSource().equals(vista_factucomp.getBtnGuardarFacturaCompra())) {
            if ((vista_factucomp.getTxtProveedor().getText().isEmpty()) || (vista_factucomp.getTxtUsuario().getText().isEmpty()) || (vista_factucomp.getCbxtipodepago().getSelectedItem().equals("Seleccionar:")) || (vista_factucomp.getTxtComprobante().getText().isEmpty())) {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
 
            } else {

                modfactucomp.setCed(Integer.parseInt(vista_factucomp.getTxtProveedor().getText()));
                modfactucomp.setIdusu(Integer.parseInt(vista_factucomp.getTxtUsuario().getText()));
                modfactucomp.setTipopago(vista_factucomp.getCbxtipodepago().getSelectedItem().toString());
                modfactucomp.setNumerodecomprobante(Integer.parseInt(vista_factucomp.getTxtComprobante().getText()));
                if (vista_factucomp.getBtnGuardarFacturaCompra().getText().equals("Guardar")) {
                    JOptionPane.showMessageDialog(null, "Factura agregada");
                    modfactucomp.insertarfacturacompra();
                    modfactucomp.limpiarCasillas(vista_factucomp.getJpFacturaCompra().getComponents());
                } else {
                    modfactucomp.actualizarFactura_Compra();

                    vista_factucomp.dispose();
                    prin.getJtPrincipal().setSelectedIndex(4);
                    modfactucomp.mostrarFactura_Compra(prin.getJtFactura(), "", "Factura");

                }
            }
        }

        if (e.getSource().equals(vista_factucomp.getBtnCancelar())) {
            vista_factucomp.dispose();
        }
        
        
    }

    public void iniciarFactura_Compra() {
        vista_factucomp.setVisible(true);
        vista_factucomp.setLocationRelativeTo(null);
        prin.setVisible(false);
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        vista_factucomp.setTitle("Añadir Nueva Factura | Ventana");
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        modpro.mostrarTablaProvedor(Proveedor_Table.getJtProveedor(), Proveedor_Table.getTxtFiltro().getText(), "");
        modusu.mostrarTablaUsuario(User_Table.getJtUsuario(), User_Table.getTxtFiltro().getText(), "");

    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        modpro.mostrarTablaProvedor(Proveedor_Table.getJtProveedor(), Proveedor_Table.getTxtFiltro().getText(), "");
        modusu.mostrarTablaUsuario(User_Table.getJtUsuario(), User_Table.getTxtFiltro().getText(), "");

    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        modpro.mostrarTablaProvedor(Proveedor_Table.getJtProveedor(), Proveedor_Table.getTxtFiltro().getText(), "");
        modusu.mostrarTablaUsuario(User_Table.getJtUsuario(), User_Table.getTxtFiltro().getText(), "");

    }

}

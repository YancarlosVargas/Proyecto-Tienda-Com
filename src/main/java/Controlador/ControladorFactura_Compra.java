/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Vista.Factura_Compra;
import Vista.Principal;
import Vista.Usuarios_Tabla;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

/**
 *
 * @author SENA
 */
public class ControladorFactura_Compra implements ActionListener{

    Factura_Compra vista_factucomp = new Factura_Compra();
    Usuarios_Tabla User_Table = new Usuarios_Tabla();
    Principal prin = new Principal();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloProveedor modpro = new ModeloProveedor();

    public ControladorFactura_Compra() {
        vista_factucomp.getBtnBuscarProveedor().addActionListener(this);
        vista_factucomp.getBtnBuscarUsuario().addActionListener(this);
        vista_factucomp.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        User_Table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

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
                vista_factucomp.setVisible(true);
            }
        });
        
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


    }

    public void iniciarFactura_Compra() {
        vista_factucomp.setVisible(true);
        vista_factucomp.setLocationRelativeTo(null);
        prin.setVisible(false);
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(vista_factucomp.getBtnBuscarUsuario())) {
            vista_factucomp.setVisible(false);
            User_Table.setLocationRelativeTo(null);
            modusu.mostrarTablaUsuario(User_Table.getJtUsuario(), "", "BuscarUsuario");
            User_Table.setVisible(true);
            User_Table.getLblTitulo().setText("Buscar Usuario");
        }

        if (e.getSource().equals(vista_factucomp.getBtnBuscarProveedor())) {
            vista_factucomp.setVisible(false);
            User_Table.setLocationRelativeTo(null);
            modpro.mostrarTablaProvedor(User_Table.getJtUsuario(), "", "BuscarProveedor");
            User_Table.setVisible(true);
            User_Table.getLblTitulo().setText("Buscar Proveedor");
        }
    }


}

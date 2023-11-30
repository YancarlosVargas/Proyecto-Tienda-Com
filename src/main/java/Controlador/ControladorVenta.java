/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloUsuario;
import Modelo.ModeloVenta;
import Vista.Clientes_Tabla;
import Vista.Factura;
import Vista.Principal;
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
public class ControladorVenta implements ActionListener, DocumentListener {

    Principal prin = new Principal();
    Factura fact = new Factura();
    Usuarios_Tabla user_table = new Usuarios_Tabla();
    Clientes_Tabla cliente_table = new Clientes_Tabla();
    ModeloVenta modven = new ModeloVenta();
    ModeloUsuario moduser = new ModeloUsuario();
    ModeloCliente modcli = new ModeloCliente();

    public ControladorVenta() {
        fact.getBtnCancelar().addActionListener(this);
        fact.getBtnBuscarUsuario().addActionListener(this);
        fact.getBtnbuscarcliente().addActionListener(this);
        fact.getBtnGuardarVenta().addActionListener(this);

        fact.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        user_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cliente_table.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        user_table.getTxtFiltro().getDocument().addDocumentListener(this);
        cliente_table.getTxtFiltro().getDocument().addDocumentListener(this);

        fact.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal prin = new ControladorPrincipal();
                prin.iniciarPrincipal(5);
            }
        });

        user_table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                fact.setVisible(true);
                user_table.setVisible(false);
            }
        });

        cliente_table.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                fact.setVisible(true);
                cliente_table.setVisible(false);
            }
        });

        user_table.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                user_table.getTxtFiltro().setText("");
                user_table.getTxtFiltro().setForeground(Color.black);
            }

        });

        cliente_table.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                cliente_table.getTxtFiltro().setText("");
                cliente_table.getTxtFiltro().setForeground(Color.black);
            }

        });
    }

    public void iniciarVenta() {
        prin.setVisible(false);
        fact.setVisible(true);
        fact.setLocationRelativeTo(null);
        fact.setTitle("Nueva Venta | Ventana");

    }

    public void actualizarVenta(int idfactura) {
        modven.buscarVenta(idfactura);
        fact.getTxtUsuario().setText(String.valueOf(modven.getIdusuario()));
        fact.getTxtcliente().setText(String.valueOf(modven.getIdcliente()));
        fact.getCbxtipodepago().setSelectedItem(modven.getTipodepago());

        prin.setVisible(false);
        fact.getLbltitulo().setText("ACTUALIZAR VENTA");
        fact.setLocationRelativeTo(null);
        fact.getBtnGuardarVenta().setText("Actualizar");
        fact.setVisible(true);
        fact.setTitle("Actualizar Venta | Ventana");

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(fact.getBtnBuscarUsuario())) {
            fact.setVisible(false);
            user_table.setVisible(true);
            user_table.setLocationRelativeTo(null);
            moduser.mostrarTablaUsuario(user_table.getJtUsuario(), "", "");

            user_table.getJtUsuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = user_table.getJtUsuario().rowAtPoint(e.getPoint());
                    int columna = user_table.getJtUsuario().columnAtPoint(e.getPoint());
                    moduser.setDoc(Integer.parseInt(user_table.getJtUsuario().getValueAt(fila, 0).toString()));
                    if (columna == 9) {
                        user_table.setVisible(false);
                        fact.setVisible(true);
                        Object idusuario = moduser.getDoc();
                        fact.getTxtUsuario().setText(idusuario.toString());
                        JOptionPane.showMessageDialog(null, "Usuario Agregado");
                    }

                }

            });

        }

        if (e.getSource().equals(fact.getBtnbuscarcliente())) {
            fact.setVisible(false);
            cliente_table.setVisible(true);
            cliente_table.setLocationRelativeTo(null);
            modcli.mostrarTablaCliente(cliente_table.getJtCliente(), "", "");

            cliente_table.getJtCliente().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = cliente_table.getJtCliente().rowAtPoint(e.getPoint());
                    int columna = cliente_table.getJtCliente().columnAtPoint(e.getPoint());
                    modcli.setCdl(Integer.parseInt(cliente_table.getJtCliente().getValueAt(fila, 0).toString()));
                    if (columna == 8) {
                        cliente_table.setVisible(false);
                        fact.setVisible(true);
                        Object idcliente = modcli.getCdl();
                        fact.getTxtcliente().setText(idcliente.toString());
                        JOptionPane.showMessageDialog(null, "Cliente Agregado");
                    }

                }

            });
        }

        if (e.getSource().equals(fact.getBtnCancelar())) {
            fact.dispose();
        }

        if (e.getSource().equals(fact.getBtnGuardarVenta())) {
            if (fact.getCbxtipodepago().getSelectedItem().equals("Seleccionar:") || fact.getTxtUsuario().getText().isEmpty() || fact.getTxtcliente().getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {
                modven.setIdcliente(Integer.parseInt(fact.getTxtcliente().getText()));
                modven.setIdusuario(Integer.parseInt(fact.getTxtUsuario().getText()));
                modven.setTipodepago(fact.getCbxtipodepago().getSelectedItem().toString());

                if (fact.getBtnGuardarVenta().getText().equals("Guardar")) {

                    modven.insertarVenta();
                    //                modven.limpiarcasillas();

                } else {

                    modven.actualizarVenta();

                    fact.setVisible(false);
                    prin.getJtPrincipal().setSelectedIndex(5);
                    modven.mostrarVentaTabla(prin.getJtVenta(), "", "Editar");
                    fact.dispose();

                }
            }
        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");

    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");

    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        moduser.mostrarTablaUsuario(user_table.getJtUsuario(), user_table.getTxtFiltro().getText(), "");
        modcli.mostrarTablaCliente(cliente_table.getJtCliente(), cliente_table.getTxtFiltro().getText(), "");

    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloFactura_Compra;
import Modelo.ModeloProducto;
import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Vista.Cliente;
import Vista.Factura;
import Vista.Login;
import Vista.Principal;
import Vista.Producto;
import Vista.Proveedor;
import Vista.Usuario;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JFrame;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author HuevosFundidos
 */
public class ControladorPrincipal implements ActionListener, ChangeListener, DocumentListener {

    Login log = new Login();
    Principal prin = new Principal();
    ModeloUsuario modusu = new ModeloUsuario();
    ControladorUsuario usu = new ControladorUsuario();
    Usuario user = new Usuario();
    Cliente cli = new Cliente();
    ControladorCliente clic = new ControladorCliente();
    Proveedor pro = new Proveedor();
    ControladorProveedor proc = new ControladorProveedor();
    Producto produc = new Producto();
    Factura factu = new Factura();
    ControladorProducto conpro = new ControladorProducto();
    ModeloCliente modcli = new ModeloCliente();
    ModeloProveedor modpro = new ModeloProveedor();
    ModeloProducto modproduc = new ModeloProducto();
    ControladorFactura_Compra controlfaccom = new ControladorFactura_Compra();
    ModeloFactura_Compra modfactucom = new ModeloFactura_Compra();

    public ControladorPrincipal() {
        prin.getBtnNuevoUsuario().addActionListener(this);
        user.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnNuevoCliente().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnAñadirProveedor().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getJtPrincipal().addChangeListener(this);
        prin.getBtnNuevoUsuario().addChangeListener(this);

        prin.getBtnNuevoProducto().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnNuevaFactura().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnNuevaVenta().addActionListener(this);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getTxtFiltro().getDocument().addDocumentListener(this);
        prin.getTxtFiltroCliente().getDocument().addDocumentListener(this);
        prin.getTxtFiltroProvedor().getDocument().addDocumentListener(this);
        prin.getTxtFiltroProducto().getDocument().addDocumentListener(this);

    }

    public void iniciarPrincipal(int valor) {
        log.setVisible(false);
        prin.setLocationRelativeTo(null);
        prin.setVisible(true);
        prin.setTitle("Panel Principal | Ventana");
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        gestionarUsuario();
        prin.getJtPrincipal().setSelectedIndex(valor);

    }

    public void gestionarUsuario() {

        modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");

        prin.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltro().setText("");
                prin.getTxtFiltro().setForeground(Color.black);
            }

        });

        prin.getJtUsuario().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtUsuario().rowAtPoint(e.getPoint());
                int columna = prin.getJtUsuario().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(prin.getJtUsuario().getValueAt(fila, 0).toString()));

                if (columna == 9) {
                    prin.setVisible(false);
                    usu.actualizarUsuario(modusu.getDoc());
                }

                if (columna == 10) {

                    usu.eliminarUsuario(modusu.getDoc());
                    modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");
                }

            }

        });
    }

    public void gestionarFactura_Compra() {

        modfactucom.mostrarFactura_Compra(prin.getJtFactura(), "", "Factura");

        prin.getTxtFiltro().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltro().setText("");
                prin.getTxtFiltro().setForeground(Color.black);
            }

        });

        prin.getJtFactura().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtFactura().rowAtPoint(e.getPoint());
                int columna = prin.getJtFactura().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(prin.getJtFactura().getValueAt(fila, 1).toString()));
                if (columna == 7) {
                    prin.setVisible(false);
                    controlfaccom.actualizarFactura_Compra(modfactucom.getIdfactu());
                }
                if (columna == 8) {
                    controlfaccom.eliminarFactura_Compra(modfactucom.getIdfactu());
                    modfactucom.mostrarFactura_Compra(prin.getJtFactura(), "", "Factura");
                }

            }

        });
    }

    public void gestionarCliente() {

        modcli.mostrarTablaCliente(prin.getJtCliente(), "", "Cliente");

        prin.getTxtFiltroCliente().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltroCliente().setText("");
                prin.getTxtFiltroCliente().setForeground(Color.black);
            }

        });

        prin.getJtCliente().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtCliente().rowAtPoint(e.getPoint());
                int columna = prin.getJtCliente().columnAtPoint(e.getPoint());
                modcli.setCdl(Integer.parseInt(prin.getJtCliente().getValueAt(fila, 0).toString()));
                if (columna == 8) {
                    prin.setVisible(false);
                    clic.actualizarCliente(modcli.getCdl());
                }

                if (columna == 9) {

                    clic.eliminarCliente(modcli.getCdl());
                    modcli.mostrarTablaCliente(prin.getJtCliente(), "", "Cliente");
                }

            }

        });
    }

    public void gestionarProducto() {

        modproduc.mostrarTablaProducto(prin.getJtProducto(), "", "Producto");

        prin.getTxtFiltroProducto().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltroProducto().setText("");
                prin.getTxtFiltroProducto().setForeground(Color.black);
            }

        });

        prin.getJtProducto().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtProducto().rowAtPoint(e.getPoint());
                int columna = prin.getJtProducto().columnAtPoint(e.getPoint());
                modproduc.setIdpro(Integer.parseInt(prin.getJtProducto().getValueAt(fila, 0).toString()));
                if (columna == 6) {
                    prin.setVisible(false);
                    conpro.actualizarProducto(modproduc.getIdpro());
                }

                if (columna == 7) {

                    conpro.eliminarProducto(modproduc.getIdpro());
                    modproduc.mostrarTablaProducto(prin.getJtProducto(), "", "Producto");
                }

            }

        });
    }

    public void gestionarProvedor() {

        modpro.mostrarTablaProvedor(prin.getJtProvedor(), "", "Provedor");

        prin.getTxtFiltroProvedor().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtFiltroProvedor().setText("");
                prin.getTxtFiltroProvedor().setForeground(Color.black);
            }

        });

        prin.getJtProvedor().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtProvedor().rowAtPoint(e.getPoint());
                int columna = prin.getJtProvedor().columnAtPoint(e.getPoint());
                modpro.setCed(Integer.parseInt(prin.getJtProvedor().getValueAt(fila, 0).toString()));
                if (columna == 9) {
                    prin.setVisible(false);
                    proc.actualizarProvedor(modpro.getCed());
                }

                if (columna == 10) {

                    proc.eliminarProvedor(modpro.getCed());
                    modpro.mostrarTablaProvedor(prin.getJtProvedor(), "", "Provedor");
                }

            }

        });
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (prin.getBtnNuevoUsuario())) {
            usu.iniciarUsuario();
            prin.setVisible(false);

        }

        if (e.getSource() == (prin.getBtnNuevoCliente())) {
            clic.iniciarCliente();
            prin.setVisible(false);

        }

        if (e.getSource() == (prin.getBtnAñadirProveedor())) {
            proc.iniciarProveedor();
            prin.setVisible(false);

        }

        if (e.getSource() == (prin.getBtnNuevoProducto())) {
            prin.setVisible(false);
            conpro.iniciarProducto();

        }

        if (e.getSource() == (prin.getBtnNuevaFactura())) {
            controlfaccom.iniciarFactura_Compra();
            prin.setVisible(false);
        }

        if (e.getSource() == (prin.getBtnNuevaVenta())) {
            factu.setVisible(true);
            factu.setLocationRelativeTo(null);
            prin.setVisible(false);
        }

    }

    @Override
    public void stateChanged(ChangeEvent e) {
        int seleccion = prin.getJtPrincipal().getSelectedIndex();
        if (seleccion == 0) {
            gestionarUsuario();
        }

        if (seleccion == 2) {
            gestionarCliente();

        }

        if (seleccion == 1) {
            gestionarProvedor();

        }

        if (seleccion == 3) {
            gestionarProducto();

        }

        if (seleccion == 4) {
            gestionarFactura_Compra();

        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtCliente(), prin.getTxtFiltroCliente().getText(), "Cliente");
        modpro.mostrarTablaProvedor(prin.getJtProvedor(), prin.getTxtFiltroProvedor().getText(), "Provedor");
        modproduc.mostrarTablaProducto(prin.getJtProducto(), prin.getTxtFiltroProducto().getText(), "Producto");

    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtCliente(), prin.getTxtFiltroCliente().getText(), "Cliente");
        modpro.mostrarTablaProvedor(prin.getJtProvedor(), prin.getTxtFiltroProvedor().getText(), "Provedor");
        modproduc.mostrarTablaProducto(prin.getJtProducto(), prin.getTxtFiltroProducto().getText(), "Producto");

    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtCliente(), prin.getTxtFiltroCliente().getText(), "Cliente");
        modpro.mostrarTablaProvedor(prin.getJtProvedor(), prin.getTxtFiltroProvedor().getText(), "Provedor");
        modproduc.mostrarTablaProducto(prin.getJtProducto(), prin.getTxtFiltroProducto().getText(), "Producto");

    }
}

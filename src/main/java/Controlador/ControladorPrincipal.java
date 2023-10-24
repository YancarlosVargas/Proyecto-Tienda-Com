/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloUsuario;
import Vista.Cliente;
import Vista.Login;
import Vista.Principal;
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
public class ControladorPrincipal implements ActionListener, ChangeListener {

    Login log = new Login();
    Principal prin = new Principal();
    ControladorUsuario usu = new ControladorUsuario();
    Usuario user = new Usuario();
    Cliente cli = new Cliente();
    ControladorCliente clic = new ControladorCliente();
    Proveedor pro = new Proveedor();
    ControladorProveedor proc = new ControladorProveedor();

    public ControladorPrincipal() {
        prin.getBtnNuevoUsuario().addActionListener(this);
        user.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnNuevoCliente().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getBtnAñadirProveedor().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        prin.getJtPrincipal().addChangeListener(this);
        prin.getBtnNuevoUsuario().addChangeListener(this);

    }

    public void iniciarPrincipal() {
        log.setVisible(false);
        prin.setLocationRelativeTo(null);
        prin.setVisible(true);
        prin.setTitle("Panel Principal | Ventana");
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        gestionarceldas();
    }

    public void gestionarceldas() {
        if (prin.getJtPrincipal().getSelectedIndex() == 0) {
             ModeloUsuario modusu = new ModeloUsuario();
            modusu.mostrarTablaUsuario(prin.getJtUsuario(), "");

            prin.getTxtFiltro().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    prin.getTxtFiltro().setText("");
                    prin.getTxtFiltro().setForeground(Color.black);
                }

            });
            
            prin.getTxtFiltro().getDocument().addDocumentListener(new DocumentListener(){
            @Override
            public void insertUpdate(DocumentEvent e) {
                modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText());
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                 modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText());
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                 modusu.mostrarTablaUsuario(prin.getJtUsuario(), prin.getTxtFiltro().getText());
            }
            
        });
            prin.getJtUsuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                   int fila = prin.getJtUsuario().rowAtPoint(e.getPoint());
                   int columna = prin.getJtUsuario().columnAtPoint(e.getPoint());
                   modusu.setDoc(Integer.parseInt(prin.getJtUsuario().getValueAt(fila, 1).toString()));
              if(columna==9){
                  usu.actualizarUsuario(modusu.getDoc());
              }
                   
                }

            });

        }

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
    }

    @Override
    public void stateChanged(ChangeEvent e) {
        int seleccion = prin.getJtPrincipal().getSelectedIndex();
        if (seleccion == 0) {
            gestionarceldas();
        }
       
        

    }
}

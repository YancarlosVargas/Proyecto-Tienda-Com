package Controlador;

import Modelo.ModeloCliente;
import Vista.Cliente;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ControladorCliente implements ActionListener{

    Cliente cli = new Cliente();
    ModeloCliente modcli = new ModeloCliente();

    public ControladorCliente() {
        cli.getBtnGuardarCliente().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cli.addWindowListener(new WindowAdapter() {
            ;
        public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(2);
            }
        });
    }

    public void iniciarCliente() {
        cli.setVisible(true);
        cli.setLocationRelativeTo(null);
        cli.setTitle("Añadir Nuevo Cliente | Ventana");

        cli.getJcbGenero().addItem("Seleccione...");
        Map<String, Integer> dato = modcli.llenarCombo("sexo");
        for (String sexo : dato.keySet()) {
            cli.getJcbGenero().addItem(sexo);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (cli.getBtnGuardarCliente())) {

            if ((cli.getTxtDocumento().getText().isEmpty()) || (cli.getJcbGenero().getSelectedItem().equals("Seleccione...")) || (cli.getTxtNombre().getText().isEmpty()) || (cli.getTxtTelefono().getText().isEmpty()) || (cli.getTxtCorreo().getText().isEmpty()) || (cli.getTxtDireccion().getText().isEmpty()) || (cli.getJDFechadeNacimiento().getDate() == null)) {
                JOptionPane.showMessageDialog(null, "Hace Falta Informacion");
            } else {
                JOptionPane.showMessageDialog(null, "Exito");
                String valorSexo = cli.getJcbGenero().getSelectedItem().toString();
                int sexo = modcli.llenarCombo("sexo").get(valorSexo);
                java.util.Date fec = cli.getJDFechadeNacimiento().getDate();
                long fe = fec.getTime();
                java.sql.Date fecha = new Date(fe);

                modcli.setCdl(Integer.parseInt(cli.getTxtDocumento().getText()));
                modcli.setNom(cli.getTxtNombre().getText());
                modcli.setFec(fecha);
                modcli.setDir(cli.getTxtDireccion().getText());
                modcli.setTel(cli.getTxtTelefono().getText());
                modcli.setCor(cli.getTxtCorreo().getText());
                modcli.setSex(sexo);
                modcli.setTipodedocumento(cli.getCbxtipodedocumento().getSelectedItem().toString());
                modcli.insertarCliente();
                modcli.limpiarCasillas(cli.getJpPanelCliente().getComponents());
            }
            
             if (cli.getBtnGuardarCliente().getText().equals("Guardar")) {
                modcli.insertarCliente();
                modcli.limpiarCasillas(cli.getJpPanelCliente().getComponents());
            } else if (cli.getBtnGuardarCliente().getText().equals("Actualizar")) {
                
                
                
                modusu.actualizarUsuario();
                
                ControladorPrincipal princ = new ControladorPrincipal();
                
                
                usu.setVisible(false);
                prin.getJtPrincipal().setSelectedIndex(1);
                modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "usuario");
                princ.iniciarPrincipal(0);
                
                
                
                
            } else {
                modusu.eliminarUsuario();

            }
        }

        }
    
     public void actualizarUsuario(int Doc) {
        modusu.buscarUsuario(Doc);
        usu.getTxtDocumento().setEnabled(false);
        usu.getTxtDocumento().setText(String.valueOf(Doc));
        usu.getTxtLogin().setEnabled(false);
        usu.getCbxtipodedocumento().setEnabled(false);
        usu.getTxtCorreo().setText(modusu.getCor());
        usu.getTxtDireccion().setText(modusu.getDir());
        usu.getTxtTelefono().setText(modusu.getTel());
        usu.getJpClave().setText(modusu.getCl());
        usu.getTxtNombre().setText(modusu.getNom());
        usu.getJDFechadeNacimiento().setDate(modusu.getFec());
        usu.getTxtLogin().setText(modusu.getLo());
        usu.getCbxtipodedocumento().setSelectedItem(modusu.getTipodedoc());

        Map<String, Integer> datos = modusu.llenarCombo("sexo");
        for (String sexo : datos.keySet()) {
            usu.getJcbGenero().addItem(sexo);
        }

        String valorSexo = modusu.obtenerSeleccion(datos, modusu.getSex());
        usu.getJcbGenero().setSelectedItem(valorSexo);

        Map<String, Integer> datosc = modusu.llenarCombo("cargo");
        for (String cargo : datosc.keySet()) {
            usu.getJcbCargo().addItem(cargo);
        }

        String valorCargo = modusu.obtenerSeleccion(datosc, modusu.getRol());
        usu.getJcbCargo().setSelectedItem(valorCargo);

        prin.setVisible(false);
        usu.getLblNuevoUsuario().setText("ACTUALIZAR USUARIO");
        usu.setLocationRelativeTo(null);
        usu.getBtnGuardarUsuario().setText("Actualizar");
        usu.setVisible(true);

    }

    public void eliminarUsuario(int Doc) {
        int resp = JOptionPane.showConfirmDialog(null, "Eliminar Usuario? \n" + Doc,
                 "Eliminar Usuario", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modusu.setDoc(Doc);
            modusu.eliminarUsuario();
            modusu.mostrarTablaUsuario(prin.getJtUsuario(), "", "Usuario");
            
        }

    }

        
        
    }



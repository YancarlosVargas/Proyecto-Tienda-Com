package Controlador;

import Modelo.ModeloCliente;
import Vista.Cliente;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ControladorCliente implements ActionListener {

    Cliente cli = new Cliente();
    ModeloCliente modcli = new ModeloCliente();
    Principal prin = new Principal();

    public ControladorCliente() {
        cli.getBtnGuardarCliente().addActionListener(this);
        cli.getBtnCancelar().addActionListener(this);
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

        cli.getJcbGenero().addItem("Seleccionar:");
        Map<String, Integer> dato = modcli.llenarCombo("sexo");
        for (String sexo : dato.keySet()) {
            cli.getJcbGenero().addItem(sexo);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == (cli.getBtnGuardarCliente())) {

            if ((cli.getCbxtipodedocumento().getSelectedItem().equals("Seleccionar:"))||(cli.getTxtDocumento().getText().isEmpty()) || (cli.getJcbGenero().getSelectedItem().equals("Seleccionar:")) || (cli.getTxtNombre().getText().isEmpty()) || (cli.getTxtTelefono().getText().isEmpty()) || (cli.getTxtCorreo().getText().isEmpty()) || (cli.getTxtDireccion().getText().isEmpty()) || (cli.getJDFechadeNacimiento().getDate() == null)) {
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

                if (cli.getBtnGuardarCliente().getText().equals("Guardar")) {
                    modcli.insertarCliente();
                    modcli.limpiarCasillas(cli.getJpPanelCliente().getComponents());
                } else {

                    modcli.actualizarCliente();

                    ControladorPrincipal princ = new ControladorPrincipal();

                    cli.setVisible(false);
                    prin.getJtPrincipal().setSelectedIndex(1);
                    modcli.mostrarTablaCliente(prin.getJtCliente(), "", "Cliente");
                    princ.iniciarPrincipal(2);

                }
            }
        }

        if (e.getSource() == (cli.getBtnCancelar())) {
            cli.dispose();
        }
    }

    public void actualizarCliente(int Doc) {
        modcli.buscarCliente(Doc);
        cli.getTxtDocumento().setEnabled(false);
        cli.getTxtDocumento().setText(String.valueOf(Doc));
        cli.getTxtCorreo().setText(modcli.getCor());
        cli.getTxtDireccion().setText(modcli.getDir());
        cli.getTxtTelefono().setText(modcli.getTel());
        cli.getTxtNombre().setText(modcli.getNom());
        cli.getJDFechadeNacimiento().setDate(modcli.getFec());
        cli.getCbxtipodedocumento().setSelectedItem(modcli.getTipodedocumento());

        Map<String, Integer> datos = modcli.llenarCombo("sexo");
        for (String sexo : datos.keySet()) {
            cli.getJcbGenero().addItem(sexo);
        }

        String valorSexo = modcli.obtenerSeleccion(datos, modcli.getSex());
        cli.getJcbGenero().setSelectedItem(valorSexo);

        prin.setVisible(false);
        cli.getLblNuevoCliente().setText("ACTUALIZAR CLIENTE");
        cli.setLocationRelativeTo(null);
        cli.getBtnGuardarCliente().setText("Actualizar");
        cli.setVisible(true);
        cli.setTitle("Actualizar Cliente | Ventana");

    }

    public void eliminarCliente(int Doc) {
        int resp = JOptionPane.showConfirmDialog(null, "Eliminar Cliente? \n" + Doc,
                "Eliminar Cliente", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modcli.setCdl(Doc);
            modcli.eliminarCliente();
            modcli.mostrarTablaCliente(prin.getJtCliente(), "", "Cliente");

        }

    }

}

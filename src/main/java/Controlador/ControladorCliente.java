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
                modcli.insertarUsuario();
                modcli.limpiarCasillas(cli.getJpPanelCliente().getComponents());
            }
        }
    }
}


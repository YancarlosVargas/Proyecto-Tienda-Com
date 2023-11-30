package Controlador;

import Modelo.ModeloLogin;
import Modelo.ModeloUsuario;
import Vista.Login;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;

public class ControladorLogin implements ActionListener {

    ModeloLogin modlog = new ModeloLogin();
    Login log = new Login();
    ControladorPrincipal prin = new ControladorPrincipal();

    public ControladorLogin() {
        log.getBtnVisibilidad().addActionListener(this);
        log.getBtnIniciarSeccion().addActionListener(this);

    }

    public void arranqueVista() {
        log.setVisible(true);
        log.setLocationRelativeTo(null);
        log.setTitle("Iniciar Seccion | Ventana");
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(log.getBtnVisibilidad())) {
            if (log.getJpClave().getEchoChar() == '\u2022') {
                log.getJpClave().setEchoChar((char) 0);
                log.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(
                        getClass().getResource("/img/Ojo-Abierto.png")));
            } else {
                log.getJpClave().setEchoChar('\u2022');
                log.getBtnVisibilidad().setIcon(new javax.swing.ImageIcon(
                        getClass().getResource("/img/Ojo-Cerrado.png")));
            }
        }
        if (e.getSource() == (log.getBtnIniciarSeccion())) {
            modlog.setUsu(log.getTxtUsuario().getText());
            String pass = new String(log.getJpClave().getPassword());
            modlog.setContra(pass);
            if (modlog.getUsu().isEmpty() && (modlog.getContra().isEmpty())) {
                JOptionPane.showMessageDialog(null, "Porfavor, Ingresar un usuario y una contraseña.");
            } else {
                if (modlog.getUsu().isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Porfavor, Ingresar un usuario.");
                } else if (modlog.getContra().isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Porfavor, Ingresar la contraseña.");
                } else {
                    if (modlog.validacion(modlog.getUsu(), modlog.getContra())) {
                        log.setVisible(false);
                        prin.iniciarPrincipal(0);
                    } else {
                        JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrecta");

                    }
                }
            }
        }
    }

}

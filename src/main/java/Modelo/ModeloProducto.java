/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.FileFilter;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

public class ModeloProducto {
   private String nom, desc, route; 
   private byte imagen[];

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    public void buscarImagen(){
        JFileChooser archivos = new JFileChooser();
        FileNameExtensionFilter filtro = new FileNameExtensionFilter(
                "JPG, PNG & GIF", "jpg", "png", "gif");
        
        archivos.setFileFilter(filtro);
        if(archivos.showOpenDialog(null) == JFileChooser.APPROVE_OPTION){
            setRoute(archivos.getSelectedFile().getAbsolutePath());
        }
    
    }
   
   
}

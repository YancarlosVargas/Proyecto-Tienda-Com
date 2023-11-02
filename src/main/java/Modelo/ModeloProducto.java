/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
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
        String rutacarpeta = getClass().getClassLoader().getResource("productos").getPath();
        File carpeta = new File (rutacarpeta);
        archivos.setCurrentDirectory(carpeta);
        FileNameExtensionFilter filtro = new FileNameExtensionFilter(
                "JPG, PNG & GIF", "jpg", "png", "gif");
        
        archivos.setFileFilter(filtro);
        if(archivos.showOpenDialog(null) == JFileChooser.APPROVE_OPTION){
            setRoute(archivos.getSelectedFile().getAbsolutePath());
        }
    
    }
    
    public byte[] convertirImagenes(String ruta){
        try{
            File archivo = new File(ruta);
            byte[] img = new byte[(int)archivo.length()];
            InputStream Imagen = new FileInputStream(archivo);
            Imagen.read(img);
            
            return img;
        }catch (Exception e){
            return null;
        }
       
        
    }
    
    public void insertarProducto(){
        Conexion cn = new Conexion();
        Connection conect = cn.iniciarConexion();
        
        String sql = "call Insersion_Producto(?,?,?,?)";
        
        try{
            PreparedStatement ps = conect.prepareStatement(sql);
            ps.setString(1, getNom());
            ps.setString(2, getDesc());
            ps.setBytes(3, getImagen());
            ps.setString(4, getRoute());
            ps.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Guardado");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
   
   
}

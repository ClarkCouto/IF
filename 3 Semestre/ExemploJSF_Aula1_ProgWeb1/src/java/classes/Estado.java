/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author 0729159
 */
public enum Estado {
    MATRICULADO(1),
    CANCELADO(2);
    
    private int estado;
    
    Estado(int estado){
        this.estado = estado;
    }
    
    public int getEstado(){
        return estado;
    }
}

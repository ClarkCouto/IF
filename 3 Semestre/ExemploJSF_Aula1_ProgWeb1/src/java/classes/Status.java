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
public enum Status {
    ATIVA(1),
    CONCLUIDA(2),
    EMANDAMENTO(3);
    
    private int status;
    
    Status(int status){
        this.status = status;
    }
    
    public int getStatus(){
        return status;
    }
    
}

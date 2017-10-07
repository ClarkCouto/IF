/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.LinkedList;

/**
 *
 * @author 0729159
 */
public class TarefaBean {
    private Tarefa tarefa = new Tarefa();
    private LinkedList<Tarefa> lista ;

    public Tarefa getPessoa() {
        return tarefa;
    }
    public void setTarefa(Tarefa tarefa) {
        this.tarefa = tarefa;
    }

    public LinkedList<Tarefa> getLista() {
        if(lista == null)
           lista = new LinkedList<>();
        return lista;
    }
   
    public void exclui(Tarefa tarefa){
        lista.remove(tarefa);
    }
    public void imprime(){
        System.out.println(toString());
    }
    
}

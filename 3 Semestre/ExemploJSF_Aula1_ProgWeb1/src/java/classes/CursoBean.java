/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.LinkedList;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author 0729159
 */

@ManagedBean
public class CursoBean {
    private Curso curso = new Curso();
    private LinkedList<Curso> lista = new LinkedList<>();

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    
    public LinkedList<Curso> getLista() {
        return lista;
    }

    public void inserirCurso(Curso curso){
        lista.add(curso);
    }
    
    public void setLista(LinkedList<Curso> lista) {
        this.lista = lista;
    }
   
    public void exclui(Curso curso){
        lista.remove(curso);
    }
    
    public void imprime(){
        System.out.println(toString());
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.Date;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author 0729159
 */
@ManagedBean
public class Aluno {
    private String nome;
    private long matricula;
    private Estado estado;
    private Date dataIngresso;

    public Aluno() {
    }

    public Aluno(String nome, long matricula, Estado estado, Date dataIngresso) {
        this.nome = nome;
        this.matricula = matricula;
        this.estado = estado;
        this.dataIngresso = dataIngresso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public long getMatricula() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula = matricula;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Date getDataIngresso() {
        return dataIngresso;
    }

    public void setDataIngresso(Date dataIngresso) {
        this.dataIngresso = dataIngresso;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "\tMatrícula: " + matricula + "\tEstado: " + estado + "\tData Ingresso: " + dataIngresso;
    }
    
    
}

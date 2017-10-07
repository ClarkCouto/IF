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
public class Tarefa {
    private int prioridade;
    private String nome;
    private Date dataLimite;
    private String detalhes;
    private Status status;

    public Tarefa() {
    }

    public Tarefa(int prioridade, String nome, Date dataLimite, String detalhes, Status status) {
        this.prioridade = prioridade;
        this.nome = nome;
        this.dataLimite = dataLimite;
        this.detalhes = detalhes;
        this.status = status;
    }

    public int getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(int prioridade) {
        this.prioridade = prioridade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataLimite() {
        return dataLimite;
    }

    public void setDataLimite(Date dataLimite) {
        this.dataLimite = dataLimite;
    }

    public String getDetalhes() {
        return detalhes;
    }

    public void setDetalhes(String detalhes) {
        this.detalhes = detalhes;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Prioridade: " + prioridade + "\tNome: " + nome + "\tData Limite: " + dataLimite + "\tDetalhes: " + detalhes + "\tStatus: " + status;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import javax.faces.bean.ManagedBean;

/**
 *
 * @author 0729159
 */
@ManagedBean
public class Curso {
    private String nome;
    private double cargaHoraria;
    private String conteudoPragmatico;
    private double valor;

    public Curso() {
    }

    public Curso(String nome, double cargaHoraria, String conteudoPragmatico, double valor) {
        this.nome = nome;
        this.cargaHoraria = cargaHoraria;
        this.conteudoPragmatico = conteudoPragmatico;
        this.valor = valor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(double cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public String getConteudoPragmatico() {
        return conteudoPragmatico;
    }

    public void setConteudoPragmatico(String conteudoPragmatico) {
        this.conteudoPragmatico = conteudoPragmatico;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "\tCarga Horária: " + cargaHoraria + "\tConteúdo Pragmático: " + conteudoPragmatico + "\tValor: " + valor;
    }
    
    public void imprime(){
        System.out.println(toString());
    }
    
}

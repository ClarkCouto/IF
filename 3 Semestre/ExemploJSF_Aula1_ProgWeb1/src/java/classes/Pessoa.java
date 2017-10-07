package classes;
import java.util.LinkedList;
import java.util.Objects;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class Pessoa {
    private String nome;
    
    public Pessoa(){}

    public Pessoa(String nome) {
        this.nome = nome;
    }
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Pessoa{" + "nome=" + nome + '}';
    }
    
    public void imprime(){
        System.out.println("Nome:"+nome);
    }
    
    public LinkedList<Pessoa> listar(){
        LinkedList<Pessoa> lista = new LinkedList();
        lista.add(new Pessoa("André"));
        lista.add(new Pessoa("Camila"));
        lista.add(new Pessoa("José"));
        lista.add(new Pessoa("Maria"));
        lista.add(new Pessoa("Pedro"));
        return lista;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.nome);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pessoa other = (Pessoa) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        return true;
    }
    
}

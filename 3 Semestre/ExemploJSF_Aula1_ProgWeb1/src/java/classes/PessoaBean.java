package classes;
import java.util.LinkedList;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class PessoaBean {
    private Pessoa pessoa = new Pessoa();
    private LinkedList<Pessoa> lista ;

    public Pessoa getPessoa() {
        return pessoa;
    }
    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public LinkedList<Pessoa> getLista() {
        if(lista == null)
           return pessoa.listar();
        return lista;
    }
   
    public void exclui(Pessoa p){
        lista.remove(p);
    }
    public void imprime(){
        System.out.println(toString());
    }

}

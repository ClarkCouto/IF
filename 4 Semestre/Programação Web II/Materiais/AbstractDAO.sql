public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    //COnfigura um objeto do tipo SessionFactory que irá prover todos os objetos de Sessão (Session)
    static {
        this.sessionFactory = new Configuration().configure().buildSessionFactory();        
    }
    //Obtem a Session
    public static Session getSession(){
        return this.sessionFactory.openSession();
    }
}



public abstract class AbstractDAO<T> {
    private Class classe;
    private Session session;
    public AbstractDAO(){
        this.classe = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    protected Session getSession(){
        if(this.session == null || !this.session.isOpen()){
            this.session = HibernateUtil.getSession();
        }
        return this.session;
    }
    public void save(T t){
        getSession().beginTransaction();
        getSession().save(t);
        getSession().close();
    }
    public void delete(T t){
        getSession().beginTransaction();
        getSession().delete(t);
        getSession().close();
    }
    public void alter(T t){
        getSession().beginTransaction();
        getSession().update(t);
        getSession().close();
    }
    public List<T> findAll(T t){
        return getSession().createCriteria(this.classe).list();
    }
         /**
     * Metodo responsavel por recuperar todos os objetos de uma tabela da base de dados de acordo
     * com o exemplo passado.
     *
     * @param filtro
     * @param matchMode
     * @param ignoreCase
     * @return lista
     */
    public List<T> findByExample(T filtro, MatchMode matchMode, boolean ignoreCase){
        org.hibernate.criterion.Example example = org.hibernate.criterion.Example.create(filtro);
        if(matchMode != null){
            example = example.enableLike(matchMode);
        }
        if(ignoreCase){
            example = example.ignoreCase();
        }
        return getSession().createCriteria(this.classe).add(example).list();
    }
}
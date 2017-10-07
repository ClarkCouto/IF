Take a closer look at the annotations defined in Listing 2.

The annotations are defined in javax.persistence, so you'll need to import that package.
@Enitity signifies that a particular class is an entity class. If the entity name is different from the table name, then the @Table annotation is used; otherwise, it isn't required.
@Column provides the name of the column in a table if it is different from the attribute name. (By default, the two names are assumed to be the same.)
@Id signifies the primary key.
@Version signifies a version field in an entity. JPA uses a version field to detect concurrent modifications to a data store record. When the JPA runtime detects multiple attempts to concurrently modify the same record, it throws an exception to the transaction attempting to commit last. This prevents you from overwriting the previous commit with stale data.
By default, all the fields are of type @Basic, which are persisted as-is in the database.
@GeneratedValue signifies a strategy to assign a unique value to your identity fields automatically. The types of strategies available are IDENTITY, SEQUENCE, TABLE, and AUTO. The default strategy is auto, the implementation of which is left to the JPA vendor to implement. (OpenJPA implements it through a table sequence.)





Listing 1. The Customer entity
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "CUSTOMER") //Name of the entity
public class Customer implements Serializable{
    private long custId;
    private String firstName;
    private String lastName;
    private String street;
    private String appt;
    private String city;    
    private String zipCode;
    private String custType;
    private Date updatedTime;

// Getters and setters go here 
......................
}


Listing 2. The Customer entity with annotations
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "CUSTOMER") //Name of the entity
public class Customer implements Serializable{
    @Id //signifies the primary key
    @Column(name = "CUST_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long custId;
    
    @Column(name = "FIRST_NAME", nullable = false,length = 50)
    private String firstName;
    
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;
    
// By default column name is same as attribute name
    private String street;
    
    @Column(name = "APPT",nullable = false)  
    private String appt;
    
    // By default column name is same as attribute name
    private String city;
    
    @Column(name = "ZIP_CODE",nullable = false)  
    // Name of the corresponding database column
    private String zipCode;
    
    @Column(name = "CUST_TYPE", length = 10)
    private String custType;

    @Version
    @Column(name = "LAST_UPDATED_TIME")
    private Date updatedTime;

// Getters and setters go here 
......................
}

Listing 3. A sample persistence.xml file
<?xml version="1.0"?>
<persistence>
    <persistence-unit name="testjpa" transaction-type="RESOURCE_LOCAL">
        <provider>
            org.apache.openjpa.persistence.PersistenceProviderImpl
        </provider>
        <class>entity.Customer</class>
        <properties>
            <property name="openjpa.ConnectionURL"          value="jdbc:derby://localhost:1527/D:\OpenJPA\Derby\testdb;create=true"/>
            <property name="openjpa.ConnectionDriverName" 
            value="org.apache.derby.jdbc.ClientDriver"/>
            <property name="openjpa.ConnectionUserName" value="admin"/>
            <property name="openjpa.ConnectionPassword" value="admin"/>
    <property name="openjpa.Log" value="SQL=TRACE"/>
        </properties>
    </persistence-unit>
</persistence>

Listing 4. sample code for object persistence
public static void main(String[] args) {
    EntityManagerFactory entityManagerFactory =  Persistence.createEntityManagerFactory("testjpa");
    EntityManager em = entityManagerFactory.createEntityManager();
    EntityTransaction userTransaction = em.getTransaction();
    
    userTransaction.begin();
    Customer customer = new Customer();
    customer.setFirstName("Charles");
    customer.setLastName("Dickens");
    customer.setCustType("RETAIL");
    customer.setStreet("10 Downing Street");
    customer.setAppt("1");
    customer.setCity("NewYork");
    customer.setZipCode("12345");
    em.persist(customer);
    userTransaction.commit();
    em.close();
    entityManagerFactory.close();
}

Listing 5. A code snippet for object persistence
EntityTransaction userTransaction = em.getTransaction();
    userTransaction.begin();
    em.persist(customer);
    userTransaction.commit();

Listing 6. Fetching data as an object
....
OpenJPAEntityManager oem = OpenJPAPersistence.cast(em);
Object objId = oem.getObjectId(customer);
Customer cust = em.find(Customer.class, objId);
....

A composite primary key
Listing 7. An identity class
public class CustomerId {
    public String firstName;
    public String lastName;
    // override equal() method
    //override hascode() method
..................
}

Listing 8. Using an identity class
@Entity
@IdClass(Customer.CustomerId.class)
public class Customer implements Serializable{
    @Id
    @Column(name = "FIRST_NAME", nullable = false, length = 50)
    private String firstName;

    @Id
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;

    private String street;

    @Column(name = "APPT",nullable = false)  
    private String appt;
    
................
}

Listing 9. implementing callback
@EntityListeners({CustListner.class})
@Entity(name = "CUSTOMER") //Name of the entity
public class Customer implements Serializable{
...
...
}
public class CustListner {
    @PreUpdate
    public void preUpdate(Customer cust) {
         System.out.println("In pre update");
    }
    @PostUpdate
    public void postUpdate(Customer cust) {
         System.out.println("In post update");
    }
}


Listing 10. An embeddable class
@Embeddable
public class Address implements Serializable{
    
    private String street;
    
    @Column(name = "APPT",nullable = false)  
    private String appt;

    private String city;
..
..
}


Listing 11. A sample entity using an embedded object
@Entity
public class Customer {
...............
    @Column(name = "FIRST_NAME", nullable = false,length = 50)
    private String firstName;
        
    @Embedded
    private Address address;
..............
}


Listing 12. A sample superclass in single-table Inheritance
@Entity(name = "CUSTOMER") 
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="CUST_TYPE", discriminatorType=DiscriminatorType.STRING,length=10)
@DiscriminatorValue("RETAIL")
public class Customer implements Serializable{
    @Id 
    @Column(name = "CUST_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long custId;
    
    @Column(name = "FIRST_NAME", nullable = false,length = 50)
    private String firstName;
    
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;
    
    @Embedded
    private Address address = new Address();
    
    @Column(name = "CUST_TYPE", length = 10)
    private String custType;
................
}


Listing 13. A sample subclass in single-table inheritance
@Entity(name = "ONLINECUSTOMER") //Name of the entity
@DiscriminatorValue("ONLINE")
public class OnlineCustomer extends Customer{
    @Column(name = "WEBSITE", length = 100)
    private String website;
    ............
}


Listing 15. Fetching only the subclass in single-table inheritance
..............
Query query = em.createQuery("SELECT customer FROM ONLINECUSTOMER customer");
List<OnlineCustomer> list= query.getResultList();


Listing 16. Distinguishing objects stored in a single table
SELECT t0.CUST_ID, t0.CUST_TYPE, t0.LAST_UPDATED_TIME, t0.APPT, t0.city, t0.street, t0.ZIP_CODE, t0.FIRST_NAME, t0.LAST_NAME, t0.WEBSITE FROM CUSTOMER t0 
WHERE t0.CUST_TYPE = 'ONLINE'


Listing 17. A superclass in joined-table inheritance
@Entity(name = "CUSTOMER") //Name of the entity
@Inheritance(strategy=InheritanceType.JOINED)
@DiscriminatorColumn(name="CUST_TYPE", discriminatorType=DiscriminatorType.STRING,length=10)
@DiscriminatorValue("RETAIL")

public class Customer implements Serializable{
    @Id //signifies the primary key
    @Column(name = "CUST_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long custId;
    
    @Column(name = "FIRST_NAME", nullable = false,length = 50)
    private String firstName;
    
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;
    
    @Embedded
    private Address address = new Address();
    
    @Column(name = "CUST_TYPE", length = 10)
    private String custType;
    .................
}


Listing 18. A sample subclass in joined-table inheritance
@Table(name="ONLINECUSTOMER")
@Entity(name = "ONLINECUSTOMER") //Name of the entity
@DiscriminatorValue("ONLINE")
@PrimaryKeyJoinColumn(name="CUST_ID",referencedColumnName="CUST_ID")
public class OnlineCustomer extends Customer{

    @Column(name = "WEBSITE", length = 100)
    private String website;
    ................
}


Listing 19. A sample superclass in table per class inheritance
@Entity(name = "CUSTOMER")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Customer implements Serializable{
    @Id //signifies the primary key
    @Column(name = "CUST_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long custId;
    
    @Column(name = "FIRST_NAME", nullable = false,length = 50)
    private String firstName;
    
    @Column(name = "LAST_NAME", length = 50)
    private String lastName;
    
    @Embedded
    private Address address = new Address();
    ...........
}


Listing 20. A sample subclass in table per class inheritance
@Entity(name = "ONLINECUSTOMER") //Name of the entity
public class OnlineCustomer extends Customer{
        
    @Column(name = "WEBSITE", length = 100)
    private String website;
    .................
}



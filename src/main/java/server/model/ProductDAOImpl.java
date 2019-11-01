package server.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ProductDAOImpl implements ProductDAO{
    public Product saveProduct(Product product) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();
        em.close();
        emf.close();
        return product;
    }

    public List<Product> getProducts() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("SELECT prod FROM produtos prod");
        List<Product> products = query.getResultList();
        em.close();
        emf.close();
        return products;
    }

    public List<Product> find(String name) {
        return new ArrayList<Product>();
    }

    public Product findByID(Long id) {
        return new Product();
    }

    public Product updateProduct(Long id) {
        return new Product();
    }

    public Product deleteProduct(Long id) {
        return new Product();
    }
}
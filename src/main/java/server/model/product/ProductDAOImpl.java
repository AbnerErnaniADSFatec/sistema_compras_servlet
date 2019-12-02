package server.model.product;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ProductDAOImpl implements ProductDAO{
    public Product saveProduct(Product product) {
        product.setId(this.generateID());
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

    public Product findByID(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Product product = em.find(Product.class, id);
        em.close();
        emf.close();
        return product;
    }

    public List<Product> findByValue(String value) {
        List<Product> products = this.getProducts();
        List<Product> filtered = new ArrayList<Product>();
        for ( Product product : products ) {
            if ( product.getName().toLowerCase().contains(value.toLowerCase()) || product.getDescription().toLowerCase().contains(value.toLowerCase()) ) {
                filtered.add(product);
            }
        }
        return filtered;
    }

    public List<Product> findByName(String name) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("SELECT prod FROM produtos prod WHERE prod.name = '" + name + "'");
        List<Product> products = query.getResultList();
        em.close();
        emf.close();
        return products;
    }

    public List<Product> findByCode(String code) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("SELECT prod FROM produtos prod WHERE prod.code = '" + code + "'");
        List<Product> products = query.getResultList();
        em.close();
        emf.close();
        return products;
    }
    
    public Product updateProduct(Product product) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Product prod = em.find(Product.class, product.getId());
        em.getTransaction().begin();
        prod.setName(product.getName());
        prod.setDescription(product.getDescription());
        prod.setCurrency(product.getCurrency());
        prod.setPrice(product.getPrice());
        prod.setCode(product.getCode());
        prod.setAmount(product.getAmount());
        prod.setUnit(product.getUnit());
        em.getTransaction().commit();
        em.close();
        emf.close();
        return prod;
    }

    public Product deleteProduct(Product product) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("estoque");     
        EntityManager em = emf.createEntityManager();
        Product prod = em.find(Product.class, product.getId());
        em.getTransaction().begin();
        em.remove(prod);
        em.getTransaction().commit();
        em.close();
        emf.close();
        return product;
    }

    public Long generateID() {
        List<Product> products = this.getProducts();
        Long id;
        try { id = ((products.get(products.size() - 1).getId()) + 1); }
        catch (Exception e) { id = 1L; }
        return id;
    }
}
package server.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ProductDAOImpl implements ProductDAO{
    public List<Product> getProducts();
    public List<Product> find(String name);
    public Product findByID(Long id);
    public Product updateProduct(Long id);
    public Product deleteProduct(Long id);
}
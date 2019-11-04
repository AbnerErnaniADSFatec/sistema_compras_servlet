package server.model;
import java.util.List;

public interface ProductDAO {
    public Product saveProduct(Product product);
    public List<Product> getProducts();
    public Product findByID(Long id);
    public List<Product> findByValue(String value);
    public List<Product> findByName(String name);
    public Product updateProduct(Product product_old, Product product_new);
    public Product deleteProduct(Product product);
}
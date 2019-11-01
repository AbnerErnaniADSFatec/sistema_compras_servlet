package server.model;
import java.util.List;

public interface ProductDAO {
    public Product saveProduct(Product product);
    public List<Product> getProducts();
    public List<Product> find(String name);
    public Product findByID(Long id);
    public Product updateProduct(Long id);
    public Product deleteProduct(Long id);
}
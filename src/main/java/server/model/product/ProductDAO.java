package server.model.product;
import java.util.List;

public interface ProductDAO {
    public Product saveProduct(Product product);
    public List<Product> getProducts();
    public Product findByID(Long id);
    public List<Product> findByValue(String value);
    public List<Product> findByName(String name);
    public List<Product> findByCode(String code);
    public Product updateProduct(Product product);
    public Product deleteProduct(Product product);
    public Long generateID();
}
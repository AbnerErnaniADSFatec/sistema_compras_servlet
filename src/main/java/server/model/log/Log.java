package server.model.log;

import java.util.List;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import server.model.product.Product;
import server.model.product.ProductDAOImpl;

public class Log {
    private Long id;
    private Date date;
    private List<Product> products;

    public Log() { 
        this.id = 1L;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Product> getProducts() {
        return this.products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Map<String, Float> getTotalByProduct() {
        Map<String, Float> list = new HashMap<String, Float>();
        for( Product prod : this.getProducts()) {
            list.put(prod.getCode(), (prod.getPrice() * prod.getAmount()));
        }
        return list;
    }

    public Float getTotal() {
        Float valor = new Float(0);
        for( Product prod : this.getProducts()) {
            valor = valor + (prod.getPrice() * prod.getAmount());
        }
        return valor;
    }
}
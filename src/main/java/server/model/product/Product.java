package server.model.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "produtos")
public class Product {
    @Id
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "currency")
    private String currency;
    @Column(name = "price")
    private float price;
    @Column(name = "code")
    private String code;
    @Column(name = "amount")
    private int amount;
    @Column(name = "unit")
    private String unit;

    public Product() { }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCurrency() {
        return this.currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public float getPrice() {
        return this.price;
    }

    public String getPriceFormat() {
        return (((int) this.getPrice() ) + "." + ((int) ((this.getPrice() - ((int) this.getPrice())) * 100)) + "");
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAmount() {
        return this.amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getUnit() {
        return this.unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
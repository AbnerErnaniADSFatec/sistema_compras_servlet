package server.model;

public class Product {
    private Long id;
    private String name;
    private String description;
    private float price;
    private String code;
    private int amount;
    private String unit;

    public Product(String name, String description, float price, String code, int amount, String unit) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.code = code;
        this.amount = amount;
        this.unit = unit;
    }

    public Long getId() {
        return this.id;
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

    public float getPrice() {
        return this.price;
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
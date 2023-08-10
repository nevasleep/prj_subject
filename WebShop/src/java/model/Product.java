package model;

public class Product {

    private int id;
    private int cate_id;
    private String name;
    private double price;
    private double sale_price;
    private String text;
    private int quantity;
    private String image;

    public Product() {
    }

    public Product(int id, int cate_id, String name, double price, double sale_price, String text, int quantity, String image) {
        this.id = id;
        this.cate_id = cate_id;
        this.name = name;
        this.price = price;
        this.sale_price = sale_price;
        this.text = text;
        this.quantity = quantity;
        this.image = image;
    }

    public Product(int id, String image, String name, double sale_price, int quantity) {
        this.id = id;

        this.name = name;

        this.sale_price = sale_price;

        this.quantity = quantity;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}

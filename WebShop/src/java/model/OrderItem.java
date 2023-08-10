package model;

public class OrderItem {

    private int id;
    private int order_id;
    private Product product;
    private int stock;

    public OrderItem() {
    }

    public OrderItem(int id, int order_id, Product product, int stock) {
        this.id = id;
        this.order_id = order_id;
        this.product = product;
        this.stock = stock;
    }

    public OrderItem(int order_id, Product product, int stock) {

        this.order_id = order_id;
        this.product = product;
        this.stock = stock;
    }

    public OrderItem(Product product, int stock) {
        this.product = product;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

}

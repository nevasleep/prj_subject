package model;

public class Order {

    private int id;
    private double total;
    private String userName;
    private String phone;
    private String address;

    public Order() {
    }

    public Order(int id, double total, String userName, String phone, String address) {
        this.id = id;
        this.total = total;
        this.userName = userName;
        this.phone = phone;
        this.address = address;
    }

    public Order(double total, String userName, String phone, String address) {

        this.total = total;
        this.userName = userName;
        this.phone = phone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}

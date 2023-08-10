package model;

public class Account {

    private int id;
    private String username;
    private String password;
    private String mail;
    private String phone;
    private String address;
    private int role;

    public Account() {
    }

    public Account(int id, String username, String password, String mail, String phone, String address, int role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public Account(String username, String password, String mail, String phone, String address, int role) {

        this.username = username;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
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

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
